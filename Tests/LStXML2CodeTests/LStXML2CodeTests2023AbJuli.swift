import XCTest
@testable import LStXML2Code

import JavApi


// Coverage: 89.8 %

/// Business object test case
/// - Note: Code coverage 89.8%
/// - Note: Die BMF Webschnittstelle ist nicht vollständig und korrekt implementiert. Wenn nicht anders gesetzt wird LZZ mit Wert 4 angenommen und nicht geprüft (Wert 1234 wird auch als gültig betrachtet). Die STKL wird mit 1 angenommen. In der textuellen Beschreibung wird hingegen z.B. vorgeschrieben, dass LZZ nur 1-4 sein darf. Gleichzeitig weist das ITZBund / BMF darauf hin, dass die Werte per Default mit 0 initialisiert werden.
/// Entsprechend kommt es zu Abweichungen bei generierten Code nicht nur bei hiesiger Generierung sondern auch bei anderen getesteten Implemntierungen.
final class LStXML2CodeTests: XCTestCase {
  
  
  /// Dieser Test beinhaltet das Beispiel von der Webseite [Eingangsinterface des BMF Steuerrechner](https://www.bmf-steuerrechner.de/interface/einganginterface.xhtml)
  ///
  /// - Note: Code Coverage of Lohnsteuer2023AbJuliBig: 50,6%
  func testBMFSample() throws {
    let calculator = Lohnsteuer2023AbJuliBig(LZZ: 1,RE4: java.math.BigDecimal(2500000),STKL: 1)
    calculator.MAIN()
    /*
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
     */
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 176700)
    XCTAssertEqual(calculator.WVFRB, 834700)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZLZZ, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  
  /// - Note: Code Coverage of Lohnsteuer2023AbJuliBig: 50,6%
  func testKRV0() throws {
    let calculator = Lohnsteuer2023AbJuliBig(KRV: 0, LZZ: 1,RE4: java.math.BigDecimal(2500000),STKL: 1)
    calculator.MAIN()
    /*
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
     */
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 176700)
    XCTAssertEqual(calculator.WVFRB, 834700)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZLZZ, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  
  /// - Note: Code Coverage of Lohnsteuer2023AbJuliBig: 50,6%
  func testKRV1() throws {
    let calculator = Lohnsteuer2023AbJuliBig(KRV: 1, LZZ: 1,RE4: java.math.BigDecimal(2500000),STKL: 1)
    calculator.MAIN()
    /*
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
     */
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 176700)
    XCTAssertEqual(calculator.WVFRB, 834700)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZLZZ, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  
  
  /// - Note: Code Coverage of Lohnsteuer2023AbJuliBig: 49,3%
  func testKRV2() throws {
    let calculator = Lohnsteuer2023AbJuliBig(KRV: 2, LZZ: 1,RE4: java.math.BigDecimal(2500000),STKL: 1)
    calculator.MAIN()
    /*
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
     */
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 236400)
    XCTAssertEqual(calculator.WVFRB, 1067200)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZLZZ, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  
  
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&KRV=2&LZZ=1&RE4=250000000&STKL=1
  /// - Note: Code Coverage of Lohnsteuer2023AbJuliBig: 49,1%
  func testAJAHR1KRV2() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      KRV: 2,
      LZZ: 1,
      RE4: java.math.BigDecimal(250000000),
      STKL: 1)
    calculator.MAIN()
    /*
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
     */
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 110380200)
    XCTAssertEqual(calculator.WVFRB, 248267100)
    XCTAssertEqual(calculator.SOLZLZZ, 6070911)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  
  
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&KRV=2&LZZ=1&RE4=250000000&STKL=3
  func testSTKL3() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      KRV: 2,
      LZZ: 1,
      RE4: java.math.BigDecimal(250000000),
      STKL: 3)
    calculator.MAIN()
    /*
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
     */
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 108549400)
    XCTAssertEqual(calculator.WVFRB, 248267100)
    XCTAssertEqual(calculator.SOLZLZZ, 5970217)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&KRV=2&LZZ=1&PVS=1&PVZ=1&RE4=250000000&STKL=5
  func testSTKL5PVS1PVZ1() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      KRV: 2,
      LZZ: 1,
      RE4: java.math.BigDecimal(250000000),
      STKL: 5)
    
    calculator.PVS = 1
    calculator.PVZ = 1
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 111137900)
    XCTAssertEqual(calculator.WVFRB, 248208700)
    XCTAssertEqual(calculator.SOLZLZZ, 6112584)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&KRV=2&LZZ=1&PVS=0&PVZ=1&RE4=250000000&STKL=5
  func testSTKL5PVS0PVZ1() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      KRV: 2,
      LZZ: 1,
      RE4: java.math.BigDecimal(250000000),
      STKL: 5)
    
    calculator.PVS = 0
    calculator.PVZ = 1
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 111151400)
    XCTAssertEqual(calculator.WVFRB, 248238700)
    XCTAssertEqual(calculator.SOLZLZZ, 6113327)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&KRV=2&LZZ=1&PVS=1&PVZ=0&RE4=250000000&STKL=6
  func testSTKL6PVS1PVZ0() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      KRV: 2,
      LZZ: 1,
      RE4: java.math.BigDecimal(250000000),
      STKL: 6)
    
    calculator.PVS = 1
    calculator.PVZ = 0
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.LSTLZZ, 111207700)
    XCTAssertEqual(calculator.WVFRB, 248363800)
    XCTAssertEqual(calculator.SOLZLZZ, 6116423)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRB, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&KRV=2&LZZ=0&PVS=1&RE4=2500000&STKL=2
  func testSTKL2LZZ0PVS1() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      KRV: 2,
      RE4: java.math.BigDecimal(2500000),
      STKL: 2)
    
    calculator.LZZ = 0
    calculator.PVS = 1
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 1118535)
    XCTAssertEqual(calculator.WVFRB, 897805900)
    XCTAssertEqual(calculator.SOLZLZZ, 61519)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&KRV=2&LZZ=0&PVS=1&PVZ=1&RE4=2500000&STKL=4
  func testSTKL4LZZ0PVS1PVZ1() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      KRV: 2,
      RE4: java.math.BigDecimal(2500000),
      STKL: 4)
    
    calculator.LZZ = 0
    calculator.PVS = 1
    calculator.PVZ = 1
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 1119022)
    XCTAssertEqual(calculator.WVFRB, 898196000)
    XCTAssertEqual(calculator.SOLZLZZ, 61546)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&KRV=2&LZZ=0&PVS=0&PVZ=1&RE4=2500000&STKL=4
  func testSTKL4LZZ0PVS0PVZ1() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      KRV: 2,
      RE4: java.math.BigDecimal(2500000),
      STKL: 4)
    
    calculator.LZZ = 0
    calculator.PVS = 0
    calculator.PVZ = 1
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 1119060)
    XCTAssertEqual(calculator.WVFRB, 898225900)
    XCTAssertEqual(calculator.SOLZLZZ, 61548)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  
  
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&KRV=2&LZZ=2&RE4=250000&STKL=3
  func testSTKL3LZZ2() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      KRV: 2,
      LZZ: 2,
      RE4: java.math.BigDecimal(250000),
      STKL: 3)
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 5183)
    XCTAssertEqual(calculator.WVFRB, 1482600)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZLZZ, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }

  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&KRV=2&LZZ=3&RE4=250000&STKL=3
  func testSTKL3LZZ3() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      KRV: 2,
      LZZ: 3,
      RE4: java.math.BigDecimal(250000),
      STKL: 3)
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 60950)
    XCTAssertEqual(calculator.WVFRB, 11119042)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZLZZ, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }

  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&KRV=2&LZZ=4&RE4=250000&STKL=3
  func testSTKL3LZZ4() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      KRV: 2,
      LZZ: 4,
      RE4: java.math.BigDecimal(250000),
      STKL: 3)
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 101519)
    XCTAssertEqual(calculator.WVFRB, 88261900)
    XCTAssertEqual(calculator.SOLZLZZ, 5583)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }

  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&af=1&f=0.2&AJAHR=1&RE4=12345699
  func testAF1F0p2() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      RE4: java.math.BigDecimal(123499)
      )
    calculator.af = 1
    calculator.f = 0.2
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 9733)
    XCTAssertEqual(calculator.WVFRB, 41910440)
    XCTAssertEqual(calculator.SOLZLZZ, 535)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }

  
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&af=1&f=0.2&AJAHR=1&RE4=12345699
  func testAF0F1() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      RE4: java.math.BigDecimal(123499)
    )
    calculator.af = 0
    calculator.f = 1
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 48665)
    XCTAssertEqual(calculator.WVFRB, 41910440)
    XCTAssertEqual(calculator.SOLZLZZ, 2676)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }

  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&RE4=12345699&LZZ=1&VJAHR=2005&VKAPA=1000000
  func testLZZ1VJAHR2005VKAPA1000000() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      LZZ:1,
      RE4: java.math.BigDecimal(12345699),
      VJAHR : 2005,
      VKAPA : java.math.BigDecimal(1000000)
    )
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 3577500)
    XCTAssertEqual(calculator.WVFRB, 9801699)
    XCTAssertEqual(calculator.SOLZLZZ, 196762)
    XCTAssertEqual(calculator.VFRBS2, 400200)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }


  
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&RE4=12345699&LZZ=1&VJAHR=2006&VKAPA=1000000
  func testLZZ1VJAHR2006VKAPA1000000() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      LZZ:1,
      RE4: java.math.BigDecimal(12345699),
      VJAHR : 2006,
      VKAPA : java.math.BigDecimal(1000000)
    )
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 3577500)
    XCTAssertEqual(calculator.WVFRB, 9801699)
    XCTAssertEqual(calculator.SOLZLZZ, 196762)
    XCTAssertEqual(calculator.VFRBS2, 384600)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }

  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&RE4=12345699&LZZ=1&VJAHR=2040&VKAPA=1000000
  func testLZZ1VJAHR2040VKAPA1000000() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      LZZ:1,
      RE4: java.math.BigDecimal(12345699),
      VJAHR : 2040,
      VKAPA : java.math.BigDecimal(1000000)
    )
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 3577500)
    XCTAssertEqual(calculator.WVFRB, 9801699)
    XCTAssertEqual(calculator.SOLZLZZ, 196762)
    XCTAssertEqual(calculator.VFRBS2, 10200)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }

  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&RE4=12345699&LZZ=1&VJAHR=2039&VKAPA=1000000
  func testLZZ1VJAHR2039VKAPA1000000() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      LZZ:1,
      RE4: java.math.BigDecimal(12345699),
      VJAHR : 2039,
      VKAPA : java.math.BigDecimal(1000000)
    )
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 3577500)
    XCTAssertEqual(calculator.WVFRB, 9801699)
    XCTAssertEqual(calculator.SOLZLZZ, 196762)
    XCTAssertEqual(calculator.VFRBS2, 18000)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&RE4=123499&VJAHR=2039&VKAPA=100
  func testVJAHR2019VKAPA100() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      RE4: java.math.BigDecimal(123499),
      VJAHR : 2019,
      VKAPA : java.math.BigDecimal(100)
    )
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 48665)
    XCTAssertEqual(calculator.WVFRB, 41910440)
    XCTAssertEqual(calculator.SOLZLZZ, 2676)
    XCTAssertEqual(calculator.VFRBS2, 118)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&RE4=123499&VJAHR=2039&VKAPA=-100
  func testVJAHR2019VKAPAminus100() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      RE4: java.math.BigDecimal(123499),
      VJAHR : 2019,
      VKAPA : java.math.BigDecimal(-100)
    )
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 48665)
    XCTAssertEqual(calculator.WVFRB, 41910440)
    XCTAssertEqual(calculator.SOLZLZZ, 2676)
    XCTAssertEqual(calculator.VFRBS2, 0)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&RE4=123499&VJAHR=2039&VKAPA=-100&ALTER1=1
  func testVJAHR2019VKAPAminus100ALTER11() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      ALTER1: 1,
      RE4: java.math.BigDecimal(123499),
      VJAHR : 2019,
      VKAPA : java.math.BigDecimal(-100)
    )
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 48428)
    XCTAssertEqual(calculator.WVFRB, 41720440)
    XCTAssertEqual(calculator.SOLZLZZ, 2663)
    XCTAssertEqual(calculator.VFRBS2, 0)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }

  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&AJAHR=1&RE4=123499&VJAHR=2039&VKAPA=-100&ALTER1=1&ZKF=2
  func testVJAHR2019VKAPAminus100ALTER11ZKF2() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      ALTER1: 1,
      RE4: java.math.BigDecimal(123499),
      VJAHR : 2019,
      VKAPA : java.math.BigDecimal(-100),
      ZKF: java.math.BigDecimal(2)
    )
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 48428)
    XCTAssertEqual(calculator.WVFRB, 41720440)
    XCTAssertEqual(calculator.SOLZLZZ, 2663)
    XCTAssertEqual(calculator.VFRBS2, 0)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }

  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&JFREIB=200022&JHINZU=500055&RE4=12345
  func testJFREIBHINZU() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      JFREIB: java.math.BigDecimal.valueOf("2000.22")!,
      JHINZU: java.math.BigDecimal.valueOf("5000.55")!,
      RE4: java.math.BigDecimal.valueOf("12345")!
    )
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 1745)
    XCTAssertEqual(calculator.WVFRB, 2430400)
    XCTAssertEqual(calculator.SOLZLZZ, 0)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&SONSTB=100000&STS=200000&RE4=22345
  func testSTS() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      RE4: java.math.BigDecimal.valueOf("22345")!,
      SONSTB: java.math.BigDecimal(100000) // Cent
    )
    calculator.STS = java.math.BigDecimal(200000) // Cent
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 4990)
    XCTAssertEqual(calculator.WVFRB, 5561500)
    XCTAssertEqual(calculator.SOLZLZZ, 13)
    XCTAssertEqual(calculator.VFRBS2, 100000)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&SONSTB=-100000&STS=-200000&RE4=22345
  func testSTSminus() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      RE4: java.math.BigDecimal.valueOf("22345")!,
      SONSTB: java.math.BigDecimal(-100000) // Cent
    )
    calculator.STS = java.math.BigDecimal(-200000) // Cent
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 4990)
    XCTAssertEqual(calculator.WVFRB, 5561500)
    XCTAssertEqual(calculator.SOLZLZZ, 13)
    XCTAssertEqual(calculator.VFRBS2, 0)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }

  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&STKL=5&SONSTB=100000&STS=200000&RE4=22345
  func testSTKL5STS() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      RE4: java.math.BigDecimal.valueOf("22345")!,
      SONSTB: java.math.BigDecimal(100000), // Cent
      STKL: 5
    )
    calculator.STS = java.math.BigDecimal(200000) // Cent
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 6701)
    XCTAssertEqual(calculator.WVFRB, 5557900)
    XCTAssertEqual(calculator.SOLZLZZ, 217)
    XCTAssertEqual(calculator.VFRBS2, 100000)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVLZZ, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }

  
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&af=1&f=0.2&AJAHR=1&STKL=6&PKV=2&RE4=123456
  func testAF1F0point2STKL6() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      RE4: java.math.BigDecimal(123456),
      STKL: 6
    )
    calculator.af = 1
    calculator.f = 0.2
    calculator.PKV = 2
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.LSTLZZ, 10278)
    XCTAssertEqual(calculator.WVFRB, 42348660)
    XCTAssertEqual(calculator.SOLZLZZ, 565)
    XCTAssertEqual(calculator.VKVLZZ, 527)
    // must be zero
    XCTAssertEqual(calculator.VFRB, 0)
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }

  
  // https://www.bmf-steuerrechner.de/interface/2023AbJuliVersion1.xhtml?code=ext2023&af=1&f=0.2&AJAHR=1&STKL=5&PKV=2&RE4=123456
  func testAF1F0point2STKL5() throws {
    let calculator = Lohnsteuer2023AbJuliBig(
      AJAHR: 1,
      RE4: java.math.BigDecimal(123456),
      STKL: 5
    )
    calculator.af = 1
    calculator.f = 0.2
    calculator.PKV = 2
    
    calculator.MAIN()
    
    // must be set
    XCTAssertEqual(calculator.VFRB, 123000)
    XCTAssertEqual(calculator.LSTLZZ, 10246)
    XCTAssertEqual(calculator.WVFRB, 42222060)
    XCTAssertEqual(calculator.SOLZLZZ, 563)
    XCTAssertEqual(calculator.VKVLZZ, 527)
    // must be zero
    XCTAssertEqual(calculator.BK, 0)
    XCTAssertEqual(calculator.BKS, 0)
    XCTAssertEqual(calculator.BKV, 0)
    XCTAssertEqual(calculator.SOLZS, 0)
    XCTAssertEqual(calculator.SOLZV, 0)
    XCTAssertEqual(calculator.STS, 0)
    XCTAssertEqual(calculator.STV, 0)
    XCTAssertEqual(calculator.VKVSONST, 0)
    XCTAssertEqual(calculator.VFRBS1, 0)
    XCTAssertEqual(calculator.VFRBS2, 0)
    XCTAssertEqual(calculator.WVFRBO, 0)
    XCTAssertEqual(calculator.WVFRBM, 0)
  }

}
