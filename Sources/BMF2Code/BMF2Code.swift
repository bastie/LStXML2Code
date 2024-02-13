/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */
import Foundation
import LStXML2Code

@main
/// Quelletxtgenerator zur Nutzung des durch das BMF bereitgestellten Pseudo-Quelltext zur Berechnung der Lohnsteuerabzüge bei der Einkommensteuer.
public struct BMF2Code {
  /// Interne Version
  public static let VERSION = "1.0.3"
  
  
  // MARK: main entry point
  /// Einsprungspunkt der Kommandozeilenanwendung
  static func main () {
    var cmdLineArgs = CommandLine.arguments
#if DEBUG
    debugPrint(cmdLineArgs)
    // if run in xcode use invocation instead of xcode edit scheme
    if let _ = ProcessInfo().environment["__XCODE_BUILT_PRODUCTS_DIR_PATHS"] {
      let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].path()
      let project = "workspace/LStXML2Code/"
      let xmls = "Tests/LStXML2CodeTests/xml/"
      let test = "Lohnsteuer2023AbJuli.xml"
      let lang = "Swift"
      cmdLineArgs = [CommandLine.arguments[0],"--lang=\(lang)","\(documents)\(project)\(xmls)\(test)"]
    }
#endif
    let prg = BMF2Code()
    let runtimeParameter = prg.evalArgs(arguments: cmdLineArgs)
   
    if let stopNow = runtimeParameter["skipRunning"]{
      if stopNow == "true" {
        exit(0)
      }
    }
    
    do {
      let source = runtimeParameter["in"]!
      
      let sourceURL : URL? = source.starts(with: "https://") ? URL(string: source) : URL(filePath: source)

      // TODO: checkResourceIsReachable with Swift 5.9 only implemented for file system - implement something for other protocols to support these
      // URL ist reachable?
      guard ((try? sourceURL?.checkResourceIsReachable()) != nil) else {
        print ("Input not exist \(source)")
        _ = exit(3)
      }
      
      let input = try Data(contentsOf: sourceURL!)
      let ast = XmlPAP.parse(xmlData: input)
      
      let encoder = switch runtimeParameter["lang"] {
      case "java" : AbstractTreeEncoder(encoding:JavaEncoding())
      case "swift": AbstractTreeEncoder(encoding:SwiftEncoding())
      default:
        AbstractTreeEncoder(encoding:SwiftEncoding())
      }
      let encodedData = try encoder.encode(ast)
      if let encodedString = String (data: encodedData, encoding: .utf8) {
        if let outputFileName = runtimeParameter["out"] {
          try encodedString.write(to: URL(filePath: outputFileName), atomically: true, encoding: String.Encoding.utf8)
        }
        else {
          print("\(encodedString)")
        }
      }
      else {
        fatalError("@encoding")
      }
    }
    catch {
      print ("Unknown error")
      exit(255)
    }
  }
  
  
  // MARK: handling argument
  // handwritten parameter evaluation
  /// Evaluierung der Parameter
  /// - Parameters:
  /// - Parameter arguments die Argumente to verarbeitet werden sollen
  /// - Parameter reversedCall Information, ob die Funktion sich selbst aufgerufen hat
  /// - Returns lediglich die benötigten Parameter zur weiteren Verarbeitung
  func evalArgs (arguments : [String], reversedCall : Bool = false) -> [String:String] {
    let supportedLang = ["java", "swift"]
    let supportedLanguages = "\(supportedLang)".replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "").replacingOccurrences(of: "\"", with: "")

    var result : [String:String] = [:]
    
    let args = splitArgs(arguments: arguments)
    
    for var index in 1..<args.count {
      let arg = args[index]
      switch true {
      case arg == "-H" :
        print ("""
        Return codes:
          0 = ok
          1 = argument -o without follow parameter
          2 = unsupported programming language, accepted:
              \(supportedLanguages)
          3 = missing input
        255 = not specific error
        """)
        break
      case arg == "--help" || arg == "-h" :
        _ = evalArgs(arguments: [args[0],"-V"],reversedCall: true)
        var prgName = CommandLine.arguments[0].split(separator: "/").last!
        prgName =  CommandLine.arguments[0].split(separator: "\\").last!
        print ("""
        
        Usage:
          \(prgName) [-HhVvo output] [--lang=<name>] input
        
        Arguments:
        -H               = print RC of programm
        -h --help        = print this help and exit
        --lang=<name>    = target output for programming language <name>
                           supported: \(supportedLanguages)
        -o <name>        = print output in file named <name>
        -v --version     = short version string
        -V               = long version string
        
        """)
        _ = evalArgs(arguments: [args[0],"-H"],reversedCall: true)
        result["skipRunning"] = "true"
      case arg.starts(with: "--lang=") :
        let actuallyLang = arg.split(separator: "=")[1].lowercased()
        guard supportedLang.contains(actuallyLang) else {
          print ("Argument --lang accepts only \(supportedLang)".replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: ""))
          _ = exit(2)
        }
        result ["lang"] = actuallyLang
        break
      case arg == "-o" :
        index += 1
        guard index < args.count else {
          print ("Argument -o need parameter with target file")
          _ = exit(1)
        }
        result ["out"] = args[index]
        break
      case arg == "-v" || arg == "--version" :
        print("""
        BMF2Code v\(BMF2Code.VERSION)
        """)
        break
      case arg == "-V" :
        print("""
        BMF2Code v\(BMF2Code.VERSION)
        Copyright:\t\t Copyright © 2023 Sebastian Ritter
        Home:\t\t\t https://github.com/bastie
        License:\t\t MIT
        Started executable:\t \(args[0])
        """)
      default :
        break
      }
    }
    
    if (!reversedCall) {
      // check for input file
      guard args.count > 1 else {
        print ("Missing input file name")
        _ = exit (3)
      }
      guard !["-o"].contains(args[args.count - 1]) else {
        print ("Missing input file name at end")
        _ = exit(3)
      }
      guard !args[args.count - 1].starts(with: "-") else {
        print ("Missing input file name at end.")
        _ = exit(3)
      }
      // set input file
      result["in"] = args[args.count-1]
      
      // check default runtime values
      // check for missing default language
      if !result.keys.contains("lang") {
        result["lang"] = "java"
      }
    }
    return result
  }
  
  /// Separate concatenated short arguments
  /// - Parameters:
  /// - Parameter arguments as String array
  /// - Returns arguments as String array
  func splitArgs (arguments : [String]) -> [String]{
    var result : [String] = []
    for arg in arguments {
      // long argument
      if arg.starts(with: "--") {
        result.append(arg)
      }
      // short argument
      else if arg.starts(with: "-") {
        // concatenated arguments
        if arg.count > 2 {
          arg.enumerated().forEach {
            offset, next in
            if offset > 0 {
              result.append("-\(next)")
            }
          }
        }
        else {
          result.append(arg)
        }
      }
      // untyped argument
      else {
        result.append(arg)
      }
    }
    return result
  }
  
}


