/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

public class CharNode : Node , CustomDebugStringConvertible {
  
  public var debugDescription: String {
    get {
      return "\(char)"
    }
  }
  
  let char : Character
  
  static var initiated : [Character:CharNode] = [:]
  public static func value (of newChar : Character) -> CharNode {
    if let result = initiated[newChar] {
      return result
    }
    initiated[newChar] = CharNode(with: newChar)
    return initiated[newChar]! // with get from initiated it is secure that instance is stored in it
  }
  public static func value (of characters : String) -> [CharNode] {
    var result : [CharNode] = []
    for char in characters {
      result.append(CharNode.value(of: char))
    }
    return result
  }
  
  private init(newParent: Node? = nil, with newChar : Character) {
    self.char = newChar
  }
  
  public func getValue () -> String {
    return "\(char)"
  }
  
  public override func isLeaf() -> Bool {
    return true
  }
}
