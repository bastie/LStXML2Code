/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */
import Foundation

public protocol AbstractTreeEncoding {
  func encode(_ value: AbstractTree) throws -> Data?
}

extension AbstractTreeEncoding {
  // defautl implementation using CustomStringConvertible of root node
  func encode(_ value: AbstractTree) throws -> Data? {
    // CommonAST is not a special type above so wie are here
    let asString = "\(value.getRoot())"
    return asString.data(using: .utf8)
  }
}
