/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

/// A value Node, e.g. in programming language with value types these value
///
/// - Note: A ValueNode is a Leaf and can not have a child
public class ValueNode : Node, CustomDebugStringConvertible {

  public var debugDescription: String {
    get {
      return "[ValueNode value='\(asString)']"
    }
  }
  
  public init(newParent: Node? = nil, with newValue: String) {
    super.init(newParent: newParent)
    self.setValue(stringRepresentation: newValue)
  }
  public init(with newValue: String) {
    super.init()
    self.setValue(stringRepresentation: newValue)
  }
  
  private var asString : String = ""
  
  public func setValue (stringRepresentation : String) {
    self.asString = stringRepresentation
  }
  
  public func setValue (newInt : Int) {
    self.asString = "\(newInt)"
  }
  
  public func getValue () -> String {
    return self.asString
  }
  
  override public func addAndSetParent(child: Node) {
    fatalError("Value node can not have a child.")
  }

  public func isInt () -> Bool {
    if let _ = Int(self.asString) {
      return true
    }
    return false
  }
  public func isFloat () -> Bool {
    if let _ = Float(self.asString) {
      return true
    }
    return false
  }
  public func isDouble () -> Bool {
    if let _ = Double (self.asString) {
      return true
    }
    return false
  }
}
