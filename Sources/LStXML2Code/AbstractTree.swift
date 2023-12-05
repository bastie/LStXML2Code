/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

open class AbstractTree : CustomStringConvertible, Encodable {
  public var description: String {
    get {
      return "AST: isEmpty=\(root == nil)"
    }
  }
  
  
  public init (){
  }
  
  
  private var root : Node?
  
  /// Set the root of tree.
  /// - Parameters:
  ///   - newRoot: the root of the tree
  public func setRoot (_ newRoot : Node) {
    self.root = newRoot
  }
  
  public func getRoot () -> Node {
    return self.root!
  }
  
}



extension AbstractTree {
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(self)
  }
}
