/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */
import LStXML2Code
import Foundation

open class SwiftEncoding : AbstractTreeEncoding {
  public func encode(_ value: AbstractTree) throws -> Data? {
    
    let root = value.getRoot()
    result.append("""
          /// Generated with BMF2Code v\(BMF2Code.VERSION) @\(Date())
          
          import Foundation
          
          """)
    traverse(node: root)
    
    result.append (getAdditionalTypes())
    
    // add initalizer
    let parts = result.split(separator: "{",maxSplits: 1)
    result = "\(parts[0]) {\n\n"
    result.append("  public init (\n")
    for (offset,name) in inputVars.keys.enumerated() {
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
      self.inputVars [name] = type
      
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
      var beforeBlock = output
      
      beforeBlock.append("} else {") // close the THEN and open the ELSE
      result.append("\(beforeBlock)\n")
      
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

  public func getAdditionalTypes() -> String {
    var result = ""
    // MARK: additional Type BigInteger
    result.append(
    """
    
    /// BigDecimal implementation in Swift - see JavApi⁴Swift project
    public struct BigDecimal : CustomStringConvertible {
    
      private var scale : Int = Int.max
      private var roundingMode : Int = ROUND_UNSET
    
      public static let ZERO = BigDecimal(0.0)
      public static let ONE = BigDecimal(1.0)
      public static let ROUND_UP = 0
      public static let ROUND_DOWN = 1
      public static let ROUND_UNSET = -1

      private var value : Double
      public init (_ newValue : Double = 0.0) {
        self.value = newValue
      }
      public init (_ newValue : Int) {
        self.value = Double(newValue)
      }
      public init (_ newValue : Int64) {
        self.value = Double(newValue)
      }

      public static func valueOf (_ newValue : Int) -> BigDecimal {
        return BigDecimal(newValue)
      }
      public static func valueOf (_ newValue : Int64) -> BigDecimal {
        return BigDecimal(newValue)
      }
      public static func valueOf (_ newValue : Double) -> BigDecimal {
        return BigDecimal(newValue)
      }
    
      public func subtract (_ bd : BigDecimal) -> BigDecimal {
        let value : Double = self.value - bd.value
        var result = BigDecimal(value)
        result.scale = self.scale
        result.roundingMode = self.roundingMode
        return result
      }
      
      public func multiply (_ bd : BigDecimal) -> BigDecimal{
        let value : Double = self.value * bd.value
        var result = BigDecimal(value)
        result.scale = self.scale
        result.roundingMode = self.roundingMode
        return result
      }
      public func divide (_ bd : BigDecimal) -> BigDecimal{
        let value : Double = self.value / bd.value
        var result = BigDecimal(value)
        result.scale = max(self.scale,bd.scale)
        result.roundingMode = self.roundingMode
        return result
      }
      public func divide (_ bd : BigDecimal, _ accuracy : Int, _ round : Int) -> BigDecimal{
        let value : Double = self.value / bd.value
        var result = BigDecimal(value)
        result.scale = self.scale
        result.roundingMode = self.roundingMode
        return result
      }
      public func add (_ bd : BigDecimal) -> BigDecimal{
        let value : Double = self.value + bd.value
        var result = BigDecimal(value)
        result.scale = self.scale
        result.roundingMode = self.roundingMode
        return result
      }
      public func setScale (_ newScale : Int, _ roundingMode : Int = BigDecimal.ROUND_UNSET) -> BigDecimal {
        var result = BigDecimal(self.value)
        result.scale = newScale
        result.roundingMode = roundingMode
        return result
      }

      public func compareTo (_ bg : BigDecimal) -> Int {
        if self.roundingMode == BigDecimal.ROUND_UNSET && bg.roundingMode == BigDecimal.ROUND_UNSET {
          if self.value == bg.value {return 0}
          if self.value > bg.value {return 1}
          return -1
        }
        let newScale = max (self.scale, bg.scale)
        let factor : Int = (pow (10,newScale) as NSDecimalNumber).intValue
        let quotiend : Double = Double(factor)
        
        let roundedSelf = Int (Double(Int(self.value * quotiend)) / quotiend)
        let roundedBg = Int (Double(Int(bg.value * quotiend)) / quotiend)

        if roundedSelf == roundedBg {return 0}
        if roundedSelf > roundedBg {return 1}
        return -1
      }
    
      public func longValue () -> Int64 {
        return Int64(self.value)
      }
    }
    """)
    
    
    // ----------------
    return result
  }

}


