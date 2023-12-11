import XCTest
@testable import LStXML2Code

import JavApi

final class LStXML2CodeTests: XCTestCase {
  
  func testAll () throws {
    try self._testBMFSample()       // Coverage: 49,5%
    try self._testKRV1()            // Coverage: 49,7%
    try self._testKRV2()            // Coverage: 50,1%
    try self._testAJAHR1KRV2()      // Coverage: 52,2%
    /*
     */
  }
  
  /// Dieser Test beinhaltet das Beispiel von der Webseite [Eingangsinterface des BMF Steuerrechner](https://www.bmf-steuerrechner.de/interface/einganginterface.xhtml)
  ///
  /// - Note: Code Coverage of Lohnsteuer2023AbJuliBig: 50,6%
  func _testBMFSample() throws {
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
  func _testKRV0() throws {
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
  func _testKRV1() throws {
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
  func _testKRV2() throws {
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
  func _testAJAHR1KRV2() throws {
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
}
