/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */
import Foundation

public struct XmlPAP {

  /// Parse the given XML data into my CommonAST
  /// - Parameters:
  /// - Parameter xmlDocument XML as Data
  /// - Returns AST
  public static func parse (xmlData : Data) -> AbstractTree {
    let result = PAPTree()

    let delegate = PAPXmlParser(newAst: result)

    let parser = XMLParser(data: xmlData)
    parser.delegate = delegate
    parser.parse()
    
    
    let encoder = PAPTreeEncoder(encoding:PAPTreeEncodingImpl() )
    let abstractTree = try! encoder.encode(result)

    return abstractTree
  }
  
}


// MARK: Helpermethods
extension XmlPAP {
  /// Parse the XML in the given String
  ///
  /// - Parameters:
  /// - Parameter xmlDocument XML as String
  /// - Returns AST
  static func parse (xmlDocument : String) -> AbstractTree {
    return XmlPAP.parse(xmlData: xmlDocument.data(using: .utf8)!)
  }
  /// Parse the XML in the given String
  ///
  /// - Parameters:
  /// - Parameter xmlDocument XML found on given URL
  /// - Returns AST
  static func parse (xmlDocumentPath : URL) throws -> AbstractTree {
    let xml = try Data(contentsOf: xmlDocumentPath, options: .uncached)
    return XmlPAP.parse(xmlData: xml)
  }

}
