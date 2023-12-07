import XCTest
@testable import LStXML2Code

final class LStXML2CodeTests: XCTestCase {
    func testExample() throws {
      let calculator = Lohnsteuer2023AbJuliBig(LZZ: 1, STKL : 1, RE4:BigDecimal(2500000))
      calculator.MAIN()
      print (
      """
      BK       = \(calculator.BK)
      BKS      = \(calculator.BKS)
      BKV      = \(calculator.BKV)
      LSTLZZ   = \(calculator.LSTLZZ)
      SOLZLZZ  = \(calculator.SOLZLZZ)
      SOLZS    = \(calculator.SOLZS)
      SOLZV    = \(calculator.SOLZV)
      STS      = \(calculator.STS)
      STV      = \(calculator.STV)
      VKVLZZ   = \(calculator.VKVLZZ)
      VKVSONST = \(calculator.VKVSONST)
      VFRB     = \(calculator.VFRB)
      VFRBS1   = \(calculator.VFRBS1)
      VFRBS2   = \(calculator.VFRBS2)
      WVFRB    = \(calculator.WVFRB)
      WVFRBO   = \(calculator.WVFRBO)
      WVFRBM   = \(calculator.WVFRBM)
      """)
    }
}

/* result of
 http://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&LZZ=1&RE4=2500000&STKL=1

<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<lohnsteuer jahr="2023">
<information>Die Berechnung ist nach den PAP 2023 (ab Juli)  erfolgt. Die Berechnung dient lediglich der Qualitätssicherung. Die Externe Schnittstelle des Lohn- und Einkommensteuerrechner ist also nur für die Überprüfung ihrer Rechnung bestimmt und nicht dazu bestimmt, die Berechnung über ihn abzuwickeln.</information>
<eingaben>
<eingabe name="LZZ" value="1" status="ok"/>
<eingabe name="RE4" value="2500000" status="ok"/>
<eingabe name="STKL" value="1" status="ok"/>
</eingaben>
<ausgaben>
<ausgabe name="BK" value="0" type="STANDARD"/>
<ausgabe name="BKS" value="0" type="STANDARD"/>
<ausgabe name="BKV" value="0" type="STANDARD"/>
<ausgabe name="LSTLZZ" value="176700" type="STANDARD"/>
<ausgabe name="SOLZLZZ" value="0" type="STANDARD"/>
<ausgabe name="SOLZS" value="0" type="STANDARD"/>
<ausgabe name="SOLZV" value="0" type="STANDARD"/>
<ausgabe name="STS" value="0" type="STANDARD"/>
<ausgabe name="STV" value="0" type="STANDARD"/>
<ausgabe name="VKVLZZ" value="0" type="STANDARD"/>
<ausgabe name="VKVSONST" value="0" type="STANDARD"/>
<ausgabe name="VFRB" value="123000" type="DBA"/>
<ausgabe name="VFRBS1" value="0" type="DBA"/>
<ausgabe name="VFRBS2" value="0" type="DBA"/>
<ausgabe name="WVFRB" value="834700" type="DBA"/>
<ausgabe name="WVFRBO" value="0" type="DBA"/>
<ausgabe name="WVFRBM" value="0" type="DBA"/>
</ausgaben>
</lohnsteuer>
*/
