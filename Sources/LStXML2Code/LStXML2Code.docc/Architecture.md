# Architektur

Dieser Artikel beschreibt Architekturkonzepte die hier verwendet werden.

## Overview

Die Architektur ist darauf ausgelegt die unterliegende XML Struktur der eingelesenen Daten zu kapseln und einen Standardmechanismus (Codeable, genaugenommen nur Encodable) bereitzustellen um auf einen normalisierten Syntaxbaum aufzusetzen.

### Überführen des XML in eine Struktur

Swift unterstützt mit dem Protokoll `Codable` das (nicht ganz so) einfache Serialisieren und Deserialisieren von mehr oder weniger komplexen Strukturen. Da das Eingabeformat ein valides XML Dokument ist nutzen wir zum Einlesen statt einem `Decoder` den SAX-Parser ``PAPXmlParser``.

Aufgabe des ``PAPXmlParser`` ist es die XML Struktur in eine Baumstruktur zu überführen, den ``PAPTree``. Der ``PAPTree`` ist als interne IO-Struktur nach außen nicht sichtbar sondern wird über die Transformation in den ``AbstractTree`` überführt. Der ``PAPTree`` implemetiert hierfür das Protokoll `Encodable`. Dies geschieht über die Implementation der Schnittstelle `Encodable` in ``AbstractTreeEncoder``, welche jedoch die eigentlich Aufgabe in die Implementierung ``AbstractTreeEncoding`` delegiert.

**Nur die ``AbstractTreeEncoding`` Implementation bedarf einer Anpassung, bei nicht strukturellen Änderungen dess XML.**

Der erzeugt ``AbstractTree`` stellt analog die gleiche Funktionalität. Für die Transformation ist somit das Protokoll ``AbstractTreeEncoding`` zu implementieren.
Anschließend erfolgt der Aufruf analog wie auch andere Encoder verwendet werden mit Übergabe der Implementierung, z.B.

```swift
var encoder = AbstractTreeEncoder(encoding:JavaEncoding() )
var encodedData = try encoder.encode(ast)
```
