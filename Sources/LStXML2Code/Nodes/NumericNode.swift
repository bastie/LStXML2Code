/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

/// A value Node, e.g. in programming language with value types these value
///
/// - Note: A NumericNode is a Leaf and can not have a child
public class NumericNode : Node, CustomDebugStringConvertible {
  
  public var debugDescription: String {
    get {
      return "[Integer value='\(value)']"
    }
  }
  
  public init(newParent: Node? = nil, with newValue: Int) {
    super.init(newParent: newParent)
    self.setValue(with: newValue)
  }
  
  private var value : Int = 0
  
  /// Set the new Value and return the oldValue. On error return nil
  public func setValue (stringRepresentation : String) -> Int?{
    if let newValue = Int(stringRepresentation) {
      self.value = newValue
      return self.value
    }
    return nil
  }
  
  public func setValue (with : Int) {
    self.value = with
  }
  
  public func getValue () -> Int {
    return self.value
  }
  
  override public func addAndSetParent(child: Node) {
    fatalError("Value node can not have a child.")
  }
}
