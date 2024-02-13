/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

/// A value Node, e.g. in programming language with value types these value
///
/// - Note: A IdentiferNode is a Leaf and can not have a child
public class IdentiferNode : Node, CustomDebugStringConvertible {
  
  public var debugDescription: String {
    get {
      return "[Identifier named >>>\(super.getName())<<<]"
    }
  }
  
  public init(newParent: Node? = nil, with name : String) {
    super.init(newParent: newParent)
    super.setName(name)
  }
  
  public func getIdentifer () -> String {
    return super.getName()
  }
  
  override public func addAndSetParent(child: Node) {
    fatalError("Value node can not have a child.")
  }
  
  public func isInt () -> Bool {
    return false
  }
  public func isFloat () -> Bool {
    return false
  }
  public func isDouble () -> Bool {
    return false
  }
}
