/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */
class PAPTreeEncodingImpl : PAPTreeEncoding {
  // defautl implementation using CustomStringConvertible of root node
  func encode(_ value: PAPTree) throws -> AbstractTree? {
    let result = transform(value)
    return result
  }
  
  private func transform (_ pap : PAPTree) -> AbstractTree {
    let root = traverse(node: pap.getRoot())
    
    let result = AbstractTree()
    result.setRoot(root)
    return result
  }
  
  private func traverse (node oldNode: Node) -> Node {
    let newNode = Node()
    newNode.setName(oldNode.getName())
    let oldAttributes = oldNode.getAttributes()
    for (name,value) in oldAttributes {
      newNode.addAttribute(name, value)
    }
    for child in oldNode.getChilds() {
      let newChild = traverse(node: child)
      newNode.add(child: newChild)
    }
    return newNode
  }
}
