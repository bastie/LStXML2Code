/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

/// A two part decision `if-then-else` and also without `else` part
public class TwoPartDecisionNode : Node {
  
  public func setIfDecision (child : Node) {
    setChild(at: 0, child: child)
  }
  
  public func setElseDecision (child : Node) {
    setChild(at: 1, child: child)
  }

  override public func add(child: Node) {
    guard getChilds().count < 2 else {
      fatalError("to much decisions in \(#file)\(#function)")
    }
    super.add(child: child)
  }
  
  public func getIfDecision () -> Node {
    return getChild(at: 0)!
  }
  
  public func getElseDecision () -> Node? {
    return getChild(at: 1)
  }
  
  public func hasElseDecision () -> Bool {
    return nil != getElseDecision()
  }
}
