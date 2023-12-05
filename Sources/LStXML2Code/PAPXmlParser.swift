/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */
import Foundation


class PAPXmlParser : NSObject, XMLParserDelegate {
  
  private var currentNode : Node?
  private let ast : PAPTree
  init (newAst : PAPTree) {
    self.ast = newAst
  }

  public func parserDidStartDocument(_ parser: XMLParser) {
    //print("Line number: \(parser.lineNumber)")
  }
  
  public func parserDidEndDocument(_ parser: XMLParser) {
    //print("Line number: \(parser.lineNumber)")
  }
  
  // parse comment
  public func parser(_ parser: XMLParser, foundComment comment: String) {
    let node = Node (newParent: self.currentNode)
    node.setName("Comment")
    node.addAttribute("value", comment)
    currentNode?.add(child: node)
  }
  
  let commentAsAttribute = true
  
  // parse tag (start)
  public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
    // create new node
    let node = Node (newParent: self.currentNode)
    node.setName(elementName)
    node.addAttributes (attributeDict)
    // add node to tree
    if let current = self.currentNode {
      current.add(child: node)
    }
    // set node as current
    self.currentNode = node
  }
  
  // parse tag (end)
  public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
    
    // decision: add root only at the end of parsing
    if "PAP" == elementName {
      print("",terminator: "")
    }
    
    if let current = self.currentNode {
      if current.isRoot() {
        ast.setRoot(current)
      }
      else {
        self.currentNode = current.getParent()!
      }
    }
  }
  
  
  // MARK: quality and security

  // In result of parse text never is calling with existing XMLs the functions throws fatalError
  public func parser(_ parser: XMLParser,foundCharacters string: String){
    if (!string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
      fatalError("Text not expected but found \(string)")
    }
  }
  
}
