/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

/// A value Node, e.g. in programming language with value types these value
///
/// - Note: A FloatNumberNode is a Leaf and can not have a child
///
/// - Note: value is stored as string because Double 0.093 is same as 0.09299999999999999
public class FloatNumberNode : Node, CustomDebugStringConvertible {
  
  public var debugDescription: String {
    get {
      return "[Float value as string='\(asString)']"
    }
  }
  
  public init(newParent: Node? = nil, with newValue: String) {
    super.init(newParent: newParent)
    self.setValue(with: newValue)
  }

  private var asString = "0.0"
  
  /// Set the new Value and return the oldValue. On error return nil
  public func setValue (stringRepresentation : String) -> Double?{
    if let newValue = Double(stringRepresentation) {
      let oldValue = self.asString
      self.asString = stringRepresentation
      return Double(oldValue)
    }
    if let result = Double(asString) {
      return result
    }
    return nil
  }
  
  public func setValue (with : String) {
    self.asString = with
  }
  
  public func getValue () -> String {
    return self.asString
  }
  
  override public func addAndSetParent(child: Node) {
    fatalError("Value node can not have a child.")
  }
}
