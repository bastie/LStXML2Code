/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */
import LStXML2Code
import Foundation

open class SwiftEncoding : AbstractTreeEncoding {
  public func encode(_ value: AbstractTree) throws -> Data? {
    fatalError("Swift Encoding is not yet implemented")
  }
}
