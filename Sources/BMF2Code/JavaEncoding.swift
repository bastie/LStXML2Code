/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */
import LStXML2Code
import Foundation

open class JavaEncoding : AbstractTreeEncoding {
  public func encode(_ value: AbstractTree) throws -> Data? {
    
    let root = value.getRoot()
    result.append("""
          package codegen;
          
          import java.math.BigDecimal;
          
          """)
    traverse(node: root)
    
    let asString = result //"\(value.getRoot())"
    return asString.data(using: .utf8)
  }

  
  var result = ""
  
  var intend = 0
  public func traverse (node : Node) {
    var output = ""
    for _ in 0..<intend {
      output.append(" ")
    }

    // Handle this Node
    let name = node.getName()
    switch name {  // Note: statements end with break but blocks with return
    case "PAP" : // PAP is a class and a class is a block
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
      
      afterBlock.append("} // class \(node.getAttribute(name: "name")!)")
      result.append("\(afterBlock)\n")
      return // all PAP is read
    case "VARIABLES" :
      // in Java nothing to do
      result.append("\(output)\n")
      break
    case "INPUTS" :
      result.append("\(output)\n")
      break
    case "INPUT" :
      // in Java make bad public the input parameters
      let modifier = "public"
      let name = node.getAttribute(name: "name")!
      let type = node.getAttribute(name: "type")!
      let defaultValueAdding = nil != node.getAttribute(name: "default") ? " = \(node.getAttribute(name: "default")!)" : ""
      let terminator = ";"
      output.append("\(modifier) \(type) \(name)\(defaultValueAdding)\(terminator)")
      result.append("\(output)\n")
      break
    case "OUTPUTS" :
      // in Java make bad public the output parameters
      // it give two types of outputs, but I ignore this
      break;
    case "OUTPUT" :
      // in Java make bad public the output parameters
      let modifier = "public"
      let name = node.getAttribute(name: "name")!
      let type = node.getAttribute(name: "type")!
      let defaultValueAdding = nil != node.getAttribute(name: "default") ? " = \(node.getAttribute(name: "default")!)" : ""
      let terminator = ";"
      output.append("\(modifier) \(type) \(name)\(defaultValueAdding)\(terminator)")
      result.append("\(output)\n")
      break
    case "INTERNALS" :
      // nothing to do in Java
      break;
    case "INTERNAL" :
      // in Java make private the internal parameters
      let modifier = "private"
      let name = node.getAttribute(name: "name")!
      let type = node.getAttribute(name: "type")!
      let defaultValueAdding = nil != node.getAttribute(name: "default") ? " = \(node.getAttribute(name: "default")!)" : ""
      let terminator = ";"
      output.append("\(modifier) \(type) \(name)\(defaultValueAdding)\(terminator)")
      result.append("\(output)\n")
      break
    case "Comment" :
      // note: change // to /* */ for multiline XML comments
      output.append("/* \(node.getAttribute(name: "value")!.trimmingCharacters(in: .whitespaces)) */")
      result.append("\(output)\n")
      break
    case "CONSTANTS" : 
      // nothing to tdo in Java
      break;
    case "CONSTANT" :
      // at the moment CONSTANTS use value attribute instead to VARIABLES with default
      
      // in Java make private the internal parameters
      let modifier = "private final"
      let name = node.getAttribute(name: "name")!
      let type = node.getAttribute(name: "type")!
      let defaultValueAdding = " = \(node.getAttribute(name: "value")!)" // constant must have a value
      let terminator = ";"
      output.append("\(modifier) \(type) \(name)\(defaultValueAdding)\(terminator)")
      result.append("\(output)\n")
      break
    case "METHODS" :
      // nothing to tdo in Java
      break
    case "MAIN" : // other name for a special method
      fallthrough
    case "METHOD" : // method is a block
      var beforeBlock = output
      var afterBlock = output

      // decision only MAIN is public
      // in Java make private the internal parameters
      let name = name == "MAIN" ? name : node.getAttribute(name: "name")!
      let returnType = "void" // descision
      let modifier = name == "MAIN" ? "public final" : "private final"
      beforeBlock.append("\(modifier) \(returnType) \(name)() {")
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
      let terminator = ";"
      output.append("\(receiver) ()\(terminator)")
      result.append("\(output)\n")
      break
    case "EVAL" : // "Java-like" coding in attribute exec
      let code = node.getAttribute(name: "exec")!
      let terminator = ";"
      output.append("\(code)\(terminator)")
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
      
      afterBlock.append("} // end-if \(expression)")
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

  
}


