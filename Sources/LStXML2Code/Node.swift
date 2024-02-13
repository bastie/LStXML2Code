/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

public class Node : CustomStringConvertible {
  public var description: String {
    var result = ""
    result.append("[\(name): ")
    if !self.attributes.isEmpty {
      if self.attributes.count > 0 {
        result.append("(")
        for (index,attr) in self.attributes.enumerated() {
          result.append("\(attr.key)=\(attr.value)")
          if index + 1 < self.attributes.count {
            result.append(",")
          }
        }
        result.append(")")
      }
    }
    
    for child in childs {
      result.append(child.description)
    }
    
    result.append("]")
    result.append("\n")
    return result
  }
  
  private var name = ""
  
  
  private lazy var childs = [Node]()
  private var parent : Node?
  private var attributes : [String:String] = [:]
  
  public init(newParent: Node? = nil) {
    self.parent = newParent
    parent?.addAndSetParent(child: self)
  }
  
  public func getChilds () -> [Node] {
    return self.childs
  }

  public func addAndSetParent (child : Node) {
    self.childs.append(child)
    child.parent = self
  }
  
  // using e.g. by if-then-else
  func setChild (at: Int, child : Node) {
    self.childs.insert(child, at: at) // insert before elem
    self.childs.remove(at: at + 1) // remove the moved elem
  }
  
  func getChild (at: Int) -> Node? {
    guard at < self.childs.count else {
      return nil
    }
    return self.childs[at]
  }
  func removeChild (node : Node) -> Node? {
    for (offset, maybeSelf) in self.childs.enumerated() {
      if node === maybeSelf { // self reference? not compare content or whatever
        self.childs.remove(at: offset)
        return self
      }
    }
    return nil
  }
  func removeChildAndRemoveParent (node : Node) -> Node? {
    for (offset, maybeSelf) in self.childs.enumerated() {
      if node === maybeSelf { // self reference? not compare content or whatever
        self.childs.remove(at: offset)
        node.parent = nil
        return self
      }
    }
    return nil
  }

  public func isLeaf () -> Bool {
    return childs.isEmpty
  }
  
  public func isRoot () -> Bool {
    return self.parent == nil
  }
  
  public func addAttributes (_ attr: [String:String]) {
    for (key,value) in attr {
      self.addAttribute(key, value)
    }
  }
  public func addAttribute (_ key : String, _ value : String) {
    if self.attributes.keys.contains(key) {
      self.attributes.removeValue(forKey: key)
    }
    self.attributes [key] = value
  }
  
  public func getAttributes () -> [String:String] {
    return self.attributes
  }
  public func getAttribute (name : String) -> String? {
    return self.attributes[name]
  }
  
  public func getName () -> String {
    return self.name
  }
  public func setName (_ newName : String) {
    self.name = newName
  }
  public func getParent () -> Node? {
    return self.parent
  }
  
  /// Set new parent to the node.
  ///
  /// This function remove if existing the parent and itself from parent child list and then add self to the parent child list and set the parent here
  ///
  /// - Parameters:
  /// - Parameter with newParent to set
  /// - Returns self
  public func setParent (with newParent : Node?) -> Node {
    if let current = self.parent {
      current.removeChild (node: self)?.parent = nil
    }
    self.parent?.addAndSetParent(child: self)
    return self
  }
}

