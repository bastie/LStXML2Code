# Getting Started

Die Verwendung des Frameworks zur Erzeugung eigener Daten aus dem XMLDocument.

## Overview

Das Framwork implementiert den `Encodable` Teil des `Codeable` Protokolls.

### Entwickeln eines eigenen Encodings

Das Framework kapselt die `Encoder` Funktionalität und stellt mit dem Protokoll ``AbstractTreeEncoding`` eine Schnittstelle bereit, an welcher die eigenen Implementationen aufsetzen. Der ``AbstractTree`` implementiert hierfür das Protokoll `Encodable`. Der eigentliche ``AbstractTreeEncoder`` delegiert, wenn diesem ein ``AbstractTree`` übergeben wird das **Encoding** an die Implementation des Protokoll ``AbstractTreeEncoding``; andere Typen werden nicht unterstützt.

Um den Syntaxbaum auszugeben, kann auf die Implementierung von `CustomStringConvertible` der Wurzel zurückgegriffen werden.

```swift
public func encode(_ value: AbstractTree) throws -> Data? {
  let asString = "\(value.getRoot())"
  return asString.data(using: .utf8)
}
```


### Nutzung des Encodings

```swift
var encoder = AbstractTreeEncoder(encoding:MyEncoding() )
var encodedData = try encoder.encode(ast)
```
