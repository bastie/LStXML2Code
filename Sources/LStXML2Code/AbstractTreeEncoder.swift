/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */
import Foundation


open class AbstractTreeEncoder : Encoder {
  /// - Parameters
  /// - Parameter value CommonAST
  public func encode(_ value: Encodable) throws -> Data {
    // internal working with _JavaSourceEncode
    // call the encode function at Encodable conform type called value here the CommonAST
    try value.encode(to: self)
    return self.data
  }
  
  let encoding : AbstractTreeEncoding
  public init(encoding worker : AbstractTreeEncoding){
    self.encoding = worker
  }
  
  var data: Data {
    return container?.storage ?? Data()
  }
  fileprivate var container: SingleValueContainer? {
    willSet {
      precondition(self.container == nil)
    }
  }
  
  
  public func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
    fatalError("Not yet implemented")
    /*
     let container = KeyedContainer<Key>(
     codingPath: self.codingPath,
     userInfo: self.userInfo
     )
     self.container = container
     return KeyedEncodingContainer(container)
     */
  }
  
  public func unkeyedContainer() -> UnkeyedEncodingContainer {
    fatalError("Not yet implemented")
    /*
     let container = UnkeyedContainer(
     codingPath: self.codingPath,
     userInfo: self.userInfo
     )
     self.container = container
     return container
     */
  }
  
  public func singleValueContainer() -> SingleValueEncodingContainer {
    let container = SingleValueContainer(
      codingPath: self.codingPath,
      userInfo: self.userInfo,
      encoding: self.encoding
    )
    self.container = container
    return container
  }
  
  public var codingPath: [CodingKey] = []
  public var userInfo: [CodingUserInfoKey : Any] = [:]
  
  // MARK: SingleValeEncodingContainer
  class SingleValueContainer: SingleValueEncodingContainer {
    
    var storage : Data?
    
    func encodeNil() throws {}
    func encode(_ value: Bool) throws {}
    func encode(_ value: String) throws {}
    func encode(_ value: Double) throws {}
    func encode(_ value: Float) throws {}
    func encode(_ value: Int) throws {}
    func encode(_ value: Int8) throws {}
    func encode(_ value: Int16) throws {}
    func encode(_ value: Int32) throws {}
    func encode(_ value: Int64) throws {}
    func encode(_ value: UInt) throws {}
    func encode(_ value: UInt8) throws {}
    func encode(_ value: UInt16) throws {}
    func encode(_ value: UInt32) throws {}
    func encode(_ value: UInt64) throws {}
    
    func encode<T>(_ value: T) throws where T : Encodable {
      // CommonAST is not a special type above so wie are here
      if value is AbstractTree {
        self.storage = try self.encoding.encode(value as! AbstractTree)
      }
    }
    
    
    
    var codingPath: [CodingKey]
    var userInfo: [CodingUserInfoKey: Any]
    var encoding : AbstractTreeEncoding
    init(codingPath: [CodingKey],
         userInfo: [CodingUserInfoKey : Any],
         encoding : AbstractTreeEncoding)
    {
      self.codingPath = codingPath
      self.userInfo = userInfo
      self.encoding = encoding
    }
  }
  
  // MARK: UnkeyedContainer
  class UnkeyedContainer: UnkeyedEncodingContainer {
    func encode(_ value: String) throws {
      fatalError("Not yet implemented")
      
    }
    
    func encode(_ value: Double) throws {
      fatalError("Not yet implemented")
      
    }
    
    func encode(_ value: Float) throws {
      fatalError("Not yet implemented")
      
    }
    
    func encode(_ value: Int) throws {
      fatalError("Not yet implemented")
      
    }
    
    func encode(_ value: Int8) throws {
      fatalError("Not yet implemented")
      
    }
    
    func encode(_ value: Int16) throws {
      fatalError("Not yet implemented")
      
    }
    
    func encode(_ value: Int32) throws {
      fatalError("Not yet implemented")
      
    }
    
    func encode(_ value: Int64) throws {
      fatalError("Not yet implemented")
      
    }
    
    func encode(_ value: UInt) throws {
      fatalError("Not yet implemented")
      
    }
    
    func encode(_ value: UInt8) throws {
      fatalError("Not yet implemented")
      
    }
    
    func encode(_ value: UInt16) throws {
      fatalError("Not yet implemented")
      
    }
    
    func encode(_ value: UInt32) throws {
      fatalError("Not yet implemented")
      
    }
    
    func encode(_ value: UInt64) throws {
      fatalError("Not yet implemented")
      
    }
    
    func encode<T>(_ value: T) throws where T : Encodable {
      fatalError("Not yet implemented")
      
    }
    
    func encode(_ value: Bool) throws {
      fatalError("Not yet implemented")
      
    }
    
    var codingPath: [CodingKey] = []
    
    var count: Int = 0
    
    func encodeNil() throws {
      fatalError("Not yet implemented")
    }
    
    func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
      fatalError("Not yet implemented")
    }
    
    func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
      fatalError("Not yet implemented")
    }
    
    func superEncoder() -> Encoder {
      fatalError("Not yet implemented")
    }
  }
  
  // Mark: KeyedContainer
  class KeyedContainer<Key>: KeyedEncodingContainerProtocol where Key: CodingKey {
    var codingPath: [CodingKey] = []
    
    func encodeNil(forKey key: Key) throws {
      fatalError("Not yet implemented")
    }
    
    func encode(_ value: Bool, forKey key: Key) throws {
      fatalError("Not yet implemented")
    }
    
    func encode(_ value: String, forKey key: Key) throws {
      fatalError("Not yet implemented")
    }
    
    func encode(_ value: Double, forKey key: Key) throws {
      fatalError("Not yet implemented")
    }
    
    func encode(_ value: Float, forKey key: Key) throws {
      fatalError("Not yet implemented")
    }
    
    func encode(_ value: Int, forKey key: Key) throws {
      fatalError("Not yet implemented")
    }
    
    func encode(_ value: Int8, forKey key: Key) throws {
      fatalError("Not yet implemented")
    }
    
    func encode(_ value: Int16, forKey key: Key) throws {
      fatalError("Not yet implemented")
    }
    
    func encode(_ value: Int32, forKey key: Key) throws {
      fatalError("Not yet implemented")
    }
    
    func encode(_ value: Int64, forKey key: Key) throws {
      fatalError("Not yet implemented")
    }
    
    func encode(_ value: UInt, forKey key: Key) throws {
      fatalError("Not yet implemented")
    }
    
    func encode(_ value: UInt8, forKey key: Key) throws {
      fatalError("Not yet implemented")
    }
    
    func encode(_ value: UInt16, forKey key: Key) throws {
      fatalError("Not yet implemented")
    }
    
    func encode(_ value: UInt32, forKey key: Key) throws {
      fatalError("Not yet implemented")
    }
    
    func encode(_ value: UInt64, forKey key: Key) throws {
      fatalError("Not yet implemented")
    }
    
    func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
      fatalError("Not yet implemented")
    }
    
    func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
      fatalError("Not yet implemented")
    }
    
    func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
      fatalError("Not yet implemented")
    }
    
    func superEncoder() -> Encoder {
      fatalError("Not yet implemented")
    }
    
    func superEncoder(forKey key: Key) -> Encoder {
      fatalError("Not yet implemented")
    }
  }
}

