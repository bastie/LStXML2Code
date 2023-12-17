# LStXML2Code

Dieses Programm ist inspiert bei [Marcel Lehmanns Lohnsteuer Projekt](https://github.com/MarcelLehmann/Lohnsteuer), jedoch in Swift implementiert da ich für ein anderes Projekt auf dem fachlichen Use Case Lohnsteuer aufsetze.

**Achtung:**
(Stand 17.12.2023)
Die BMF Webschnittstelle ist nicht vollständig und korrekt implementiert. Folgendes wurde festgestellt:

 * Wenn nicht anders gesetzt wird LZZ mit Wert 4 angenommen und nicht geprüft (Wert 1234 wird auch als gültig betrachtet). In der textuellen Beschreibung wird hingegen z.B. vorgeschrieben, dass LZZ nur 1-4 sein darf. 
 * Die STKL wird mit 1 angenommen. Gleichzeitig weist das ITZBund / BMF darauf hin, dass die Werte per Default mit 0 initialisiert werden.

Entsprechend kommt es zu Abweichungen bei generierten Code nicht nur bei hiesiger Generierung sondern auch bei anderen getesteten Implementierungen.

Als Folge dessen ist unklar, ob die Ergebnisse der Webschnittstelle des BMF deren Ansprüche als Referenz zum testen des eigenes Quelltextes uneingeschränkt erfüllt. *Für meine Zielsetzung ist dies jedoch nicht weiter relevant.*   

## License

GNU AFFERO GENERAL PUBLIC LICENSE 3.0 OR LATER

In result of this project contains only the generator AGPL license is using.
The generated source is **not** under this license.

## CLI

```bash
swift run -c release BMF2Code --lang=Swift -o AnswerIs42.swift ./Tests/LStXML2CodeTests/xml/Lohnsteuer2023AbJuli.xml
```

**Bei der Ausführung im Debug Modus werden Zusatzangaben ausgegeben, so das der Quelltext nicht ohne Anpassungen kompilierbar ist. 
