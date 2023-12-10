/// Generated with BMF2Code v1.0.0 @2023-12-10 12:27:59 +0000

import Foundation
import JavApi

public typealias BigDecimal = java.math.BigDecimal

public class Lohnsteuer2023AbJuliBig  {
  
  public init (
    AJAHR : Int = Int(),
    ALTER1 : Int = Int(),
    ENTSCH : BigDecimal = BigDecimal(),
    JFREIB : BigDecimal = BigDecimal(),
    JHINZU : BigDecimal = BigDecimal(),
    JRE4 : BigDecimal = BigDecimal(),
    JRE4ENT : BigDecimal = BigDecimal(),
    JVBEZ : BigDecimal = BigDecimal(),
    KRV : Int = Int(),
    KVZ : BigDecimal = BigDecimal(),
    LZZ : Int = Int(),
    LZZFREIB : BigDecimal = BigDecimal(),
    LZZHINZU : BigDecimal = BigDecimal(),
    MBV : BigDecimal = BigDecimal(),
    PKPV : BigDecimal = BigDecimal(),
    PKV : Int = Int(),
    PVS : Int = Int(),
    PVZ : Int = Int(),
    R : Int = Int(),
    RE4 : BigDecimal = BigDecimal(),
    SONSTB : BigDecimal = BigDecimal(),
    SONSTENT : BigDecimal = BigDecimal(),
    STERBE : BigDecimal = BigDecimal(),
    STKL : Int = Int(),
    VBEZ : BigDecimal = BigDecimal(),
    VBEZM : BigDecimal = BigDecimal(),
    VBEZS : BigDecimal = BigDecimal(),
    VBS : BigDecimal = BigDecimal(),
    VJAHR : Int = Int(),
    VKAPA : BigDecimal = BigDecimal(),
    VMT : BigDecimal = BigDecimal(),
    ZKF : BigDecimal = BigDecimal(),
    ZMVB : Int = Int(),
    af : Int = Int(),
    f : Double = Double()) {
      self.R = R
      self.ZMVB = ZMVB
      self.LZZHINZU = LZZHINZU
      self.PVZ = PVZ
      self.JHINZU = JHINZU
      self.LZZ = LZZ
      self.ENTSCH = ENTSCH
      self.VBEZS = VBEZS
      self.VBS = VBS
      self.JRE4ENT = JRE4ENT
      self.AJAHR = AJAHR
      self.f = f
      self.af = af
      self.PVS = PVS
      self.VBEZ = VBEZ
      self.ALTER1 = ALTER1
      self.LZZFREIB = LZZFREIB
      self.JVBEZ = JVBEZ
      self.JRE4 = JRE4
      self.RE4 = RE4
      self.SONSTB = SONSTB
      self.STKL = STKL
      self.PKV = PKV
      self.VMT = VMT
      self.STERBE = STERBE
      self.VBEZM = VBEZM
      self.ZKF = ZKF
      self.SONSTENT = SONSTENT
      self.VJAHR = VJAHR
      self.JFREIB = JFREIB
      self.MBV = MBV
      self.KVZ = KVZ
      self.KRV = KRV
      self.PKPV = PKPV
      self.VKAPA = VKAPA
    }
  
  // MARK: Variables
  /* Stand: 2023-05-25 09:00 */
  /* ITZBund Berlin */
  /* EINGABEPARAMETER */
  // MARK: Inputvariables
  /* 1, wenn die Anwendung des Faktorverfahrens gewählt wurden (nur in Steuerklasse IV) */
  public var af : Int = 1
  /* Auf die Vollendung des 64. Lebensjahres folgende
   Kalenderjahr (erforderlich, wenn ALTER1=1) */
  public var AJAHR : Int
  /* 1, wenn das 64. Lebensjahr zu Beginn des Kalenderjahres vollendet wurde, in dem
   der Lohnzahlungszeitraum endet (§ 24 a EStG), sonst = 0 */
  public var ALTER1 : Int
  /* in VKAPA und VMT enthaltene Entschädigungen nach §24 Nummer 1 EStG
   sowie tarifermäßigt zu besteuernde Vorteile bei Vermögensbeteiligungen
   (§ 19a Absatz 4 EStG) in Cent */
  public var ENTSCH : BigDecimal = BigDecimal(0)
  /* eingetragener Faktor mit drei Nachkommastellen */
  public var f : Double = 1.0
  /* Jahresfreibetrag für die Ermittlung der Lohnsteuer für die sonstigen Bezüge
   sowie für Vermögensbeteiligungen nach § 19a Absatz 1 und 4 EStG nach Maßgabe der
   elektronischen Lohnsteuerabzugsmerkmale nach § 39e EStG oder der Eintragung
   auf der Bescheinigung für den Lohnsteuerabzug 2023 in Cent (ggf. 0) */
  public var JFREIB : BigDecimal
  /* Jahreshinzurechnungsbetrag für die Ermittlung der Lohnsteuer für die sonstigen Bezüge
   sowie für Vermögensbeteiligungen nach § 19a Absatz 1 und 4 EStG nach Maßgabe der
   elektronischen Lohnsteuerabzugsmerkmale nach § 39e EStG oder der Eintragung auf der
   Bescheinigung für den Lohnsteuerabzug 2023 in Cent (ggf. 0) */
  public var JHINZU : BigDecimal
  /* Voraussichtlicher Jahresarbeitslohn ohne sonstige Bezüge (d.h. auch ohne Vergütung
   für mehrjährige Tätigkeit und ohne die zu besteuernden Vorteile bei Vermögensbeteiligungen,
   § 19a Absatz 4 EStG) in Cent.
   Anmerkung: Die Eingabe dieses Feldes (ggf. 0) ist erforderlich bei Eingaben zu sonstigen
   Bezügen (Felder SONSTB, VMT oder VKAPA).
   Sind in einem vorangegangenen Abrechnungszeitraum bereits sonstige Bezüge gezahlt worden,
   so sind sie dem voraussichtlichen Jahresarbeitslohn hinzuzurechnen. Gleiches gilt für zu
   besteuernde Vorteile bei Vermögensbeteiligungen (§ 19a Absatz 4 EStG). Vergütungen für
   mehrjährige Tätigkeit aus einem vorangegangenen Abrechnungszeitraum werden in voller
   Höhe hinzugerechnet. */
  public var JRE4 : BigDecimal
  /* In JRE4 enthaltene Versorgungsbezuege in Cents (ggf. 0) */
  public var JVBEZ : BigDecimal
  /* Merker für die Vorsorgepauschale
   2 = der Arbeitnehmer ist NICHT in der gesetzlichen Rentenversicherung versichert.
   
   1 = der Arbeitnehmer ist in der gesetzlichen Rentenversicherung versichert, es gilt die
   Beitragsbemessungsgrenze OST.
   
   0 = der Arbeitnehmer ist in der gesetzlichen Rentenversicherung versichert, es gilt die
   Beitragsbemessungsgrenze WEST. */
  public var KRV : Int
  /* Einkommensbezogener Zusatzbeitragssatz eines gesetzlich krankenversicherten Arbeitnehmers,
   auf dessen Basis der an die Krankenkasse zu zahlende Zusatzbeitrag berechnet wird,
   in Prozent (bspw. 0,90 für 0,90 %) mit 2 Dezimalstellen.
   Der von der Kranken-kasse festgesetzte Zusatzbeitragssatz ist bei Abweichungen unmaßgeblich. */
  public var KVZ : BigDecimal
  /* Lohnzahlungszeitraum:
   1 = Jahr
   2 = Monat
   3 = Woche
   4 = Tag */
  public var LZZ : Int
  /* Der als elektronisches Lohnsteuerabzugsmerkmal für den Arbeitgeber nach § 39e EStG festgestellte
   oder in der Bescheinigung für den Lohnsteuerabzug 2023 eingetragene Freibetrag für den
   Lohnzahlungszeitraum in Cent */
  public var LZZFREIB : BigDecimal
  /* Der als elektronisches Lohnsteuerabzugsmerkmal für den Arbeitgeber nach § 39e EStG festgestellte
   oder in der Bescheinigung für den Lohnsteuerabzug 2023 eingetragene Hinzurechnungsbetrag für den
   Lohnzahlungszeitraum in Cent */
  public var LZZHINZU : BigDecimal
  /* Nicht zu besteuernde Vorteile bei Vermögensbeteiligungen
   (§ 19a Absatz 1 Satz 4 EStG) in Cent */
  public var MBV : BigDecimal
  /* Dem Arbeitgeber mitgeteilte Zahlungen des Arbeitnehmers zur privaten
   Kranken- bzw. Pflegeversicherung im Sinne des §10 Abs. 1 Nr. 3 EStG 2010
   als Monatsbetrag in Cent (der Wert ist inabhängig vom Lohnzahlungszeitraum immer
   als Monatsbetrag anzugeben). */
  public var PKPV : BigDecimal = BigDecimal(0)
  /* Krankenversicherung:
   0 = gesetzlich krankenversicherte Arbeitnehmer
   1 = ausschließlich privat krankenversicherte Arbeitnehmer OHNE Arbeitgeberzuschuss
   2 = ausschließlich privat krankenversicherte Arbeitnehmer MIT Arbeitgeberzuschuss */
  public var PKV : Int = 0
  /* 1, wenn bei der sozialen Pflegeversicherung die Besonderheiten in Sachsen zu berücksichtigen sind bzw.
   zu berücksichtigen wären, sonst 0. */
  public var PVS : Int = 0
  /* 1, wenn er der Arbeitnehmer den Zuschlag zur sozialen Pflegeversicherung
   zu zahlen hat, sonst 0. */
  public var PVZ : Int = 0
  /* Religionsgemeinschaft des Arbeitnehmers lt. elektronischer Lohnsteuerabzugsmerkmale oder der
   Bescheinigung für den Lohnsteuerabzug 2023 (bei keiner Religionszugehörigkeit = 0) */
  public var R : Int
  /* Steuerpflichtiger Arbeitslohn für den Lohnzahlungszeitraum vor Berücksichtigung des
   Versorgungsfreibetrags und des Zuschlags zum Versorgungsfreibetrag, des Altersentlastungsbetrags
   und des als elektronisches Lohnsteuerabzugsmerkmal festgestellten oder in der Bescheinigung für
   den Lohnsteuerabzug 2023 für den Lohnzahlungszeitraum eingetragenen Freibetrags bzw.
   Hinzurechnungsbetrags in Cent */
  public var RE4 : BigDecimal
  /* Sonstige Bezüge (ohne Vergütung aus mehrjähriger Tätigkeit) einschließlich nicht tarifermäßigt
   zu besteuernde Vorteile bei Vermögensbeteiligungen und Sterbegeld bei Versorgungsbezügen sowie
   Kapitalauszahlungen/Abfindungen, soweit es sich nicht um Bezüge für mehrere Jahre handelt,
   in Cent (ggf. 0) */
  public var SONSTB : BigDecimal
  /* Sterbegeld bei Versorgungsbezuegen sowie Kapitalauszahlungen/Abfindungen,
   soweit es sich nicht um Bezuege fuer mehrere Jahre handelt
   (in SONSTB enthalten) in Cents */
  public var STERBE : BigDecimal
  /* Steuerklasse:
   1 = I
   2 = II
   3 = III
   4 = IV
   5 = V
   6 = VI */
  public var STKL : Int
  /* In RE4 enthaltene Versorgungsbezuege in Cents (ggf. 0) */
  public var VBEZ : BigDecimal
  /* Vorsorgungsbezug im Januar 2005 bzw. fuer den ersten vollen Monat
   in Cents */
  public var VBEZM : BigDecimal
  /* Voraussichtliche Sonderzahlungen im Kalenderjahr des Versorgungsbeginns
   bei Versorgungsempfaengern ohne Sterbegeld, Kapitalauszahlungen/Abfindungen
   bei Versorgungsbezuegen in Cents */
  public var VBEZS : BigDecimal
  /* In SONSTB enthaltene Versorgungsbezuege einschliesslich Sterbegeld
   in Cents (ggf. 0) */
  public var VBS : BigDecimal
  /* Jahr, in dem der Versorgungsbezug erstmalig gewaehrt wurde; werden
   mehrere Versorgungsbezuege gezahlt, so gilt der aelteste erstmalige Bezug */
  public var VJAHR : Int
  /* Kapitalauszahlungen / Abfindungen / Nachzahlungen bei Versorgungsbezügen
   für mehrere Jahre in Cent (ggf. 0) */
  public var VKAPA : BigDecimal
  /* Entschädigungen und Vergütung für mehrjährige Tätigkeit sowie tarifermäßigt
   zu besteuernde Vorteile bei Vermögensbeteiligungen (§ 19a Absatz 4 Satz 2 EStG)
   ohne Kapitalauszahlungen und ohne Abfindungen bei Versorgungsbezügen
   in Cent (ggf. 0) */
  public var VMT : BigDecimal
  /* Zahl der Freibetraege fuer Kinder (eine Dezimalstelle, nur bei Steuerklassen
   I, II, III und IV) */
  public var ZKF : BigDecimal
  /* Zahl der Monate, fuer die Versorgungsbezuege gezahlt werden (nur
   erforderlich bei Jahresberechnung (LZZ = 1) */
  public var ZMVB : Int
  /* In JRE4 enthaltene Entschädigungen nach § 24 Nummer 1 EStG und zu besteuernde
   Vorteile bei Vermögensbeteiligungen (§ 19a Absatz 4 EStG in Cent */
  public var JRE4ENT : BigDecimal = BigDecimal.ZERO
  /* In SONSTB enthaltene Entschädigungen nach § 24 Nummer 1 EStG sowie nicht
   tarifermäßigt zu besteuernde Vorteile bei Vermögensbeteiligungen in Cent */
  public var SONSTENT : BigDecimal = BigDecimal.ZERO
  /* AUSGABEPARAMETER */
  // MARK: Outputvariables
  /* Bemessungsgrundlage fuer die Kirchenlohnsteuer in Cents */
  public var BK : BigDecimal  = BigDecimal(0)
  /* Bemessungsgrundlage der sonstigen Bezüge (ohne Vergütung für mehrjährige Tätigkeit)
   für die Kirchenlohnsteuer in Cent.
   Hinweis: Negativbeträge, die aus nicht zu besteuernden Vorteilen bei
   Vermögensbeteiligungen (§ 19a Absatz 1 Satz 4 EStG) resultieren, mindern BK
   (maximal bis 0). Der Sonderausgabenabzug für tatsächlich erbrachte Vorsorgeaufwendungen
   im Rahmen der Veranlagung zur Einkommensteuer bleibt unberührt. */
  public var BKS : BigDecimal  = BigDecimal(0)
  /* Bemessungsgrundlage der Vergütung für mehrjährige Tätigkeit und der tarifermäßigt
   zu besteuernden Vorteile bei Vermögensbeteiligungen für die Kirchenlohnsteuer in Cent */
  public var BKV : BigDecimal  = BigDecimal(0)
  /* Fuer den Lohnzahlungszeitraum einzubehaltende Lohnsteuer in Cents */
  public var LSTLZZ : BigDecimal  = BigDecimal(0)
  /* Fuer den Lohnzahlungszeitraum einzubehaltender Solidaritaetszuschlag
   in Cents */
  public var SOLZLZZ : BigDecimal  = BigDecimal(0)
  /* Solidaritätszuschlag für sonstige Bezüge (ohne Vergütung für mehrjährige Tätigkeit in Cent.
   Hinweis: Negativbeträge, die aus nicht zu besteuernden Vorteilen bei Vermögensbeteiligungen
   (§ 19a Absatz 1 Satz 4 EStG) resultieren, mindern SOLZLZZ (maximal bis 0). Der
   Sonderausgabenabzug für tatsächlich erbrachte Vorsorgeaufwendungen im Rahmen der
   Veranlagung zur Einkommensteuer bleibt unberührt. */
  public var SOLZS : BigDecimal  = BigDecimal(0)
  /* Solidaritätszuschlag für die Vergütung für mehrjährige Tätigkeit und der tarifermäßigt
   zu besteuernden Vorteile bei Vermögensbeteiligungen in Cent */
  public var SOLZV : BigDecimal  = BigDecimal(0)
  /* Lohnsteuer für sonstige Bezüge (ohne Vergütung für mehrjährige Tätigkeit und ohne
   tarifermäßigt zu besteuernde Vorteile bei Vermögensbeteiligungen) in Cent
   Hinweis: Negativbeträge, die aus nicht zu besteuernden Vorteilen bei Vermögensbeteiligungen
   (§ 19a Absatz 1 Satz 4 EStG) resultieren, mindern LSTLZZ (maximal bis 0). Der
   Sonderausgabenabzug für tatsächlich erbrachte Vorsorgeaufwendungen im Rahmen der
   Veranlagung zur Einkommensteuer bleibt unberührt. */
  public var STS : BigDecimal  = BigDecimal(0)
  /* Lohnsteuer für die Vergütung für mehrjährige Tätigkeit und der tarifermäßigt zu besteuernden
   Vorteile bei Vermögensbeteiligungen in Cent */
  public var STV : BigDecimal  = BigDecimal(0)
  /* Für den Lohnzahlungszeitraum berücksichtigte Beiträge des Arbeitnehmers zur
   privaten Basis-Krankenversicherung und privaten Pflege-Pflichtversicherung (ggf. auch
   die Mindestvorsorgepauschale) in Cent beim laufenden Arbeitslohn. Für Zwecke der Lohn-
   steuerbescheinigung sind die einzelnen Ausgabewerte außerhalb des eigentlichen Lohn-
   steuerbescheinigungsprogramms zu addieren; hinzuzurechnen sind auch die Ausgabewerte
   VKVSONST */
  public var VKVLZZ : BigDecimal  = BigDecimal(0)
  /* Für den Lohnzahlungszeitraum berücksichtigte Beiträge des Arbeitnehmers
   zur privaten Basis-Krankenversicherung und privaten Pflege-Pflichtversicherung (ggf.
   auch die Mindestvorsorgepauschale) in Cent bei sonstigen Bezügen. Der Ausgabewert kann
   auch negativ sein. Für tarifermäßigt zu besteuernde Vergütungen für mehrjährige
   Tätigkeiten enthält der PAP keinen entsprechenden Ausgabewert. */
  public var VKVSONST : BigDecimal  = BigDecimal(0)
  /* AUSGABEPARAMETER DBA */
  // MARK: Outputvariables
  /* Verbrauchter Freibetrag bei Berechnung des laufenden Arbeitslohns, in Cent */
  public var VFRB : BigDecimal  = BigDecimal(0)
  /* Verbrauchter Freibetrag bei Berechnung des voraussichtlichen Jahresarbeitslohns, in Cent */
  public var VFRBS1 : BigDecimal  = BigDecimal(0)
  /* Verbrauchter Freibetrag bei Berechnung der sonstigen Bezüge, in Cent */
  public var VFRBS2 : BigDecimal  = BigDecimal(0)
  /* Für die weitergehende Berücksichtigung des Steuerfreibetrags nach dem DBA Türkei verfügbares ZVE über
   dem Grundfreibetrag bei der Berechnung des laufenden Arbeitslohns, in Cent */
  public var WVFRB : BigDecimal  = BigDecimal(0)
  /* Für die weitergehende Berücksichtigung des Steuerfreibetrags nach dem DBA Türkei verfügbares ZVE über dem Grundfreibetrag
   bei der Berechnung des voraussichtlichen Jahresarbeitslohns, in Cent */
  public var WVFRBO : BigDecimal  = BigDecimal(0)
  /* Für die weitergehende Berücksichtigung des Steuerfreibetrags nach dem DBA Türkei verfügbares ZVE
   über dem Grundfreibetrag bei der Berechnung der sonstigen Bezüge, in Cent */
  public var WVFRBM : BigDecimal  = BigDecimal(0)
  /* INTERNE FELDER */
  // MARK: internal variables
  /* Altersentlastungsbetrag nach Alterseinkünftegesetz in €,
   Cent (2 Dezimalstellen) */
  private var ALTE: BigDecimal = BigDecimal(0)
  /* Arbeitnehmer-Pauschbetrag in EURO */
  private var ANP: BigDecimal = BigDecimal(0)
  /* Auf den Lohnzahlungszeitraum entfallender Anteil von Jahreswerten
   auf ganze Cents abgerundet */
  private var ANTEIL1: BigDecimal = BigDecimal(0)
  /* Bemessungsgrundlage für Altersentlastungsbetrag in €, Cent
   (2 Dezimalstellen) */
  private var BMG: BigDecimal = BigDecimal(0)
  /* Beitragsbemessungsgrenze in der gesetzlichen Krankenversicherung
   und der sozialen Pflegeversicherung in Euro */
  private var BBGKVPV: BigDecimal = BigDecimal(0)
  /* allgemeine Beitragsbemessungsgrenze in der allgemeinen Renten-versicherung in Euro */
  private var BBGRV: BigDecimal = BigDecimal(0)
  /* Differenz zwischen ST1 und ST2 in EURO */
  private var DIFF: BigDecimal = BigDecimal(0)
  /* Entlastungsbetrag für Alleinerziehende in Euro */
  private var EFA: BigDecimal = BigDecimal(0)
  /* Versorgungsfreibetrag in €, Cent (2 Dezimalstellen) */
  private var FVB: BigDecimal = BigDecimal(0)
  /* Versorgungsfreibetrag in €, Cent (2 Dezimalstellen) für die Berechnung
   der Lohnsteuer für den sonstigen Bezug */
  private var FVBSO: BigDecimal = BigDecimal(0)
  /* Zuschlag zum Versorgungsfreibetrag in EURO */
  private var FVBZ: BigDecimal = BigDecimal(0)
  /* Zuschlag zum Versorgungsfreibetrag in EURO fuer die Berechnung
   der Lohnsteuer beim sonstigen Bezug */
  private var FVBZSO: BigDecimal = BigDecimal(0)
  /* Grundfreibetrag in Euro */
  private var GFB: BigDecimal = BigDecimal(0)
  /* Maximaler Altersentlastungsbetrag in € */
  private var HBALTE: BigDecimal = BigDecimal(0)
  /* Massgeblicher maximaler Versorgungsfreibetrag in € */
  private var HFVB: BigDecimal = BigDecimal(0)
  /* Massgeblicher maximaler Zuschlag zum Versorgungsfreibetrag in €,Cent
   (2 Dezimalstellen) */
  private var HFVBZ: BigDecimal = BigDecimal(0)
  /* Massgeblicher maximaler Zuschlag zum Versorgungsfreibetrag in €, Cent
   (2 Dezimalstellen) für die Berechnung der Lohnsteuer für den
   sonstigen Bezug */
  private var HFVBZSO: BigDecimal = BigDecimal(0)
  /* Nummer der Tabellenwerte fuer Versorgungsparameter */
  private var J: Int = 0
  /* Jahressteuer nach § 51a EStG, aus der Solidaritaetszuschlag und
   Bemessungsgrundlage fuer die Kirchenlohnsteuer ermittelt werden in EURO */
  private var JBMG: BigDecimal = BigDecimal(0)
  /* Auf einen Jahreslohn hochgerechneter LZZFREIB in €, Cent
   (2 Dezimalstellen) */
  private var JLFREIB: BigDecimal = BigDecimal(0)
  /* Auf einen Jahreslohn hochgerechnete LZZHINZU in €, Cent
   (2 Dezimalstellen) */
  private var JLHINZU: BigDecimal = BigDecimal(0)
  /* Jahreswert, dessen Anteil fuer einen Lohnzahlungszeitraum in
   UPANTEIL errechnet werden soll in Cents */
  private var JW: BigDecimal = BigDecimal(0)
  /* Nummer der Tabellenwerte fuer Parameter bei Altersentlastungsbetrag */
  private var K: Int = 0
  /* Merker für Berechnung Lohnsteuer für mehrjährige Tätigkeit.
   0 = normale Steuerberechnung
   1 = Steuerberechnung für mehrjährige Tätigkeit
   2 = entfällt */
  private var KENNVMT: Int = 0
  /* Summe der Freibetraege fuer Kinder in EURO */
  private var KFB: BigDecimal = BigDecimal(0)
  /* Beitragssatz des Arbeitgebers zur Krankenversicherung */
  private var KVSATZAG: BigDecimal = BigDecimal(0)
  /* Beitragssatz des Arbeitnehmers zur Krankenversicherung */
  private var KVSATZAN: BigDecimal = BigDecimal(0)
  /* Kennzahl fuer die Einkommensteuer-Tabellenart:
   1 = Grundtabelle
   2 = Splittingtabelle */
  private var KZTAB: Int = 0
  /* Jahreslohnsteuer in EURO */
  private var LSTJAHR: BigDecimal = BigDecimal(0)
  /* Zwischenfelder der Jahreslohnsteuer in Cent */
  private var LST1: BigDecimal = BigDecimal(0)
  private var LST2: BigDecimal = BigDecimal(0)
  private var LST3: BigDecimal = BigDecimal(0)
  private var LSTOSO: BigDecimal = BigDecimal(0)
  private var LSTSO: BigDecimal = BigDecimal(0)
  /* Mindeststeuer fuer die Steuerklassen V und VI in EURO */
  private var MIST: BigDecimal = BigDecimal(0)
  /* Beitragssatz des Arbeitgebers zur Pflegeversicherung (6 Dezimalstellen) */
  private var PVSATZAG: BigDecimal = BigDecimal(0)
  /* Beitragssatz des Arbeitnehmers zur Pflegeversicherung (6 Dezimalstellen) */
  private var PVSATZAN: BigDecimal = BigDecimal(0)
  /* Beitragssatz des Arbeitnehmers in der allgemeinen gesetzlichen Rentenversicherung (4 Dezimalstellen) */
  private var RVSATZAN: BigDecimal = BigDecimal(0)
  /* Rechenwert in Gleitkommadarstellung */
  private var RW: BigDecimal = BigDecimal(0)
  /* Sonderausgaben-Pauschbetrag in EURO */
  private var SAP: BigDecimal = BigDecimal(0)
  /* Freigrenze fuer den Solidaritaetszuschlag in EURO */
  private var SOLZFREI: BigDecimal = BigDecimal(0)
  /* Solidaritaetszuschlag auf die Jahreslohnsteuer in EURO, C (2 Dezimalstellen) */
  private var SOLZJ: BigDecimal = BigDecimal(0)
  /* Zwischenwert fuer den Solidaritaetszuschlag auf die Jahreslohnsteuer
   in EURO, C (2 Dezimalstellen) */
  private var SOLZMIN: BigDecimal = BigDecimal(0)
  /* Neu ab 2021: Bemessungsgrundlage des Solidaritätszuschlags zur Prüfung der Freigrenze beim Solidaritätszuschlag für sonstige Bezüge (ohne Vergütung für mehrjährige Tätigkeit) in Euro */
  private var SOLZSBMG: BigDecimal = BigDecimal(0)
  /* Neu ab 2021: Zu versteuerndes Einkommen für die Ermittlung der Bemessungsgrundlage des Solidaritätszuschlags zur Prüfung der Freigrenze beim Solidaritätszuschlag für sonstige Bezüge (ohne Vergütung für mehrjährige Tätigkeit) in Euro, Cent (2 Dezimalstellen) */
  private var SOLZSZVE: BigDecimal = BigDecimal(0)
  /* Neu ab 2021: Bemessungsgrundlage des Solidaritätszuschlags für die Prüfung der Freigrenze beim Solidaritätszuschlag für die Vergütung für mehrjährige Tätigkeit in Euro */
  private var SOLZVBMG: BigDecimal = BigDecimal(0)
  /* Tarifliche Einkommensteuer in EURO */
  private var ST: BigDecimal = BigDecimal(0)
  /* Tarifliche Einkommensteuer auf das 1,25-fache ZX in EURO */
  private var ST1: BigDecimal = BigDecimal(0)
  /* Tarifliche Einkommensteuer auf das 0,75-fache ZX in EURO */
  private var ST2: BigDecimal = BigDecimal(0)
  /* Zwischenfeld zur Ermittlung der Steuer auf Vergütungen für mehrjährige Tätigkeit */
  private var STOVMT: BigDecimal = BigDecimal(0)
  /* Teilbetragssatz der Vorsorgepauschale für die Rentenversicherung (2 Dezimalstellen) */
  private var TBSVORV: BigDecimal = BigDecimal(0)
  /* Bemessungsgrundlage fuer den Versorgungsfreibetrag in Cents */
  private var VBEZB: BigDecimal = BigDecimal(0)
  /* Bemessungsgrundlage für den Versorgungsfreibetrag in Cent für
   den sonstigen Bezug */
  private var VBEZBSO: BigDecimal = BigDecimal(0)
  /* Hoechstbetrag der Vorsorgepauschale nach Alterseinkuenftegesetz in EURO, C */
  private var VHB: BigDecimal = BigDecimal(0)
  /* Vorsorgepauschale in EURO, C (2 Dezimalstellen) */
  private var VSP: BigDecimal = BigDecimal(0)
  /* Vorsorgepauschale nach Alterseinkuenftegesetz in EURO, C */
  private var VSPN: BigDecimal = BigDecimal(0)
  /* Zwischenwert 1 bei der Berechnung der Vorsorgepauschale nach
   dem Alterseinkuenftegesetz in EURO, C (2 Dezimalstellen) */
  private var VSP1: BigDecimal = BigDecimal(0)
  /* Zwischenwert 2 bei der Berechnung der Vorsorgepauschale nach
   dem Alterseinkuenftegesetz in EURO, C (2 Dezimalstellen) */
  private var VSP2: BigDecimal = BigDecimal(0)
  /* Vorsorgepauschale mit Teilbeträgen für die gesetzliche Kranken- und
   soziale Pflegeversicherung nach fiktiven Beträgen oder ggf. für die
   private Basiskrankenversicherung und private Pflege-Pflichtversicherung
   in Euro, Cent (2 Dezimalstellen) */
  private var VSP3: BigDecimal = BigDecimal(0)
  /* Erster Grenzwert in Steuerklasse V/VI in Euro */
  private var W1STKL5: BigDecimal = BigDecimal(0)
  /* Zweiter Grenzwert in Steuerklasse V/VI in Euro */
  private var W2STKL5: BigDecimal = BigDecimal(0)
  /* Dritter Grenzwert in Steuerklasse V/VI in Euro */
  private var W3STKL5: BigDecimal = BigDecimal(0)
  /* Hoechstbetrag der Vorsorgepauschale nach § 10c Abs. 2 Nr. 2 EStG in EURO */
  private var VSPMAX1: BigDecimal = BigDecimal(0)
  /* Hoechstbetrag der Vorsorgepauschale nach § 10c Abs. 2 Nr. 3 EStG in EURO */
  private var VSPMAX2: BigDecimal = BigDecimal(0)
  /* Vorsorgepauschale nach § 10c Abs. 2 Satz 2 EStG vor der Hoechstbetragsberechnung
   in EURO, C (2 Dezimalstellen) */
  private var VSPO: BigDecimal = BigDecimal(0)
  /* Fuer den Abzug nach § 10c Abs. 2 Nrn. 2 und 3 EStG verbleibender
   Rest von VSPO in EURO, C (2 Dezimalstellen) */
  private var VSPREST: BigDecimal = BigDecimal(0)
  /* Hoechstbetrag der Vorsorgepauschale nach § 10c Abs. 2 Nr. 1 EStG
   in EURO, C (2 Dezimalstellen) */
  private var VSPVOR: BigDecimal = BigDecimal(0)
  /* Zu versteuerndes Einkommen gem. § 32a Abs. 1 und 2 EStG €, C
   (2 Dezimalstellen) */
  private var X: BigDecimal = BigDecimal(0)
  /* gem. § 32a Abs. 1 EStG (6 Dezimalstellen) */
  private var Y: BigDecimal = BigDecimal(0)
  /* Auf einen Jahreslohn hochgerechnetes RE4 in €, C (2 Dezimalstellen)
   nach Abzug der Freibeträge nach § 39 b Abs. 2 Satz 3 und 4. */
  private var ZRE4: BigDecimal = BigDecimal(0)
  /* Auf einen Jahreslohn hochgerechnetes RE4 in €, C (2 Dezimalstellen) */
  private var ZRE4J: BigDecimal = BigDecimal(0)
  /* Auf einen Jahreslohn hochgerechnetes RE4 in €, C (2 Dezimalstellen)
   nach Abzug des Versorgungsfreibetrags und des Alterentlastungsbetrags
   zur Berechnung der Vorsorgepauschale in €, Cent (2 Dezimalstellen) */
  private var ZRE4VP: BigDecimal = BigDecimal(0)
  /* Feste Tabellenfreibeträge (ohne Vorsorgepauschale) in €, Cent
   (2 Dezimalstellen) */
  private var ZTABFB: BigDecimal = BigDecimal(0)
  /* Auf einen Jahreslohn hochgerechnetes (VBEZ abzueglich FVB) in
   EURO, C (2 Dezimalstellen) */
  private var ZVBEZ: BigDecimal = BigDecimal(0)
  /* Auf einen Jahreslohn hochgerechnetes VBEZ in €, C (2 Dezimalstellen) */
  private var ZVBEZJ: BigDecimal = BigDecimal(0)
  /* Zu versteuerndes Einkommen in €, C (2 Dezimalstellen) */
  private var ZVE: BigDecimal = BigDecimal(0)
  /* Zwischenfelder zu X fuer die Berechnung der Steuer nach § 39b
   Abs. 2 Satz 7 EStG in € */
  private var ZX: BigDecimal = BigDecimal(0)
  private var ZZX: BigDecimal = BigDecimal(0)
  private var HOCH: BigDecimal = BigDecimal(0)
  private var VERGL: BigDecimal = BigDecimal(0)
  /* Jahreswert der berücksichtigten Beiträge zur privaten Basis-Krankenversicherung und
   privaten Pflege-Pflichtversicherung (ggf. auch die Mindestvorsorgepauschale) in Cent. */
  private var VKV: BigDecimal = BigDecimal(0)
  // MARK: constants
  /* Tabelle fuer die Vomhundertsaetze des Versorgungsfreibetrags */
  private let TAB1 : [BigDecimal] = [BigDecimal.valueOf (0.0), BigDecimal.valueOf (0.4), BigDecimal.valueOf (0.384), BigDecimal.valueOf (0.368),                  BigDecimal.valueOf (0.352), BigDecimal.valueOf (0.336), BigDecimal.valueOf (0.32), BigDecimal.valueOf (0.304),                  BigDecimal.valueOf (0.288), BigDecimal.valueOf (0.272), BigDecimal.valueOf (0.256), BigDecimal.valueOf (0.24),                   BigDecimal.valueOf (0.224), BigDecimal.valueOf (0.208), BigDecimal.valueOf (0.192), BigDecimal.valueOf (0.176),                  BigDecimal.valueOf (0.16), BigDecimal.valueOf (0.152),  BigDecimal.valueOf (0.144), BigDecimal.valueOf (0.136),                  BigDecimal.valueOf (0.128), BigDecimal.valueOf (0.12),  BigDecimal.valueOf (0.112), BigDecimal.valueOf (0.104),                  BigDecimal.valueOf (0.096), BigDecimal.valueOf (0.088), BigDecimal.valueOf (0.08), BigDecimal.valueOf (0.072),                  BigDecimal.valueOf (0.064), BigDecimal.valueOf (0.056), BigDecimal.valueOf (0.048), BigDecimal.valueOf (0.04),                  BigDecimal.valueOf (0.032), BigDecimal.valueOf (0.024), BigDecimal.valueOf (0.016), BigDecimal.valueOf (0.008),                  BigDecimal.valueOf (0.0)]
  /* Tabelle fuer die Hoechstbetrage des Versorgungsfreibetrags */
  private let TAB2 : [BigDecimal] = [BigDecimal.valueOf (0), BigDecimal.valueOf (3000), BigDecimal.valueOf (2880),            BigDecimal.valueOf (2760), BigDecimal.valueOf (2640), BigDecimal.valueOf (2520), BigDecimal.valueOf (2400),             BigDecimal.valueOf (2280), BigDecimal.valueOf (2160), BigDecimal.valueOf (2040), BigDecimal.valueOf (1920),             BigDecimal.valueOf (1800), BigDecimal.valueOf (1680), BigDecimal.valueOf (1560), BigDecimal.valueOf (1440),             BigDecimal.valueOf (1320), BigDecimal.valueOf (1200), BigDecimal.valueOf (1140), BigDecimal.valueOf (1080),             BigDecimal.valueOf (1020), BigDecimal.valueOf (960), BigDecimal.valueOf (900), BigDecimal.valueOf (840),             BigDecimal.valueOf (780),  BigDecimal.valueOf (720), BigDecimal.valueOf (660), BigDecimal.valueOf (600),             BigDecimal.valueOf (540),  BigDecimal.valueOf (480), BigDecimal.valueOf (420), BigDecimal.valueOf (360),             BigDecimal.valueOf (300),  BigDecimal.valueOf (240), BigDecimal.valueOf (180), BigDecimal.valueOf (120),             BigDecimal.valueOf (60),   BigDecimal.valueOf (0)]
  /* Tabelle fuer die Zuschlaege zum Versorgungsfreibetrag */
  private let TAB3 : [BigDecimal] = [BigDecimal.valueOf (0), BigDecimal.valueOf (900), BigDecimal.valueOf (864),           BigDecimal.valueOf (828), BigDecimal.valueOf (792), BigDecimal.valueOf (756), BigDecimal.valueOf (720),           BigDecimal.valueOf (684), BigDecimal.valueOf (648), BigDecimal.valueOf (612), BigDecimal.valueOf (576),           BigDecimal.valueOf (540), BigDecimal.valueOf (504), BigDecimal.valueOf (468), BigDecimal.valueOf (432),           BigDecimal.valueOf (396), BigDecimal.valueOf (360), BigDecimal.valueOf (342), BigDecimal.valueOf (324),           BigDecimal.valueOf (306), BigDecimal.valueOf (288), BigDecimal.valueOf (270), BigDecimal.valueOf (252),           BigDecimal.valueOf (234), BigDecimal.valueOf (216), BigDecimal.valueOf (198), BigDecimal.valueOf (180),           BigDecimal.valueOf (162), BigDecimal.valueOf (144), BigDecimal.valueOf (126), BigDecimal.valueOf (108),           BigDecimal.valueOf (90),  BigDecimal.valueOf (72), BigDecimal.valueOf (54), BigDecimal.valueOf (36),           BigDecimal.valueOf (18),  BigDecimal.valueOf (0)]
  /* Tabelle fuer die Vomhundertsaetze des Altersentlastungsbetrags */
  private let TAB4 : [BigDecimal] = [BigDecimal.valueOf (0.0), BigDecimal.valueOf (0.4), BigDecimal.valueOf (0.384),           BigDecimal.valueOf (0.368), BigDecimal.valueOf (0.352), BigDecimal.valueOf (0.336), BigDecimal.valueOf (0.32),            BigDecimal.valueOf (0.304), BigDecimal.valueOf (0.288), BigDecimal.valueOf (0.272), BigDecimal.valueOf (0.256),            BigDecimal.valueOf (0.24),  BigDecimal.valueOf (0.224), BigDecimal.valueOf (0.208), BigDecimal.valueOf (0.192),            BigDecimal.valueOf (0.176), BigDecimal.valueOf (0.16), BigDecimal.valueOf (0.152),  BigDecimal.valueOf (0.144),            BigDecimal.valueOf (0.136), BigDecimal.valueOf (0.128), BigDecimal.valueOf (0.12),  BigDecimal.valueOf (0.112),            BigDecimal.valueOf (0.104), BigDecimal.valueOf (0.096), BigDecimal.valueOf (0.088), BigDecimal.valueOf (0.08),            BigDecimal.valueOf (0.072), BigDecimal.valueOf (0.064), BigDecimal.valueOf (0.056), BigDecimal.valueOf (0.048),            BigDecimal.valueOf (0.04),  BigDecimal.valueOf (0.032), BigDecimal.valueOf (0.024), BigDecimal.valueOf (0.016),            BigDecimal.valueOf (0.008), BigDecimal.valueOf (0.0)]
  /* Tabelle fuer die Hoechstbetraege des Altersentlastungsbetrags */
  private let TAB5 : [BigDecimal] = [BigDecimal.valueOf (0), BigDecimal.valueOf (1900), BigDecimal.valueOf (1824),           BigDecimal.valueOf (1748), BigDecimal.valueOf (1672), BigDecimal.valueOf (1596), BigDecimal.valueOf (1520),           BigDecimal.valueOf (1444), BigDecimal.valueOf (1368), BigDecimal.valueOf (1292), BigDecimal.valueOf (1216),           BigDecimal.valueOf (1140), BigDecimal.valueOf (1064), BigDecimal.valueOf (988),  BigDecimal.valueOf (912),           BigDecimal.valueOf (836),  BigDecimal.valueOf (760), BigDecimal.valueOf (722), BigDecimal.valueOf (684),           BigDecimal.valueOf (646),  BigDecimal.valueOf (608), BigDecimal.valueOf (570), BigDecimal.valueOf (532),           BigDecimal.valueOf (494),  BigDecimal.valueOf (456), BigDecimal.valueOf (418), BigDecimal.valueOf (380),           BigDecimal.valueOf (342),  BigDecimal.valueOf (304), BigDecimal.valueOf (266), BigDecimal.valueOf (228),           BigDecimal.valueOf (190),  BigDecimal.valueOf (152), BigDecimal.valueOf (114), BigDecimal.valueOf (76),           BigDecimal.valueOf (38),   BigDecimal.valueOf (0)]
  /* Zahlenkonstanten fuer im Plan oft genutzte BigDecimal Werte */
  private let ZAHL1 : BigDecimal = BigDecimal.ONE
  private let ZAHL2 : BigDecimal = BigDecimal(2)
  private let ZAHL5 : BigDecimal = BigDecimal(5)
  private let ZAHL7 : BigDecimal = BigDecimal(7)
  private let ZAHL12 : BigDecimal = BigDecimal(12)
  private let ZAHL100 : BigDecimal = BigDecimal(100)
  private let ZAHL360 : BigDecimal = BigDecimal(360)
  private let ZAHL500 : BigDecimal = BigDecimal(500)
  private let ZAHL700 : BigDecimal = BigDecimal(700)
  private let ZAHL1000 : BigDecimal = BigDecimal(1000)
  private let ZAHL10000 : BigDecimal = BigDecimal(10000)
  /* PROGRAMMABLAUFPLAN, PAP Seite 14 */
  public  func MAIN(){
    MPARA ()
    MRE4JL ()
    VBEZBSO = BigDecimal.ZERO
    KENNVMT = 0
    MRE4 ()
    MRE4ABZ ()
    MBERECH ()
    MSONST ()
    MVMT ()
  } // method MAIN
  /* Zuweisung von Werten für bestimmte Sozialversicherungsparameter  PAP Seite 15 */
  private  func MPARA(){
    if (KRV < 2) {
      /* &lt; = < */
      if (KRV == 0) {
        BBGRV = BigDecimal(87600)
        /* Geändert für 2023 */
      } else {
        BBGRV = BigDecimal(85200)
        /* Geändert für 2023 */
      } // end-if for: KRV == 0
      RVSATZAN = BigDecimal.valueOf(0.093)
      /* Neu 2019 */
      TBSVORV = BigDecimal.valueOf(1.00)
      /* Geändert für 2023 */
    } else {
      /* Nichts zu tun */
    } // end-if for: KRV < 2
    BBGKVPV = BigDecimal(59850)
    /* Geändert für 2023 */
    KVSATZAN = (KVZ.divide(ZAHL2).divide(ZAHL100)).add(BigDecimal.valueOf(0.07))
    /* Neu 2019 */
    KVSATZAG = BigDecimal.valueOf(0.008).add(BigDecimal.valueOf(0.07))
    /* Bugfix für 2023 ab Juli */
    /* Neu ab 2023AbJuli */
    if (LZZ == 1) {
      if (PVS == 1) {
        PVSATZAN = BigDecimal.valueOf(0.021125)
        PVSATZAG = BigDecimal.valueOf(0.011125)
      } else {
        PVSATZAN = BigDecimal.valueOf(0.016125)
        PVSATZAG = BigDecimal.valueOf(0.016125)
      } // end-if for: PVS == 1
      if (PVZ == 1) {
        PVSATZAN = PVSATZAN.add(BigDecimal.valueOf(0.00475))
      } // end-if for: PVZ == 1
    } else {
      if (PVS == 1) {
        PVSATZAN = BigDecimal.valueOf(0.022)
        PVSATZAG = BigDecimal.valueOf(0.012)
      } else {
        PVSATZAN = BigDecimal.valueOf(0.017)
        PVSATZAG = BigDecimal.valueOf(0.017)
      } // end-if for: PVS == 1
      if (PVZ == 1) {
        PVSATZAN = PVSATZAN.add(BigDecimal.valueOf(0.006))
      } // end-if for: PVZ == 1
    } // end-if for: LZZ == 1
    /* Anfang Geändert für 2023 */
    W1STKL5 = BigDecimal(12485)
    W2STKL5 = BigDecimal(31404)
    W3STKL5 = BigDecimal(222260)
    GFB = BigDecimal(10908)
    SOLZFREI = BigDecimal(17543)
    /* Ende Geändert für 2023 */
  } // method MPARA
  /* Ermittlung des Jahresarbeitslohns nach § 39 b Abs. 2 Satz 2 EStG, PAP Seite 16 */
  private  func MRE4JL(){
    if (LZZ == 1) {
      ZRE4J = RE4.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
      ZVBEZJ = VBEZ.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
      JLFREIB = LZZFREIB.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
      JLHINZU = LZZHINZU.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
    } else {
      if (LZZ == 2) {
        ZRE4J = (RE4.multiply (ZAHL12)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
        ZVBEZJ = (VBEZ.multiply (ZAHL12)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
        JLFREIB = (LZZFREIB.multiply (ZAHL12)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
        JLHINZU = (LZZHINZU.multiply (ZAHL12)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
      } else {
        if (LZZ == 3) {
          ZRE4J = (RE4.multiply (ZAHL360)).divide (ZAHL700, 2, BigDecimal.ROUND_DOWN)
          ZVBEZJ = (VBEZ.multiply (ZAHL360)).divide (ZAHL700, 2, BigDecimal.ROUND_DOWN)
          JLFREIB = (LZZFREIB.multiply (ZAHL360)).divide (ZAHL700, 2, BigDecimal.ROUND_DOWN)
          JLHINZU = (LZZHINZU.multiply (ZAHL360)).divide (ZAHL700, 2, BigDecimal.ROUND_DOWN)
        } else {
          ZRE4J = (RE4.multiply (ZAHL360)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
          ZVBEZJ = (VBEZ.multiply (ZAHL360)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
          JLFREIB = (LZZFREIB.multiply (ZAHL360)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
          JLHINZU = (LZZHINZU.multiply (ZAHL360)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
        } // end-if for: LZZ == 3
      } // end-if for: LZZ == 2
    } // end-if for: LZZ == 1
    if (af == 0) {
      f = 1
    } // end-if for: af == 0
  } // method MRE4JL
  /* Freibeträge für Versorgungsbezüge, Altersentlastungsbetrag (§ 39b Abs. 2 Satz 3 EStG), PAP Seite 17 */
  private  func MRE4(){
    if (ZVBEZJ.compareTo (BigDecimal.ZERO) == 0) {
      FVBZ = BigDecimal.ZERO
      FVB = BigDecimal.ZERO
      FVBZSO = BigDecimal.ZERO
      FVBSO = BigDecimal.ZERO
    } else {
      if (VJAHR < 2006) {
        J = 1
      } else {
        if (VJAHR < 2040) {
          J = VJAHR - 2004
        } else {
          J = 36
        } // end-if for: VJAHR < 2040
      } // end-if for: VJAHR < 2006
      if (LZZ == 1) {
        VBEZB = (VBEZM.multiply (BigDecimal.valueOf (ZMVB))).add (VBEZS)
        HFVB = TAB2[J].divide (ZAHL12).multiply (BigDecimal.valueOf (ZMVB))
        FVBZ = TAB3[J].divide (ZAHL12).multiply (BigDecimal.valueOf (ZMVB)).setScale (0, BigDecimal.ROUND_UP)
      } else {
        VBEZB = ((VBEZM.multiply (ZAHL12)).add (VBEZS)).setScale (2, BigDecimal.ROUND_DOWN)
        HFVB = TAB2[J]
        FVBZ = TAB3[J]
      } // end-if for: LZZ == 1
      FVB = ((VBEZB.multiply (TAB1[J]))).divide (ZAHL100).setScale (2, BigDecimal.ROUND_UP)
      if (FVB.compareTo (HFVB) == 1) {
        FVB = HFVB
      } // end-if for: FVB.compareTo (HFVB) == 1
      if (FVB.compareTo (ZVBEZJ) == 1) {
        FVB = ZVBEZJ
      } // end-if for: FVB.compareTo (ZVBEZJ) == 1
      FVBSO = (FVB.add((VBEZBSO.multiply (TAB1[J])).divide (ZAHL100))).setScale (2, BigDecimal.ROUND_UP)
      if (FVBSO.compareTo (TAB2[J]) == 1) {
        FVBSO = TAB2[J]
      } // end-if for: FVBSO.compareTo (TAB2[J]) == 1
      HFVBZSO = (((VBEZB.add(VBEZBSO)).divide (ZAHL100)).subtract (FVBSO)).setScale (2, BigDecimal.ROUND_DOWN)
      FVBZSO = (FVBZ.add((VBEZBSO).divide (ZAHL100))).setScale (0, BigDecimal.ROUND_UP)
      if (FVBZSO.compareTo (HFVBZSO) == 1) {
        FVBZSO = HFVBZSO.setScale(0, BigDecimal.ROUND_UP)
      } // end-if for: FVBZSO.compareTo (HFVBZSO) == 1
      if (FVBZSO.compareTo (TAB3[J]) == 1) {
        FVBZSO = TAB3[J]
      } // end-if for: FVBZSO.compareTo (TAB3[J]) == 1
      HFVBZ = ((VBEZB.divide (ZAHL100)).subtract (FVB)).setScale (2, BigDecimal.ROUND_DOWN)
      if (FVBZ.compareTo (HFVBZ) == 1) {
        FVBZ = HFVBZ.setScale (0, BigDecimal.ROUND_UP)
      } // end-if for: FVBZ.compareTo (HFVBZ) == 1
    } // end-if for: ZVBEZJ.compareTo (BigDecimal.ZERO) == 0
    MRE4ALTE ()
  } // method MRE4
  /* Altersentlastungsbetrag (§ 39b Abs. 2 Satz 3 EStG), PAP Seite 18 */
  private  func MRE4ALTE(){
    if (ALTER1 == 0) {
      ALTE = BigDecimal.ZERO
    } else {
      if (AJAHR < 2006) {
        K = 1
      } else {
        if (AJAHR < 2040) {
          K = AJAHR - 2004
        } else {
          K = 36
        } // end-if for: AJAHR < 2040
      } // end-if for: AJAHR < 2006
      BMG = ZRE4J.subtract (ZVBEZJ)
      /* Lt. PAP muss hier auf ganze EUR gerundet werden */
      ALTE = (BMG.multiply(TAB4[K])).setScale(0, BigDecimal.ROUND_UP)
      HBALTE = TAB5[K]
      if (ALTE.compareTo (HBALTE) == 1) {
        ALTE = HBALTE
      } // end-if for: ALTE.compareTo (HBALTE) == 1
    } // end-if for: ALTER1 == 0
  } // method MRE4ALTE
  /* Ermittlung des Jahresarbeitslohns nach Abzug der Freibeträge nach § 39 b Abs. 2 Satz 3 und 4 EStG, PAP Seite 20 */
  private  func MRE4ABZ(){
    ZRE4 = (ZRE4J.subtract (FVB).subtract   (ALTE).subtract (JLFREIB).add (JLHINZU)).setScale (2, BigDecimal.ROUND_DOWN)
    if (ZRE4.compareTo (BigDecimal.ZERO) == -1) {
      ZRE4 = BigDecimal.ZERO
    } // end-if for: ZRE4.compareTo (BigDecimal.ZERO) == -1
    ZRE4VP = ZRE4J
    if (KENNVMT == 2) {
      ZRE4VP = ZRE4VP.subtract(ENTSCH.divide(ZAHL100)).setScale(2,BigDecimal.ROUND_DOWN)
    } // end-if for: KENNVMT == 2
    ZVBEZ = ZVBEZJ.subtract(FVB).setScale(2, BigDecimal.ROUND_DOWN)
    if (ZVBEZ.compareTo(BigDecimal.ZERO) == -1) {
      ZVBEZ = BigDecimal.ZERO
    } // end-if for: ZVBEZ.compareTo(BigDecimal.ZERO) == -1
  } // method MRE4ABZ
  /* Berechnung fuer laufende Lohnzahlungszeitraueme Seite 21 */
  private  func MBERECH(){
    MZTABFB ()
    VFRB = ((ANP.add(FVB.add(FVBZ))).multiply(ZAHL100)).setScale(0, BigDecimal.ROUND_DOWN)
    MLSTJAHR ()
    WVFRB = ((ZVE.subtract(GFB)).multiply(ZAHL100)).setScale(0, BigDecimal.ROUND_DOWN)
    if (WVFRB.compareTo(BigDecimal.ZERO) == -1) {
      /* WVFRB < 0 */
      WVFRB = BigDecimal.valueOf(0)
    } // end-if for: WVFRB.compareTo(BigDecimal.ZERO) == -1
    LSTJAHR = (ST.multiply(BigDecimal.valueOf(f))).setScale(0,BigDecimal.ROUND_DOWN)
    UPLSTLZZ ()
    UPVKVLZZ ()
    if (ZKF.compareTo(BigDecimal.ZERO) == 1) {
      /* ZKF > 0 */
      ZTABFB = ZTABFB.add(KFB)
      MRE4ABZ ()
      MLSTJAHR ()
      JBMG = (ST.multiply(BigDecimal.valueOf(f))).setScale(0,BigDecimal.ROUND_DOWN)
    } else {
      JBMG = LSTJAHR
    } // end-if for: ZKF.compareTo(BigDecimal.ZERO) == 1
    MSOLZ ()
  } // method MBERECH
  /* Ermittlung der festen Tabellenfreibeträge (ohne Vorsorgepauschale), PAP Seite 22 */
  private  func MZTABFB(){
    ANP = BigDecimal.ZERO
    if (ZVBEZ.compareTo (BigDecimal.ZERO) >= 0 && ZVBEZ.compareTo(FVBZ) == -1) {
      FVBZ = BigDecimal.valueOf(ZVBEZ.longValue())
    } // end-if for: ZVBEZ.compareTo (BigDecimal.ZERO) >= 0 && ZVBEZ.compareTo(FVBZ) == -1
    if (STKL < 6) {
      if (ZVBEZ.compareTo (BigDecimal.ZERO) == 1) {
        if ((ZVBEZ.subtract (FVBZ)).compareTo (BigDecimal.valueOf (102)) == -1) {
          ANP = (ZVBEZ.subtract (FVBZ)).setScale (0, BigDecimal.ROUND_UP)
        } else {
          ANP = BigDecimal.valueOf (102)
        } // end-if for: (ZVBEZ.subtract (FVBZ)).compareTo (BigDecimal.valueOf (102)) == -1
      } // end-if for: ZVBEZ.compareTo (BigDecimal.ZERO) == 1
    } else {
      FVBZ = BigDecimal.valueOf (0)
      FVBZSO = BigDecimal.valueOf (0)
    } // end-if for: STKL < 6
    if (STKL < 6) {
      if (ZRE4.compareTo(ZVBEZ) == 1) {
        if (ZRE4.subtract(ZVBEZ).compareTo(BigDecimal.valueOf(1230)) == -1) {
          /* Geändert für 2023 */
          ANP = ANP.add(ZRE4).subtract(ZVBEZ).setScale(0,BigDecimal.ROUND_UP)
        } else {
          ANP = ANP.add(BigDecimal.valueOf(1230))
          /* Geändert für 2023 */
        } // end-if for: ZRE4.subtract(ZVBEZ).compareTo(BigDecimal.valueOf(1230)) == -1
      } // end-if for: ZRE4.compareTo(ZVBEZ) == 1
    } // end-if for: STKL < 6
    KZTAB = 1
    if (STKL == 1) {
      SAP = BigDecimal.valueOf (36)
      KFB = (ZKF.multiply (BigDecimal.valueOf (8952))).setScale (0, BigDecimal.ROUND_DOWN)
      /* Geändert für 2023 */
    } else {
      if (STKL == 2) {
        EFA = BigDecimal.valueOf (4260)
        /* Geändert für 2023 */
        SAP = BigDecimal.valueOf (36)
        KFB = (ZKF.multiply (BigDecimal.valueOf (8952))).setScale (0, BigDecimal.ROUND_DOWN)
        /* Geändert für 2023 */
      } else {
        if (STKL == 3) {
          KZTAB = 2
          SAP = BigDecimal.valueOf (36)
          KFB = (ZKF.multiply (BigDecimal.valueOf (8952))).setScale (0, BigDecimal.ROUND_DOWN)
          /* Geändert für 2023 */
        } else {
          if (STKL == 4) {
            SAP = BigDecimal.valueOf (36)
            KFB = (ZKF.multiply (BigDecimal.valueOf (4476))).setScale (0, BigDecimal.ROUND_DOWN)
            /* Geändert für 2023 */
          } else {
            if (STKL == 5) {
              SAP = BigDecimal.valueOf (36)
              KFB = BigDecimal.ZERO
            } else {
              KFB = BigDecimal.ZERO
            } // end-if for: STKL == 5
          } // end-if for: STKL == 4
        } // end-if for: STKL == 3
      } // end-if for: STKL == 2
    } // end-if for: STKL == 1
    ZTABFB = (EFA.add (ANP).add (SAP).add (FVBZ)).setScale (2, BigDecimal.ROUND_DOWN)
  } // method MZTABFB
  /* Ermittlung Jahreslohnsteuer, PAP Seite 23 */
  private  func MLSTJAHR(){
    UPEVP ()
    if (KENNVMT != 1) {
      ZVE = (ZRE4.subtract (ZTABFB).subtract (VSP)).setScale (2, BigDecimal.ROUND_DOWN)
      UPMLST ()
    } else {
      ZVE = (ZRE4.subtract (ZTABFB).subtract (VSP).subtract ((VMT).divide (ZAHL100)).subtract ((VKAPA).divide (ZAHL100))).setScale (2, BigDecimal.ROUND_DOWN)
      if (ZVE.compareTo (BigDecimal.ZERO) == -1) {
        ZVE = ZVE.add(VMT.divide(ZAHL100)).add(VKAPA.divide(ZAHL100)).divide(ZAHL5).setScale(2,BigDecimal.ROUND_DOWN)
        UPMLST ()
        ST = (ST.multiply (ZAHL5)).setScale (0, BigDecimal.ROUND_DOWN)
      } else {
        UPMLST ()
        STOVMT = ST
        ZVE = (ZVE.add(((VMT.add (VKAPA)).divide (ZAHL500)))).setScale (2, BigDecimal.ROUND_DOWN)
        UPMLST ()
        ST = (((ST.subtract (STOVMT)).multiply (ZAHL5)).add (STOVMT)).setScale (0, BigDecimal.ROUND_DOWN)
      } // end-if for: ZVE.compareTo (BigDecimal.ZERO) == -1
    } // end-if for: KENNVMT != 1
  } // method MLSTJAHR
  /* PAP Seite 24 */
  private  func UPVKVLZZ(){
    UPVKV ()
    JW = VKV
    UPANTEIL ()
    VKVLZZ = ANTEIL1
  } // method UPVKVLZZ
  /* PAP Seite 24 */
  private  func UPVKV(){
    if (PKV > 0) {
      if (VSP2.compareTo(VSP3) == 1) {
        VKV = VSP2.multiply(ZAHL100)
      } else {
        VKV = VSP3.multiply(ZAHL100)
      } // end-if for: VSP2.compareTo(VSP3) == 1
    } else {
      VKV = BigDecimal.ZERO
    } // end-if for: PKV > 0
  } // method UPVKV
  /* PAP Seite 25 */
  private  func UPLSTLZZ(){
    JW = LSTJAHR.multiply(ZAHL100)
    UPANTEIL ()
    LSTLZZ = ANTEIL1
  } // method UPLSTLZZ
  /* Ermittlung der Jahreslohnsteuer aus dem Einkommensteuertarif. PAP Seite 26 */
  private  func UPMLST(){
    if (ZVE.compareTo (ZAHL1) == -1) {
      ZVE = BigDecimal.ZERO
      X = BigDecimal.ZERO
    } else {
      X = (ZVE.divide (BigDecimal.valueOf(KZTAB))).setScale (0, BigDecimal.ROUND_DOWN)
    } // end-if for: ZVE.compareTo (ZAHL1) == -1
    if (STKL < 5) {
      /* Änderung für 2023 */
      UPTAB23 ()
    } else {
      MST5_6 ()
    } // end-if for: STKL < 5
  } // method UPMLST
  /* Vorsorgepauschale (§ 39b Absatz 2 Satz 5 Nummer 3 und Absatz 4 EStG) PAP Seite 27 */
  private  func UPEVP(){
    if (KRV > 1) {
      /* &lt; = < &gt; = > */
      VSP1 = BigDecimal.ZERO
    } else {
      if (ZRE4VP.compareTo(BBGRV) == 1) {
        ZRE4VP = BBGRV
      } // end-if for: ZRE4VP.compareTo(BBGRV) == 1
      VSP1 = (TBSVORV.multiply(ZRE4VP)).setScale(2,BigDecimal.ROUND_DOWN)
      VSP1 = (VSP1.multiply(RVSATZAN)).setScale(2,BigDecimal.ROUND_DOWN)
    } // end-if for: KRV > 1
    VSP2 = (ZRE4VP.multiply(BigDecimal.valueOf(0.12))).setScale(2,BigDecimal.ROUND_DOWN)
    if (STKL == 3) {
      VHB = BigDecimal.valueOf(3000)
    } else {
      VHB = BigDecimal.valueOf(1900)
    } // end-if for: STKL == 3
    if (VSP2.compareTo (VHB) == 1) {
      VSP2 = VHB
    } // end-if for: VSP2.compareTo (VHB) == 1
    VSPN = (VSP1.add (VSP2)).setScale (0, BigDecimal.ROUND_UP)
    MVSP ()
    if (VSPN.compareTo (VSP) == 1) {
      VSP = VSPN.setScale (2, BigDecimal.ROUND_DOWN)
    } // end-if for: VSPN.compareTo (VSP) == 1
  } // method UPEVP
  /* Vorsorgepauschale (§39b Abs. 2 Satz 5 Nr 3 EStG) Vergleichsberechnung fuer Guenstigerpruefung, PAP Seite 28 */
  private  func MVSP(){
    if (ZRE4VP.compareTo(BBGKVPV) == 1) {
      ZRE4VP = BBGKVPV
    } // end-if for: ZRE4VP.compareTo(BBGKVPV) == 1
    if (PKV > 0) {
      if (STKL == 6) {
        VSP3 = BigDecimal.ZERO
      } else {
        VSP3 = PKPV.multiply(ZAHL12).divide(ZAHL100)
        if (PKV == 2) {
          VSP3 = VSP3.subtract( ZRE4VP.multiply( KVSATZAG.add(PVSATZAG))).setScale(2,BigDecimal.ROUND_DOWN)
        } // end-if for: PKV == 2
      } // end-if for: STKL == 6
    } else {
      VSP3 = ZRE4VP.multiply(KVSATZAN.add(PVSATZAN)).setScale(2, BigDecimal.ROUND_DOWN)
    } // end-if for: PKV > 0
    VSP = VSP3.add(VSP1).setScale(0, BigDecimal.ROUND_UP)
  } // method MVSP
  /* Lohnsteuer fuer die Steuerklassen V und VI (§ 39b Abs. 2 Satz 7 EStG), PAP Seite 29 */
  private  func MST5_6(){
    ZZX = X
    if (ZZX.compareTo(W2STKL5) == 1) {
      ZX = W2STKL5
      UP5_6 ()
      if (ZZX.compareTo (W3STKL5) == 1) {
        ST = (ST.add ((W3STKL5.subtract (W2STKL5)).multiply (BigDecimal.valueOf (0.42)))).setScale (0, BigDecimal.ROUND_DOWN)
        ST = (ST.add ((ZZX.subtract (W3STKL5)).multiply (BigDecimal.valueOf (0.45)))).setScale (0, BigDecimal.ROUND_DOWN)
      } else {
        ST = (ST.add ((ZZX.subtract (W2STKL5)).multiply (BigDecimal.valueOf (0.42)))).setScale (0, BigDecimal.ROUND_DOWN)
      } // end-if for: ZZX.compareTo (W3STKL5) == 1
    } else {
      ZX = ZZX
      UP5_6 ()
      if (ZZX.compareTo (W1STKL5) == 1) {
        VERGL = ST
        ZX = W1STKL5
        UP5_6 ()
        HOCH = (ST.add ((ZZX.subtract (W1STKL5)).multiply (BigDecimal.valueOf (0.42)))).setScale (0, BigDecimal.ROUND_DOWN)
        /* Neuer Wert 2014 */
        if (HOCH.compareTo (VERGL) == -1) {
          ST = HOCH
        } else {
          ST = VERGL
        } // end-if for: HOCH.compareTo (VERGL) == -1
      } // end-if for: ZZX.compareTo (W1STKL5) == 1
    } // end-if for: ZZX.compareTo(W2STKL5) == 1
  } // method MST5_6
  /* Unterprogramm zur Lohnsteuer fuer die Steuerklassen V und VI (§ 39b Abs. 2 Satz 7 EStG), PAP Seite 30 */
  private  func UP5_6(){
    X = (ZX.multiply (BigDecimal.valueOf (1.25))).setScale (2, BigDecimal.ROUND_DOWN)
    /* Änderung für 2023 */
    UPTAB23 ()
    ST1 = ST
    X = (ZX.multiply (BigDecimal.valueOf (0.75))).setScale (2, BigDecimal.ROUND_DOWN)
    /* Änderung für 2023 */
    UPTAB23 ()
    ST2 = ST
    DIFF = (ST1.subtract (ST2)).multiply (ZAHL2)
    MIST = (ZX.multiply (BigDecimal.valueOf (0.14))).setScale (0, BigDecimal.ROUND_DOWN)
    if (MIST.compareTo (DIFF) == 1) {
      ST = MIST
    } else {
      ST = DIFF
    } // end-if for: MIST.compareTo (DIFF) == 1
  } // method UP5_6
  /* Solidaritaetszuschlag, PAP Seite 31 */
  private  func MSOLZ(){
    SOLZFREI = (SOLZFREI.multiply(BigDecimal.valueOf(KZTAB)))
    if (JBMG.compareTo (SOLZFREI) == 1) {
      SOLZJ = (JBMG.multiply (BigDecimal.valueOf (5.5))).divide(ZAHL100).setScale(2, BigDecimal.ROUND_DOWN)
      SOLZMIN = (JBMG.subtract (SOLZFREI)).multiply (BigDecimal.valueOf (11.9)).divide (ZAHL100).setScale (2, BigDecimal.ROUND_DOWN)
      /* Änderung für 2021 */
      if (SOLZMIN.compareTo (SOLZJ) == -1) {
        SOLZJ = SOLZMIN
      } // end-if for: SOLZMIN.compareTo (SOLZJ) == -1
      JW = SOLZJ.multiply (ZAHL100).setScale (0, BigDecimal.ROUND_DOWN)
      UPANTEIL ()
      SOLZLZZ = ANTEIL1
    } else {
      SOLZLZZ = BigDecimal.ZERO
    } // end-if for: JBMG.compareTo (SOLZFREI) == 1
    if (R > 0) {
      JW = JBMG.multiply (ZAHL100)
      UPANTEIL ()
      BK = ANTEIL1
    } else {
      BK = BigDecimal.ZERO
    } // end-if for: R > 0
  } // method MSOLZ
  /* Anteil von Jahresbetraegen fuer einen LZZ (§ 39b Abs. 2 Satz 9 EStG), PAP Seite 32 */
  private  func UPANTEIL(){
    if (LZZ == 1) {
      ANTEIL1 = JW
    } else {
      if (LZZ == 2) {
        ANTEIL1 = JW.divide (ZAHL12, 0, BigDecimal.ROUND_DOWN)
      } else {
        if (LZZ == 3) {
          ANTEIL1 = (JW.multiply (ZAHL7)).divide (ZAHL360, 0, BigDecimal.ROUND_DOWN)
        } else {
          ANTEIL1 = JW.divide (ZAHL360, 0, BigDecimal.ROUND_DOWN)
        } // end-if for: LZZ == 3
      } // end-if for: LZZ == 2
    } // end-if for: LZZ == 1
  } // method UPANTEIL
  /* Berechnung sonstiger Bezuege nach § 39b Abs. 3 Saetze 1 bis 8 EStG), PAP Seite 33 */
  private  func MSONST(){
    LZZ = 1
    if (ZMVB == 0) {
      ZMVB = 12
    } // end-if for: ZMVB == 0
    if (SONSTB.compareTo (BigDecimal.ZERO) == 0 && MBV.compareTo (BigDecimal.ZERO) == 0) {
      /* neu für 2022 */
      VKVSONST = BigDecimal.ZERO
      LSTSO = BigDecimal.ZERO
      STS = BigDecimal.ZERO
      SOLZS = BigDecimal.ZERO
      BKS = BigDecimal.ZERO
    } else {
      MOSONST ()
      UPVKV ()
      VKVSONST = VKV
      ZRE4J = ((JRE4.add (SONSTB)).divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN)
      ZVBEZJ = ((JVBEZ.add (VBS)).divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN)
      VBEZBSO = STERBE
      MRE4SONST ()
      MLSTJAHR ()
      WVFRBM = (ZVE.subtract(GFB)).multiply(ZAHL100).setScale(2,BigDecimal.ROUND_DOWN)
      if (WVFRBM.compareTo(BigDecimal.ZERO) == -1) {
        /* WVFRBM < 0 */
        WVFRBM = BigDecimal.ZERO
      } // end-if for: WVFRBM.compareTo(BigDecimal.ZERO) == -1
      UPVKV ()
      VKVSONST = VKV.subtract(VKVSONST)
      LSTSO = ST.multiply (ZAHL100)
      /* lt. PAP:  "Hinweis: negative Zahlen werden nach ihrem Betrag gerundet!" */
      /* Fallunterscheidung bzgl. negativer Zahlen nicht nötig, da die Java-Klasse BigDecimal.ROUND_DOWN */
      /* die Ziffer und nicht die Zahl abrundet, also aus -4.5 wird -4 und aus 4.5 wird 4 */
      STS = LSTSO.subtract(LSTOSO).multiply(BigDecimal.valueOf(f)).divide(ZAHL100, 0, BigDecimal.ROUND_DOWN).multiply(ZAHL100)
      /* Neu für 2022 */
      STSMIN ()
    } // end-if for: SONSTB.compareTo (BigDecimal.ZERO) == 0 && MBV.compareTo (BigDecimal.ZERO) == 0
  } // method MSONST
  /* Neu für 2022, PAP Seite 34 */
  private  func STSMIN(){
    if (STS.compareTo(BigDecimal.ZERO) == -1) {
      /* STS < 0 */
      if (MBV.compareTo(BigDecimal.ZERO) == 0) {
        /* MBV = 0 */
        /* absichtlich leer */
      } else {
        LSTLZZ = LSTLZZ.add(STS)
        if (LSTLZZ.compareTo(BigDecimal.ZERO) == -1) {
          /* LSTLZZ < 0 */
          LSTLZZ = BigDecimal.ZERO
        } // end-if for: LSTLZZ.compareTo(BigDecimal.ZERO) == -1
        SOLZLZZ = SOLZLZZ.add(STS.multiply(BigDecimal.valueOf(5.5).divide(ZAHL100))).setScale(0, BigDecimal.ROUND_DOWN)
        if (SOLZLZZ.compareTo(BigDecimal.ZERO) == -1) {
          /* SOLZLZZ < 0 */
          SOLZLZZ = BigDecimal.ZERO
        } // end-if for: SOLZLZZ.compareTo(BigDecimal.ZERO) == -1
        BK = BK.add(STS)
        if (BK.compareTo(BigDecimal.ZERO) == -1) {
          /* BK < 0 */
          BK = BigDecimal.ZERO
        } // end-if for: BK.compareTo(BigDecimal.ZERO) == -1
      } // end-if for: MBV.compareTo(BigDecimal.ZERO) == 0
      STS = BigDecimal.ZERO
      SOLZS = BigDecimal.ZERO
    } else {
      MSOLZSTS ()
    } // end-if for: STS.compareTo(BigDecimal.ZERO) == -1
    if (R > 0) {
      BKS = STS
    } else {
      BKS = BigDecimal.ZERO
    } // end-if for: R > 0
  } // method STSMIN
  /* Berechnung des SolZ auf sonstige Bezüge, PAP Seite 35, Neu ab 2021 */
  private  func MSOLZSTS(){
    if (ZKF.compareTo(BigDecimal.ZERO) == 1) {
      /* ZKF > 0 */
      SOLZSZVE = ZVE.subtract(KFB)
    } else {
      SOLZSZVE = ZVE
    } // end-if for: ZKF.compareTo(BigDecimal.ZERO) == 1
    if (SOLZSZVE.compareTo(BigDecimal.ONE) == -1) {
      /* SOLZSZVE < 1 */
      SOLZSZVE = BigDecimal.ZERO
      X = BigDecimal.ZERO
    } else {
      X = SOLZSZVE.divide(BigDecimal.valueOf(KZTAB), 0, BigDecimal.ROUND_DOWN)
    } // end-if for: SOLZSZVE.compareTo(BigDecimal.ONE) == -1
    if (STKL < 5) {
      /* STKL < 5 */
      /* Änderung für 2023 */
      UPTAB23 ()
    } else {
      MST5_6 ()
    } // end-if for: STKL < 5
    SOLZSBMG = ST.multiply(BigDecimal.valueOf(f)).setScale(0,BigDecimal.ROUND_DOWN)
    if (SOLZSBMG.compareTo(SOLZFREI) == 1) {
      /* SOLZSBMG > SOLZFREI */
      SOLZS = STS.multiply(BigDecimal.valueOf(5.5)).divide(ZAHL100, 0, BigDecimal.ROUND_DOWN)
    } else {
      SOLZS = BigDecimal.ZERO
    } // end-if for: SOLZSBMG.compareTo(SOLZFREI) == 1
  } // method MSOLZSTS
  /* Berechnung der Verguetung fuer mehrjaehrige Taetigkeit nach § 39b Abs. 3 Satz 9 und 10 EStG), PAP Seite 36 */
  private  func MVMT(){
    if (VKAPA.compareTo (BigDecimal.ZERO) == -1) {
      VKAPA = BigDecimal.ZERO
    } // end-if for: VKAPA.compareTo (BigDecimal.ZERO) == -1
    if ((VMT.add (VKAPA)).compareTo (BigDecimal.ZERO) == 1) {
      if (LSTSO.compareTo (BigDecimal.ZERO) == 0) {
        MOSONST ()
        LST1 = LSTOSO
      } else {
        LST1 = LSTSO
      } // end-if for: LSTSO.compareTo (BigDecimal.ZERO) == 0
      VBEZBSO = STERBE.add (VKAPA)
      ZRE4J = ((JRE4.add (SONSTB).add (VMT).add (VKAPA)).divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN)
      ZVBEZJ = ((JVBEZ.add (VBS).add (VKAPA)).divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN)
      KENNVMT = 2
      MRE4SONST ()
      MLSTJAHR ()
      LST3 = ST.multiply (ZAHL100)
      MRE4ABZ ()
      ZRE4VP = ZRE4VP.subtract(JRE4ENT.divide(ZAHL100)).subtract(SONSTENT.divide(ZAHL100))
      KENNVMT = 1
      MLSTJAHR ()
      LST2 = ST.multiply (ZAHL100)
      STV = LST2.subtract (LST1)
      LST3 = LST3.subtract (LST1)
      if (LST3.compareTo (STV) == -1) {
        STV = LST3
      } // end-if for: LST3.compareTo (STV) == -1
      if (STV.compareTo (BigDecimal.ZERO) == -1) {
        STV = BigDecimal.ZERO
      } else {
        /*
         lt. PAP muss hier auf ganze EUR abgerundet werden.
         Allerdings muss auch hier der Wert in Cent vorgehalten werden,
         weshalb nach dem Aufrunden auf ganze EUR durch 'divide(ZAHL100, 0, BigDecimal.ROUND_DOWN)'
         wieder die Multiplikation mit 100 erfolgt.
         */
        STV = STV.multiply(BigDecimal.valueOf(f)).divide(ZAHL100, 0, BigDecimal.ROUND_DOWN).multiply(ZAHL100)
      } // end-if for: STV.compareTo (BigDecimal.ZERO) == -1
      /* Beginn Neu 2021 */
      SOLZVBMG = STV.divide(ZAHL100, 0, BigDecimal.ROUND_DOWN).add(JBMG)
      if (SOLZVBMG.compareTo(SOLZFREI) == 1) {
        /* SOLZVBMG > SOLZFREI */
        SOLZV = STV.multiply(BigDecimal.valueOf(5.5)).divide(ZAHL100, 0, BigDecimal.ROUND_DOWN)
      } else {
        SOLZV = BigDecimal.ZERO
      } // end-if for: SOLZVBMG.compareTo(SOLZFREI) == 1
      /* Ende Neu 2021 */
      if (R > 0) {
        BKV = STV
      } else {
        BKV = BigDecimal.ZERO
      } // end-if for: R > 0
    } else {
      STV = BigDecimal.ZERO
      SOLZV = BigDecimal.ZERO
      BKV = BigDecimal.ZERO
    } // end-if for: (VMT.add (VKAPA)).compareTo (BigDecimal.ZERO) == 1
  } // method MVMT
  /* Sonderberechnung ohne sonstige Bezüge für Berechnung bei sonstigen Bezügen oder Vergütung für mehrjährige Tätigkeit, PAP Seite 37 */
  private  func MOSONST(){
    ZRE4J = (JRE4.divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN)
    ZVBEZJ = (JVBEZ.divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN)
    JLFREIB = JFREIB.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
    JLHINZU = JHINZU.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
    MRE4 ()
    MRE4ABZ ()
    ZRE4VP = ZRE4VP.subtract(JRE4ENT.divide(ZAHL100))
    MZTABFB ()
    VFRBS1 = ((ANP.add(FVB.add(FVBZ))).multiply(ZAHL100)).setScale(2,BigDecimal.ROUND_DOWN)
    MLSTJAHR ()
    WVFRBO = ((ZVE.subtract(GFB)).multiply(ZAHL100)).setScale(2, BigDecimal.ROUND_DOWN)
    if (WVFRBO.compareTo(BigDecimal.ZERO) == -1 ) {
      WVFRBO = BigDecimal.ZERO
    } // end-if for: WVFRBO.compareTo(BigDecimal.ZERO) == -1
    LSTOSO = ST.multiply (ZAHL100)
  } // method MOSONST
  /* Sonderberechnung mit sonstige Bezüge für Berechnung bei sonstigen Bezügen oder Vergütung für mehrjährige Tätigkeit, PAP Seite 38 */
  private  func MRE4SONST(){
    MRE4 ()
    FVB = FVBSO
    MRE4ABZ ()
    /* Änderung für 2022 */
    ZRE4VP = ZRE4VP.add(MBV.divide(ZAHL100)).subtract(JRE4ENT.divide(ZAHL100)).subtract(SONSTENT.divide(ZAHL100))
    FVBZ = FVBZSO
    MZTABFB ()
    VFRBS2 = ((((ANP.add(FVB).add(FVBZ))).multiply(ZAHL100))).subtract(VFRBS1)
  } // method MRE4SONST
  /* Komplett Neu 2020 */
  /* Tarifliche Einkommensteuer §32a EStG, PAP Seite 39 */
  private  func UPTAB23(){
    /* Änderung für 2023 */
    if (X.compareTo(GFB.add(ZAHL1)) == -1) {
      ST = BigDecimal.ZERO
    } else {
      if (X.compareTo (BigDecimal.valueOf (16000)) == -1) {
        /* Geändert für 2023 */
        Y = (X.subtract(GFB)).divide(ZAHL10000, 6,BigDecimal.ROUND_DOWN)
        RW = Y.multiply (BigDecimal.valueOf (979.18))
        /* Geändert für 2023 */
        RW = RW.add (BigDecimal.valueOf (1400))
        ST = (RW.multiply (Y)).setScale (0, BigDecimal.ROUND_DOWN)
      } else {
        if (X.compareTo (BigDecimal.valueOf (62810)) == -1) {
          /* Geändert für 2023 */
          Y = (X.subtract (BigDecimal.valueOf (15999))).divide (ZAHL10000, 6, BigDecimal.ROUND_DOWN)
          /* Geändert für 2023 */
          RW = Y.multiply (BigDecimal.valueOf (192.59))
          /* Geändert für 2023 */
          RW = RW.add (BigDecimal.valueOf (2397))
          RW = RW.multiply (Y)
          ST = (RW.add (BigDecimal.valueOf (966.53))).setScale (0, BigDecimal.ROUND_DOWN)
          /* Geändert für 2023 */
        } else {
          if (X.compareTo (BigDecimal.valueOf (277826)) == -1) {
            /* Geändert für 2022 */
            ST = ((X.multiply (BigDecimal.valueOf (0.42))).subtract (BigDecimal.valueOf (9972.98))).setScale (0, BigDecimal.ROUND_DOWN)
            /* Geändert für 2023 */
          } else {
            ST = ((X.multiply (BigDecimal.valueOf (0.45))).subtract (BigDecimal.valueOf (18307.73))).setScale (0, BigDecimal.ROUND_DOWN)
            /* Geändert für 2023 */
          } // end-if for: X.compareTo (BigDecimal.valueOf (277826)) == -1
        } // end-if for: X.compareTo (BigDecimal.valueOf (62810)) == -1
      } // end-if for: X.compareTo (BigDecimal.valueOf (16000)) == -1
    } // end-if for: X.compareTo(GFB.add(ZAHL1)) == -1
    ST = ST.multiply (BigDecimal.valueOf (KZTAB))
  } // method UPTAB23
} // type Lohnsteuer2023AbJuliBig
