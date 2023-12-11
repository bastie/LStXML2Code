/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */
import LStXML2Code
import Foundation


/// ``SwiftEncoding`` unter Verwendung der [JavApi⁴Swift](https://github.com/bastie/JavApi4Swift) Version 0.7.3 oder höher
///
/// Basis sind die Java8 Anweisungen die das [ITZBund](https://www.itzbund.de) verwendet und durch die **JavApi⁴Swift** abgebildet werden.
open class SwiftEncoding : AbstractTreeEncoding {
  public func encode(_ value: AbstractTree) throws -> Data? {
    
    let root = value.getRoot()
    result.append("""
          /// Generated with BMF2Code v\(BMF2Code.VERSION) @\(Date())
          
          import Foundation
          import JavApi
          
          public typealias BigDecimal = java.math.BigDecimal
          
          
          """)
    traverse(node: root)
    
    // not good but work - modify source after generation
    
    // add initalizer
    let parts = result.split(separator: "{",maxSplits: 1)
    result = "\(parts[0]) {\n\n"
    result.append("  public init (\n")
    for (offset,name) in Array(inputVars.keys).sorted(by: {$0 < $1}).enumerated() {
      result.append("    ")
      let type = inputVars[name]!
      result.append("\(name) : \(type) = \(type)()")
      if offset + 1 < inputVars.count {
        result.append(",\n")
      }
    }
    result.append(") {\n")
    for name in inputVars.keys {
      result.append("    ")
      result.append("self.\(name) = \(name)")
      result.append("\n")
    }
    result.append("}")
    result.append("\n\(parts[1])")
    
    let asString = result //"\(value.getRoot())"
    return asString.data(using: .utf8)
  }
  
  
  var result = ""
  
  var inputVars : [String:String] = [:]
  
  var intend = 0
  open func traverse (node : Node) {
    var output = ""
    for _ in 0..<intend {
      output.append(" ")
    }
    
    // Handle this Node
    let name = node.getName()
    switch name {  // Note: statements end with break but blocks with return
    case "PAP" : // PAP is a class/struct and a class/struct is a block
                 // root
      var beforeBlock = output
      var afterBlock = output
      
      beforeBlock.append("public class \(node.getAttribute(name: "name")!) {")
      result.append("\(beforeBlock)\n")
      
      for child in node.getChilds() {
        intend += 1
        traverse(node: child)
        intend -= 1
      }
      
      afterBlock.append("} // type \(node.getAttribute(name: "name")!)")
      result.append("\(afterBlock)\n")
      return // all PAP is read
    case "VARIABLES" :
      // in Swift nothing to do
      output.append("// MARK: Variables")
      result.append("\(output)\n")
      break
    case "INPUTS" :
      output.append("// MARK: Inputvariables")
      result.append("\(output)\n")
      break
    case "INPUT" :
      // in Swift make bad public the input parameters
      let modifier = "public"
      let name = node.getAttribute(name: "name")!
      let type = getSwiftType(for: node.getAttribute(name: "type")!)
      
      var defaultValueAdding = nil != node.getAttribute(name: "default") ? " = \(node.getAttribute(name: "default")!)" : ""
      if defaultValueAdding.starts(with: " = new ") {
        let withoutNew = defaultValueAdding.split(separator: " = new ")[0]
        defaultValueAdding = " = \(withoutNew)"
      }
      
      // store for initalizer
      // - BugFix: if default value exist, do not include in initalizer
      if defaultValueAdding.count == 0 {
        self.inputVars [name] = type
      }
      
      output.append("\(modifier) var \(name) : \(type)\(defaultValueAdding)")
      result.append("\(output)\n")
      break
    case "OUTPUTS" :
      // in Swift make bad public the output parameters
      // it give two types of outputs, but I ignore this
      output.append("// MARK: Outputvariables")
      result.append("\(output)\n")
      break;
    case "OUTPUT" :
      // in Swift make bad public the output parameters
      let modifier = "public"
      let name = node.getAttribute(name: "name")!
      let type = getSwiftType(for: node.getAttribute(name: "type")!)
      var defaultValueAdding : String? = node.getAttribute(name: "default")
      // in Swift we init Outputs explicite
      if let defaultValue = defaultValueAdding {
        if defaultValue.starts(with: "new ") {
          let withoutNew = defaultValue.split(separator: " ")[1]
          defaultValueAdding = " = \(withoutNew)"
        }
      }
      else {
        defaultValueAdding = " = \(type)()"
      }
      
      output.append("\(modifier) var \(name) : \(type) \(defaultValueAdding!)")
      result.append("\(output)\n")
      break
    case "INTERNALS" :
      // nothing to do in Swift
      output.append("// MARK: internal variables")
      result.append("\(output)\n")
      break;
    case "INTERNAL" :
      // in Swift make private the internal parameters
      let modifier = "private"
      let name = node.getAttribute(name: "name")!
      let type = getSwiftType(for: node.getAttribute(name: "type")!)
      var defaultValueAdding = nil != node.getAttribute(name: "default") ? " = \(node.getAttribute(name: "default")!)" : ""
      if defaultValueAdding.starts(with: " = new ") {
        let withoutNew = defaultValueAdding.split(separator: " = new ")[0]
        defaultValueAdding = " = \(withoutNew)"
      }
      output.append("\(modifier) var \(name): \(type)\(defaultValueAdding)")
      result.append("\(output)\n")
      break
    case "Comment" :
      // note: change // to /* */ for multiline XML comments
      output.append("/* \(node.getAttribute(name: "value")!.trimmingCharacters(in: .whitespaces)) */")
      result.append("\(output)\n")
      break
    case "CONSTANTS" :
      // nothing to do in Swift
      output.append("// MARK: constants")
      result.append("\(output)\n")
      break;
    case "CONSTANT" :
      // at the moment CONSTANTS use value attribute instead to VARIABLES with default
      
      // in Swift make private the internal parameters
      let modifier = "private let"
      let name = node.getAttribute(name: "name")!
      let type = getSwiftType(for: node.getAttribute(name: "type")!)
      var defaultValueAdding = nil != node.getAttribute(name: "value") ? " = \(node.getAttribute(name: "value")!)" : ""
      if defaultValueAdding.starts(with: " = new ") {
        let withoutNew = defaultValueAdding.split(separator: " = new ")[0]
        defaultValueAdding = " = \(withoutNew)"
      }
      // TODO: Array can also be an INPUT / OUTPUT
      // TODO: Array can include an array
      if defaultValueAdding.trimmingCharacters(in: .whitespaces).starts(with: "= {") {
        defaultValueAdding = defaultValueAdding.replacingOccurrences(of: "{", with: "[")
        defaultValueAdding = defaultValueAdding.replacingOccurrences(of: "}", with: "]")
      }
      output.append("\(modifier) \(name) : \(type)\(defaultValueAdding)")
      result.append("\(output)\n")
      break
    case "METHODS" :
      // nothing to tdo in Swift
      break
    case "MAIN" : // other name for a special method
      fallthrough
    case "METHOD" : // method is a block
      var beforeBlock = output
      var afterBlock = output
      
      // decision only MAIN is public
      // in Swift make private the internal parameters
      let name = name == "MAIN" ? name : node.getAttribute(name: "name")!
      let returnType = "void" // descision
      let modifier = name == "MAIN" ? "public " : "private "
      beforeBlock.append("\(modifier) func \(name)()")
      if returnType != "void" {
        beforeBlock.append(" -> \(returnType)")
      }
      beforeBlock.append("{")
      result.append("\(beforeBlock)\n")
      
      for child in node.getChilds() {
        intend += 1
        traverse(node: child)
        intend -= 1
      }
      
      afterBlock.append("} // method \(name)")
      result.append("\(afterBlock)\n")
      
      return
    case "EXECUTE" : // in COBOL is named CALL and the names of method and var names are like old Host-COBOL-prg
      let receiver = node.getAttribute(name: "method")!
      output.append("\(receiver) ()")
      result.append("\(output)\n")
      break
    case "EVAL" : // "Java-like" coding in attribute exec
      var code = node.getAttribute(name: "exec")!
      
      // needed spaces
      var parts = code.split(separator: "=")
      code = code.starts(with: "=") ? " = " : ""
      for (offset, part) in parts.enumerated() { // TODO: using map
        code.append(part.trimmingCharacters(in: .whitespaces))
        if offset+1 < parts.count {
          code.append(" = ")
        }
      }
      parts = code.split(separator: "= new ")
      code = ""
      for (offset,part) in parts.enumerated() {
        if 0 == offset {
          code.append("\(part)")
        }
        else {
          code.append("= \(part)")
        }
      }
      
      
      output.append("\(code)")
      result.append("\(output)\n")
      break
    case "IF" : // if is a block
      var beforeBlock = output
      var afterBlock = output
      
      var expression = node.getAttribute(name: "expr")!
      // demasking XML
      expression = expression.replacingOccurrences(of: "&lt;", with: "<")
      expression = expression.replacingOccurrences(of: "&gt;", with: ">")
      
      
      beforeBlock.append("if (\(expression)) {")
      result.append("\(beforeBlock)\n")
      
      for child in node.getChilds() {
        intend += 1
        traverse(node: child)
        intend -= 1
      }
      
      afterBlock.append("} // end-if for: \(expression)")
      result.append("\(afterBlock)\n")
      
      return
    case "THEN" :
      // decision THEN is integrated in IF with open and close brackes
      break;
    case "ELSE" : // else is a block
      var beforeBlockCloseIf = output
      var beforeBlockElse = output
      beforeBlockCloseIf.append("}")
      beforeBlockElse.append("else {") // close the THEN and open the ELSE
      result.append("\(beforeBlockCloseIf)\n")
      result.append("\(beforeBlockElse)\n")

      for child in node.getChilds() {
        intend += 1
        traverse(node: child)
        intend -= 1
      }
      
      // afterBlock is integrated in IF with closing brake
      
      return
    default:
      fatalError("Unsupported XMLTag \(name)")
      //result.append("\(output)\n")
      break
    }
    
    // Looking for handling child nodes
    for child in node.getChilds() {
      intend += 1
      traverse(node: child)
      intend -= 1
    }
    
  }
  
  func getSwiftType (for typeFromXML : String) -> String{
    var swiftType = switch typeFromXML {
    case "int" : "Int"
    case "double" : "Double"
    default : typeFromXML
    }
    if swiftType.contains("[") { // Array type
      swiftType = swiftType.replacingOccurrences(of: "[", with: "")
      swiftType = swiftType.replacingOccurrences(of: "]", with: "")
      swiftType = "[\(swiftType)]"
    }
    return swiftType
  }
}
