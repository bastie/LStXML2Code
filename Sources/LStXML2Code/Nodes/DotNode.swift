/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

/// A value Node, e.g. in programming language with value types these value
///
/// - Note: A DotNode is a Leaf and can not have a child
public class DotNode : Node, CustomDebugStringConvertible {
  
  public var debugDescription: String {
    get {
      return "<Dot>"
    }
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
