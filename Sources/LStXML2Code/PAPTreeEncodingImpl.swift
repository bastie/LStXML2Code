/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */
class PAPTreeEncodingImpl : PAPTreeEncoding {
  // defautl implementation using CustomStringConvertible of root node
  func encode(_ value: PAPTree) throws -> AbstractTree? {
    let result = transform(value)
    return result
  }
  
  private func transform (_ pap : PAPTree) -> AbstractTree {
    let root = traverse(node: pap.getRoot())
    
    let result = AbstractTree()
    result.setRoot(root)
    return result
  }
  
  private func traverse (node oldNode: Node) -> Node {
    let newNode = Node()
    newNode.setName(oldNode.getName())
    let oldAttributes = oldNode.getAttributes()
    for (name,value) in oldAttributes {
      newNode.addAttribute(name, value)
      if name == "exec" {
        exec(stmt: value)
      }
    }
    for child in oldNode.getChilds() {
      let newChild = traverse(node: child)
      newNode.addAndSetParent(child: newChild)
    }
    return newNode
  }
  
  private func exec (stmt : String = "NOOP") -> Node {
    var asNodes : [Node] = []
    // make flyweight instances
    for char in stmt {
      asNodes.append(CharNode.value(of: char))
    }
    
    // --------------------------------------------------------------
    // MARK: SPLIT Statement
    
    // first bad split
    for singleChar in ["(",")","[","]",".",",","="," ","-", // default delimiter
                       "BigDecimal", // types
                       "new","valueOf","setScale","add","multiply","subtract","divide","longValue", // methods
                       "0","1","2","3","4","5","6","7","8","9", // numeric
                       "ROUND_DOWN","ROUND_UP", "ZERO"] { // constants
      while let found = first(expected: "\(singleChar)", in: asNodes) {
        for _ in found.startOffset...found.endOffset {
          asNodes.remove(at: found.startOffset)
        }
        switch (singleChar) {
        case "0"..."9" :
          asNodes.insert(NumericNode(with: Int(singleChar)!), at: found.startOffset)
        case "=" :
          asNodes.insert(AssignNode(), at: found.startOffset)
        case " " :
          asNodes.insert(SpaceNode(), at: found.startOffset)
        case "(" :
          asNodes.insert(OpenRoundBracketNode(), at: found.startOffset)
        case ")" :
          asNodes.insert(ClosedRoundBracketNode(), at: found.startOffset)
        case "[" :
          asNodes.insert(OpenSquareBracketNode(), at: found.startOffset)
        case "]" :
          asNodes.insert(ClosedSquareBracketNode(), at: found.startOffset)
        case "." :
          asNodes.insert(DotNode(), at: found.startOffset)
        default :
          asNodes.insert(ValueNode(with: "\(singleChar)"), at: found.startOffset)
        }
      }
    }

    // Repair 🤫 where numeric ValueNode is actually part of identifier
    // for (offset, node) in asNodes.enumerated() { //<== enumerated returns "new ArrayList" and in result modifiy original asNodes doesn't have effect
    for offset in 0..<asNodes.count {
      let node = asNodes[offset]
      // before must be, space, dot (simple implementation), open brackeds, (unused) line break, NumericNode
      if let numericNode = node as? NumericNode {
        if offset > 0 {
          if asNodes[offset - 1] is SpaceNode ||
              asNodes[offset - 1] is DotNode ||
              asNodes[offset - 1] is OpenRoundBracketNode ||
              asNodes[offset - 1] is OpenSquareBracketNode ||
              asNodes[offset - 1] is NumericNode
          {}
          else {
            let _ = asNodes.remove(at: offset)
            asNodes.insert(CharNode.value(of: "\(numericNode.getValue())".first!), at: offset)
          }
        }
      }
      // never do somethink?!?!!!
      /*
      if node is CharNode {
        let char = node as! CharNode
        if offset + 1 < asNodes.count { // one more element? // TODO: besser ein Dummy EOL vorher hinzuzufügen?
          // wenn das nächste Zeichen eine Ziffer ist aber kein "Zahl-Delimter" vorhanden ist, gehört diese wohl doch nicht als Ziffer interpretiert
          if asNodes[offset + 1] is ValueNode {
            if (asNodes [offset + 1] as! ValueNode).isInt() {
              asNodes [offset + 1] = CharNode.value(of: (asNodes [offset + 1] as! ValueNode).getValue())[0]
            }
          }
        }
      }
       */
    }
    
    // --------------------------------------------------------------
    // MARK: IDENTIFIER in Statement
    // after this step only identifiers are existing as CharNodes so create IdentifierNodes
    
    // get all programm variables used in statement
    var identifiers : [String] = []
    do {
      var name = ""
      for node in asNodes {
        if node is CharNode {
          name.append((node as! CharNode).getValue())
        }
        else {
          if name.count > 0 {
            identifiers.append(name)
            name = ""
          }
        }
      }
      if name.count > 0 {
        identifiers.append(name)
        name = ""
      }
    }
    
    for next in identifiers {
      if let found = first(expected: next, in: asNodes) {
        for _ in found.startOffset...found.endOffset {
          asNodes.remove(at: found.startOffset)
        }
        let identifier = IdentiferNode(with: next)
        
        asNodes.insert(identifier, at: found.startOffset)
      }
    }
    
    // --------------------------------------------------------------
    // MARK: NUMBERS in Statement
    // a number can be a float value or an integer value
    // Instead Java accept a dot starting float value, I'm happy that source XML doesn't have it.
    do {
      var numbersAt : [(value : Any, offset : Int, count : Int)] = []
      var number : String? = nil
      var position : (first : Int, count : Int) = (0,0)
      for offset in 0..<asNodes.count {
        let node = asNodes[offset]
        if let nextNode = node as? NumericNode {
          if number != nil {
            number!.append("\(nextNode.getValue())")
          }
          else {
            number = "\(nextNode.getValue())"
            position.first = offset
          }
          position.count += 1
        }
        else if let nextNode = node as? DotNode { // maybe it is a float value
          if let _ = number {
            number!.append(".") // better generator error than runtime error, so ! instead of ? is using
            position.count += 1
          }
        }
        else {
          if number != nil {
            var valueTyp : Any? = Int(number!)
            if nil == valueTyp {
              if let _ = Double(number!) {
                valueTyp = number
              }
            }
            numbersAt.append( (valueTyp!, position.first, position.count) )
            number = nil
            position.count = 0
            position.first = 0
          }
        }
      }
      if let number {
        var valueTyp : Any? = Int(number)
        if nil == valueTyp {
          if let _ = Double(number) {
            valueTyp = number
          }
        }
        numbersAt.append( (valueTyp!, position.first, position.count) )
      }
      
      while !numbersAt.isEmpty {
        let last = numbersAt.removeLast()
        for _ in 0..<last.count {
          asNodes.remove(at: last.offset)
        }
        if let int = last.value as? Int {
          asNodes.insert(IntNumberNode(with: int), at: last.offset)
        }
        else if let double = last.value as? String {
          asNodes.insert(FloatNumberNode(with: double), at: last.offset)
        }
        else {
          fatalError("Unsupported numeric type \(last.value)")
        }
      }
    }
    
#if DEBUG
    // MARK: ParseGuard "no more CharNodes"
    for noCharNode in asNodes {
      guard !(noCharNode is CharNode) else {
        fatalError("Unexpected CharNode in \(stmt)")
      }
    }
#endif

    
    // --------------------------------------------------------------
    // MARK: DotNodes in Statement to Tree
    
    for i in 0..<asNodes.count {
      if let dot = asNodes[i] as? DotNode {
        if let receiver = asNodes[i-1] as? ValueNode,
           let message = asNodes[i+1] as? ValueNode {
          //print ("call \(message.getValue()) on type \(receiver.getValue())")
        }
        else if let receiver = asNodes[i-1] as? IdentiferNode,
                let message = asNodes[i+1] as? ValueNode {
          //print ("call \(message.getValue()) on instance \(receiver.getName())")
        }
        else if let receiver = asNodes[i-1] as? ClosedRoundBracketNode,
                let message = asNodes[i+1] as? ValueNode {
          //print ("call \(message.getValue()) on result of before")
        }
        else if let receiver = asNodes[i-1] as? ClosedSquareBracketNode,
                let message = asNodes[i+1] as? ValueNode {
          //print ("call \(message.getValue()) on array element before")
        }
        else {
          fatalError("Not yet implemented: \(type(of: asNodes[i-1])).\(type(of: asNodes[i+1])) from \(stmt)")
        }
        
        // call on METHODE or VARIABLE?
        // MARK: DotNodes... replace ValueNode with CONSTANT or METHOD
        // Note: a subclass or subtype is handled as CONSTANT
        do {
          var messageType : String?
          let message = asNodes[i+1]
          for var j in (i+2)..<asNodes.count {
            if let _ = asNodes[j] as? SpaceNode {
              // skip
            }
            else if let _ = asNodes[j] as? OpenRoundBracketNode {
              messageType = "METHOD"
            }
            if let messageType {
              j = asNodes.count
            }
          }
          if let messageType {} else {
            messageType = "CONSTANT"
          }
          
          //print ("  call is \(messageType!) \((message as! ValueNode).getValue())")
        }
      }
      
    }
    



    /// MAX Juli 2023: 5x(    VFRBS2 = ((((ANP.add(FVB).add(FVBZ))).multiply(ZAHL100))).subtract(VFRBS1)
    
   
    return Node(newParent: nil)
  }
  
  private func first (expected : String, in : [Node], _ nodeType : Any = type(of:CharNode.self)) -> (startOffset : Int, endOffset : Int)? {
    guard expected.count > 0 else {
      return nil
    }
    if expected.count > `in`.count {
      return nil
    }
    
    var startOffset = -1
    var endOffset = -1
    
    var forOffset = -1

    let expectedArray : [String] = expected.map( { String($0) })
    
    
    for (inOffset, inValue) in `in`.enumerated() {
      if let charNode = inValue as? CharNode {
        let value : String = charNode.getValue()
        forOffset += 1 // TODO: evtl. noch Bug enthalten, wenn bis zum Ende des String geht
        if expectedArray[forOffset] == value {
          if startOffset < 0 {
            startOffset = inOffset
            endOffset = startOffset
          }
          else {
            endOffset += 1
          }
          
          if endOffset - startOffset + 1 == expectedArray.count { // found first
            return (startOffset,endOffset)
          }
        }
        else { // new search
          forOffset = -1
          startOffset = -1
          endOffset = -1
        }
      }
      else { // not a char - new search
        forOffset = -1
        startOffset = -1
        endOffset = -1
      }
    }
    
    
    if endOffset <= startOffset {
      return nil
    }
    if endOffset - startOffset != expected.count - 1 {
      return nil
    }
    return (startOffset,endOffset)
  }


  /// Besondere Behandlung des Nicht-Pseudo sondern Java8 Quelltextes
  /// 
  /// Folgende Eigenschaften sind 2023 erkennbar:
  /// Jede Anweisung ist eine Zuweisung zu der Deklaration links dem Gleichheitszeichen.
  /* all from Lohnsteuer2023AbJuli
   VBEZBSO= BigDecimal.ZERO
   KENNVMT= 0
   BBGRV = new BigDecimal(87600)
   BBGRV = new BigDecimal(85200)
   RVSATZAN = BigDecimal.valueOf(0.093)
   TBSVORV = BigDecimal.valueOf(1.00)
   BBGKVPV = new BigDecimal(59850)
   KVSATZAN = (KVZ.divide(ZAHL2).divide(ZAHL100)).add(BigDecimal.valueOf(0.07))
   KVSATZAG = BigDecimal.valueOf(0.008).add(BigDecimal.valueOf(0.07))
   PVSATZAN = BigDecimal.valueOf(0.021125)
   PVSATZAG = BigDecimal.valueOf(0.011125)
   PVSATZAN =  BigDecimal.valueOf(0.016125)
   PVSATZAG =  BigDecimal.valueOf(0.016125)
   PVSATZAN = PVSATZAN.add(BigDecimal.valueOf(0.00475))
   PVSATZAN = BigDecimal.valueOf(0.022)
   PVSATZAG = BigDecimal.valueOf(0.012)
   PVSATZAN =  BigDecimal.valueOf(0.017)
   PVSATZAG =  BigDecimal.valueOf(0.017)
   PVSATZAN = PVSATZAN.add(BigDecimal.valueOf(0.006))
   W1STKL5 = new BigDecimal(12485)
   W2STKL5 = new BigDecimal(31404)
   W3STKL5 = new BigDecimal(222260)
   GFB = new BigDecimal(10908)
   SOLZFREI = new BigDecimal(17543)
   ZRE4J= RE4.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
   ZVBEZJ= VBEZ.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
   JLFREIB= LZZFREIB.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
   JLHINZU= LZZHINZU.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
   ZRE4J= (RE4.multiply (ZAHL12)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
   ZVBEZJ= (VBEZ.multiply (ZAHL12)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
   JLFREIB= (LZZFREIB.multiply (ZAHL12)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
   JLHINZU= (LZZHINZU.multiply (ZAHL12)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
   ZRE4J= (RE4.multiply (ZAHL360)).divide (ZAHL700, 2, BigDecimal.ROUND_DOWN)
   ZVBEZJ= (VBEZ.multiply (ZAHL360)).divide (ZAHL700, 2, BigDecimal.ROUND_DOWN)
   JLFREIB= (LZZFREIB.multiply (ZAHL360)).divide (ZAHL700, 2, BigDecimal.ROUND_DOWN)
   JLHINZU= (LZZHINZU.multiply (ZAHL360)).divide (ZAHL700, 2, BigDecimal.ROUND_DOWN)
   ZRE4J= (RE4.multiply (ZAHL360)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
   ZVBEZJ= (VBEZ.multiply (ZAHL360)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
   JLFREIB= (LZZFREIB.multiply (ZAHL360)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
   JLHINZU= (LZZHINZU.multiply (ZAHL360)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
   f= 1
   FVBZ= BigDecimal.ZERO
   FVB= BigDecimal.ZERO
   FVBZSO= BigDecimal.ZERO
   FVBSO= BigDecimal.ZERO
   J= 1
   J= VJAHR - 2004
   J= 36
   VBEZB= (VBEZM.multiply (BigDecimal.valueOf (ZMVB))).add (VBEZS)
   HFVB= TAB2[J].divide (ZAHL12).multiply (BigDecimal.valueOf (ZMVB))
   FVBZ= TAB3[J].divide (ZAHL12).multiply (BigDecimal.valueOf (ZMVB)).setScale (0, BigDecimal.ROUND_UP)
   VBEZB= ((VBEZM.multiply (ZAHL12)).add (VBEZS)).setScale (2, BigDecimal.ROUND_DOWN)
   HFVB= TAB2[J]
   FVBZ= TAB3[J]
   FVB= ((VBEZB.multiply (TAB1[J]))).divide (ZAHL100).setScale (2, BigDecimal.ROUND_UP)
   FVB = HFVB
   FVB = ZVBEZJ
   FVBSO= (FVB.add((VBEZBSO.multiply (TAB1[J])).divide (ZAHL100))).setScale (2, BigDecimal.ROUND_UP)
   FVBSO = TAB2[J]
   HFVBZSO= (((VBEZB.add(VBEZBSO)).divide (ZAHL100)).subtract (FVBSO)).setScale (2, BigDecimal.ROUND_DOWN)
   FVBZSO= (FVBZ.add((VBEZBSO).divide (ZAHL100))).setScale (0, BigDecimal.ROUND_UP)
   FVBZSO = HFVBZSO.setScale(0, BigDecimal.ROUND_UP)
   FVBZSO = TAB3[J]
   HFVBZ= ((VBEZB.divide (ZAHL100)).subtract (FVB)).setScale (2, BigDecimal.ROUND_DOWN)
   FVBZ = HFVBZ.setScale (0, BigDecimal.ROUND_UP)
   ALTE= BigDecimal.ZERO
   K= 1
   K= AJAHR - 2004
   K= 36
   BMG= ZRE4J.subtract (ZVBEZJ)
   ALTE = (BMG.multiply(TAB4[K])).setScale(0, BigDecimal.ROUND_UP)
   HBALTE= TAB5[K]
   ALTE= HBALTE
   ZRE4= (ZRE4J.subtract (FVB).subtract   (ALTE).subtract (JLFREIB).add (JLHINZU)).setScale (2, BigDecimal.ROUND_DOWN)
   ZRE4= BigDecimal.ZERO
   ZRE4VP= ZRE4J
   ZRE4VP = ZRE4VP.subtract(ENTSCH.divide(ZAHL100)).setScale(2,BigDecimal.ROUND_DOWN)
   ZVBEZ = ZVBEZJ.subtract(FVB).setScale(2, BigDecimal.ROUND_DOWN)
   ZVBEZ = BigDecimal.ZERO
   VFRB = ((ANP.add(FVB.add(FVBZ))).multiply(ZAHL100)).setScale(0, BigDecimal.ROUND_DOWN)
   WVFRB = ((ZVE.subtract(GFB)).multiply(ZAHL100)).setScale(0, BigDecimal.ROUND_DOWN)
   WVFRB = BigDecimal.valueOf(0)
   LSTJAHR = (ST.multiply(BigDecimal.valueOf(f))).setScale(0,BigDecimal.ROUND_DOWN)
   ZTABFB = ZTABFB.add(KFB)
   JBMG = (ST.multiply(BigDecimal.valueOf(f))).setScale(0,BigDecimal.ROUND_DOWN)
   JBMG = LSTJAHR
   ANP= BigDecimal.ZERO
   FVBZ = BigDecimal.valueOf(ZVBEZ.longValue())
   ANP= (ZVBEZ.subtract (FVBZ)).setScale (0, BigDecimal.ROUND_UP)
   ANP= BigDecimal.valueOf (102)
   FVBZ= BigDecimal.valueOf (0)
   FVBZSO= BigDecimal.valueOf (0)
   ANP = ANP.add(ZRE4).subtract(ZVBEZ).setScale(0,BigDecimal.ROUND_UP)
   ANP = ANP.add(BigDecimal.valueOf(1230))
   KZTAB= 1
   SAP= BigDecimal.valueOf (36)
   KFB= (ZKF.multiply (BigDecimal.valueOf (8952))).setScale (0, BigDecimal.ROUND_DOWN)
   EFA= BigDecimal.valueOf (4260)
   SAP= BigDecimal.valueOf (36)
   KFB= (ZKF.multiply (BigDecimal.valueOf (8952))).setScale (0, BigDecimal.ROUND_DOWN)
   KZTAB= 2
   SAP= BigDecimal.valueOf (36)
   KFB= (ZKF.multiply (BigDecimal.valueOf (8952))).setScale (0, BigDecimal.ROUND_DOWN)
   SAP= BigDecimal.valueOf (36)
   KFB= (ZKF.multiply (BigDecimal.valueOf (4476))).setScale (0, BigDecimal.ROUND_DOWN)
   SAP= BigDecimal.valueOf (36)
   KFB= BigDecimal.ZERO
   KFB= BigDecimal.ZERO
   ZTABFB= (EFA.add (ANP).add (SAP).add (FVBZ)).setScale (2, BigDecimal.ROUND_DOWN)
   ZVE= (ZRE4.subtract (ZTABFB).subtract (VSP)).setScale (2, BigDecimal.ROUND_DOWN)
   ZVE= (ZRE4.subtract (ZTABFB).subtract (VSP).subtract ((VMT).divide (ZAHL100)).subtract ((VKAPA).divide (ZAHL100))).setScale (2, BigDecimal.ROUND_DOWN)
   ZVE = ZVE.add(VMT.divide(ZAHL100)).add(VKAPA.divide(ZAHL100)).divide(ZAHL5).setScale(2,BigDecimal.ROUND_DOWN)
   ST= (ST.multiply (ZAHL5)).setScale (0, BigDecimal.ROUND_DOWN)
   STOVMT= ST
   ZVE= (ZVE.add(((VMT.add (VKAPA)).divide (ZAHL500)))).setScale (2, BigDecimal.ROUND_DOWN)
   ST= (((ST.subtract (STOVMT)).multiply (ZAHL5)).add (STOVMT)).setScale (0, BigDecimal.ROUND_DOWN)
   JW = VKV
   VKVLZZ = ANTEIL1
   VKV = VSP2.multiply(ZAHL100)
   VKV = VSP3.multiply(ZAHL100)
   VKV = BigDecimal.ZERO
   JW = LSTJAHR.multiply(ZAHL100)
   LSTLZZ = ANTEIL1
   ZVE= BigDecimal.ZERO
   X= BigDecimal.ZERO
   X= (ZVE.divide (BigDecimal.valueOf(KZTAB))).setScale (0, BigDecimal.ROUND_DOWN)
   VSP1= BigDecimal.ZERO
   ZRE4VP = BBGRV
   VSP1 = (TBSVORV.multiply(ZRE4VP)).setScale(2,BigDecimal.ROUND_DOWN)
   VSP1 = (VSP1.multiply(RVSATZAN)).setScale(2,BigDecimal.ROUND_DOWN)
   VSP2 = (ZRE4VP.multiply(BigDecimal.valueOf(0.12))).setScale(2,BigDecimal.ROUND_DOWN)
   VHB = BigDecimal.valueOf(3000)
   VHB = BigDecimal.valueOf(1900)
   VSP2= VHB
   VSPN= (VSP1.add (VSP2)).setScale (0, BigDecimal.ROUND_UP)
   VSP= VSPN.setScale (2, BigDecimal.ROUND_DOWN)
   ZRE4VP = BBGKVPV
   VSP3 = BigDecimal.ZERO
   VSP3 = PKPV.multiply(ZAHL12).divide(ZAHL100)
   VSP3 = VSP3.subtract( ZRE4VP.multiply( KVSATZAG.add(PVSATZAG))).setScale(2,BigDecimal.ROUND_DOWN)
   VSP3 = ZRE4VP.multiply(KVSATZAN.add(PVSATZAN)).setScale(2, BigDecimal.ROUND_DOWN)
   VSP = VSP3.add(VSP1).setScale(0, BigDecimal.ROUND_UP)
   ZZX= X
   ZX= W2STKL5
   ST= (ST.add ((W3STKL5.subtract (W2STKL5)).multiply (BigDecimal.valueOf (0.42)))).setScale (0, BigDecimal.ROUND_DOWN)
   ST= (ST.add ((ZZX.subtract (W3STKL5)).multiply (BigDecimal.valueOf (0.45)))).setScale (0, BigDecimal.ROUND_DOWN)
   ST= (ST.add ((ZZX.subtract (W2STKL5)).multiply (BigDecimal.valueOf (0.42)))).setScale (0, BigDecimal.ROUND_DOWN)
   ZX= ZZX
   VERGL= ST
   ZX= W1STKL5
   HOCH= (ST.add ((ZZX.subtract (W1STKL5)).multiply (BigDecimal.valueOf (0.42)))).setScale (0, BigDecimal.ROUND_DOWN)
   ST= HOCH
   ST= VERGL
   X= (ZX.multiply (BigDecimal.valueOf (1.25))).setScale (2, BigDecimal.ROUND_DOWN)
   ST1= ST
   X= (ZX.multiply (BigDecimal.valueOf (0.75))).setScale (2, BigDecimal.ROUND_DOWN)
   ST2= ST
   DIFF= (ST1.subtract (ST2)).multiply (ZAHL2)
   MIST= (ZX.multiply (BigDecimal.valueOf (0.14))).setScale (0, BigDecimal.ROUND_DOWN)
   ST= MIST
   ST= DIFF
   SOLZFREI = (SOLZFREI.multiply(BigDecimal.valueOf(KZTAB)))
   SOLZJ= (JBMG.multiply (BigDecimal.valueOf (5.5))).divide(ZAHL100).setScale(2, BigDecimal.ROUND_DOWN)
   SOLZMIN= (JBMG.subtract (SOLZFREI)).multiply (BigDecimal.valueOf (11.9)).divide (ZAHL100).setScale (2, BigDecimal.ROUND_DOWN)
   SOLZJ= SOLZMIN
   JW= SOLZJ.multiply (ZAHL100).setScale (0, BigDecimal.ROUND_DOWN)
   SOLZLZZ= ANTEIL1
   SOLZLZZ= BigDecimal.ZERO
   JW= JBMG.multiply (ZAHL100)
   BK= ANTEIL1
   BK= BigDecimal.ZERO
   ANTEIL1= JW
   ANTEIL1= JW.divide (ZAHL12, 0, BigDecimal.ROUND_DOWN)
   ANTEIL1= (JW.multiply (ZAHL7)).divide (ZAHL360, 0, BigDecimal.ROUND_DOWN)
   ANTEIL1= JW.divide (ZAHL360, 0, BigDecimal.ROUND_DOWN)
   LZZ= 1
   ZMVB= 12
   VKVSONST= BigDecimal.ZERO
   LSTSO= BigDecimal.ZERO
   STS= BigDecimal.ZERO
   SOLZS= BigDecimal.ZERO
   BKS= BigDecimal.ZERO
   VKVSONST = VKV
   ZRE4J= ((JRE4.add (SONSTB)).divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN)
   ZVBEZJ= ((JVBEZ.add (VBS)).divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN)
   VBEZBSO= STERBE
   WVFRBM = (ZVE.subtract(GFB)).multiply(ZAHL100).setScale(2,BigDecimal.ROUND_DOWN)
   WVFRBM = BigDecimal.ZERO
   VKVSONST = VKV.subtract(VKVSONST)
   LSTSO= ST.multiply (ZAHL100)
   STS = LSTSO.subtract(LSTOSO).multiply(BigDecimal.valueOf(f)).divide(ZAHL100, 0, BigDecimal.ROUND_DOWN).multiply(ZAHL100)
   LSTLZZ = LSTLZZ.add(STS)
   LSTLZZ = BigDecimal.ZERO
   SOLZLZZ = SOLZLZZ.add(STS.multiply(BigDecimal.valueOf(5.5).divide(ZAHL100))).setScale(0, BigDecimal.ROUND_DOWN)
   SOLZLZZ = BigDecimal.ZERO
   BK = BK.add(STS)
   BK = BigDecimal.ZERO
   STS = BigDecimal.ZERO
   SOLZS = BigDecimal.ZERO
   BKS = STS
   BKS = BigDecimal.ZERO
   SOLZSZVE= ZVE.subtract(KFB)
   SOLZSZVE= ZVE
   SOLZSZVE= BigDecimal.ZERO
   X= BigDecimal.ZERO
   X= SOLZSZVE.divide(BigDecimal.valueOf(KZTAB), 0, BigDecimal.ROUND_DOWN)
   SOLZSBMG= ST.multiply(BigDecimal.valueOf(f)).setScale(0,BigDecimal.ROUND_DOWN)
   SOLZS= STS.multiply(BigDecimal.valueOf(5.5)).divide(ZAHL100, 0, BigDecimal.ROUND_DOWN)
   SOLZS= BigDecimal.ZERO
   VKAPA= BigDecimal.ZERO
   LST1= LSTOSO
   LST1= LSTSO
   VBEZBSO= STERBE.add (VKAPA)
   ZRE4J= ((JRE4.add (SONSTB).add (VMT).add (VKAPA)).divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN)
   ZVBEZJ= ((JVBEZ.add (VBS).add (VKAPA)).divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN)
   KENNVMT = 2
   LST3= ST.multiply (ZAHL100)
   ZRE4VP = ZRE4VP.subtract(JRE4ENT.divide(ZAHL100)).subtract(SONSTENT.divide(ZAHL100))
   KENNVMT= 1
   LST2= ST.multiply (ZAHL100)
   STV= LST2.subtract (LST1)
   LST3= LST3.subtract (LST1)
   STV= LST3
   STV= BigDecimal.ZERO
   STV = STV.multiply(BigDecimal.valueOf(f)).divide(ZAHL100, 0, BigDecimal.ROUND_DOWN).multiply(ZAHL100)
   SOLZVBMG=STV.divide(ZAHL100, 0, BigDecimal.ROUND_DOWN).add(JBMG)
   SOLZV= STV.multiply(BigDecimal.valueOf(5.5)).divide(ZAHL100, 0, BigDecimal.ROUND_DOWN)
   SOLZV= BigDecimal.ZERO
   BKV= STV
   BKV= BigDecimal.ZERO
   STV= BigDecimal.ZERO
   SOLZV= BigDecimal.ZERO
   BKV= BigDecimal.ZERO
   ZRE4J= (JRE4.divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN)
   ZVBEZJ= (JVBEZ.divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN)
   JLFREIB= JFREIB.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
   JLHINZU= JHINZU.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN)
   ZRE4VP = ZRE4VP.subtract(JRE4ENT.divide(ZAHL100))
   VFRBS1 = ((ANP.add(FVB.add(FVBZ))).multiply(ZAHL100)).setScale(2,BigDecimal.ROUND_DOWN)
   WVFRBO = ((ZVE.subtract(GFB)).multiply(ZAHL100)).setScale(2, BigDecimal.ROUND_DOWN)
   WVFRBO = BigDecimal.ZERO
   LSTOSO= ST.multiply (ZAHL100)
   FVB= FVBSO
   ZRE4VP = ZRE4VP.add(MBV.divide(ZAHL100)).subtract(JRE4ENT.divide(ZAHL100)).subtract(SONSTENT.divide(ZAHL100))
   FVBZ= FVBZSO
   VFRBS2 = ((((ANP.add(FVB).add(FVBZ))).multiply(ZAHL100))).subtract(VFRBS1)
   ST= BigDecimal.ZERO
   Y = (X.subtract(GFB)).divide(ZAHL10000, 6,BigDecimal.ROUND_DOWN)
   RW= Y.multiply (BigDecimal.valueOf (979.18))
   RW= RW.add (BigDecimal.valueOf (1400))
   ST= (RW.multiply (Y)).setScale (0, BigDecimal.ROUND_DOWN)
   Y= (X.subtract (BigDecimal.valueOf (15999))).divide (ZAHL10000, 6, BigDecimal.ROUND_DOWN)
   RW= Y.multiply (BigDecimal.valueOf (192.59))
   RW= RW.add (BigDecimal.valueOf (2397))
   RW= RW.multiply (Y)
   ST= (RW.add (BigDecimal.valueOf (966.53))).setScale (0, BigDecimal.ROUND_DOWN)
   ST= ((X.multiply (BigDecimal.valueOf (0.42))).subtract (BigDecimal.valueOf (9972.98))).setScale (0, BigDecimal.ROUND_DOWN)
   ST= ((X.multiply (BigDecimal.valueOf (0.45))).subtract (BigDecimal.valueOf (18307.73))).setScale (0, BigDecimal.ROUND_DOWN)
   ST= ST.multiply (BigDecimal.valueOf (KZTAB))
   */
  private func exec_old (stmt : String = "NOOP") -> Node {
    print ("=== BEGIN OF STATEMENT >>>\(stmt)<<< ===")
    var varName = ""
    var content = ""
    
    var numericDetected = false
    var callDetected = false
    var callNewInstanceDetected = false
    var assignmentDetected = false
    var openMethodDetected = false
    var numericPriorityDetected = false
    
    var next = ""
    do { // iterate over string
      for char in stmt {
        switch (char) {
        case "=" :
          varName = next.trimmingCharacters(in: .whitespaces)
          print ("assignment with left side name >>>\(varName)<<< detected")
          next = ""
          numericDetected = false
          callDetected = false
          callNewInstanceDetected = false
          assignmentDetected = true
          break
        case "\n": fallthrough
        case "\r":
          numericDetected = false
          fatalError("not yet implemented")
          break
        case ")" :
          if openMethodDetected {
            print ("method call end detected with value: \(next)")
            openMethodDetected = false
            callNewInstanceDetected = false
            next = ""
          } else
          if callDetected {
            print ("round bracket close after call detected: \(next)")
            next = ""
            assignmentDetected = false
          }
          else if numericPriorityDetected {
            print ("numeric priority closed with last content: \(next)")
            next = ""
            numericPriorityDetected = false
            assignmentDetected = false
          }
          else {
            if next.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
              fatalError("unexpected round bracket close with last content: \(next)")
            }
            next = ""
            assignmentDetected = false
          }
          break
        case "(" : // MISSING IS KLAMMERSETZUNG in Berechnungen!!!
          numericDetected = false
          if openMethodDetected {
            print ("Parameter detection start")
          }
          else if callDetected { // method
            print("call detected with open bracket on: \(next)")
            callDetected = false
            openMethodDetected = true
            next = ""
          }
          else if callNewInstanceDetected {
            print ("creation of type \(next) detected")
            next = ""
            callNewInstanceDetected = false
            openMethodDetected = true
          }
          else {
            print("round bracket open for computing priority detected")
            if next.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
              fatalError("false detection on round bracket")
            }
            next = ""
            assignmentDetected = false
            numericPriorityDetected = true
            
          }
          break
        case ".":
          if let numeric = Int (next) // Ziffer / Nummer?
                                      //&& !numericDetected // aber nicht schon ein Dezimal erkannt => Fehler
          {
            print ("number detected: \(next) - waiting for end")
            next.append(char)
            numericDetected = true
          }
          else {
            let receiver = next.trimmingCharacters(in: .whitespaces).count > 0 ? next.trimmingCharacters(in: .whitespaces) : "<LAST CALL RETURN VALUE>"
            print ("call detected on instance or type \(receiver)")
            next = ""
            callDetected = true
            numericDetected = false
            callNewInstanceDetected = false
            assignmentDetected = false
          }
          break;
        case ",":
          if openMethodDetected {
            print ("Parameter in call detected : \(next)")
            next = ""
          }
          break
        case " ":
          let detected = next.trimmingCharacters(in: .whitespaces)
          if detected.count > 0 // Inhalt vorhanden
              && varName.count > 0 { // Inhalt nicht nur die Variablenname (bei einer Zuweisung)
            switch (detected) {
            case "new" :
              print("special call new instance detected")
              callNewInstanceDetected = true
              // erzeugen einer neuen InstanceNode
              next = ""
              break
            default:
              if numericDetected {
                print("float value detected: \(next)")
                numericDetected = false
                assignmentDetected = false
                next = ""
              }
              else if callDetected { // maybe method, maybe constant or variable
                print("call detected on: \(next)")
                callDetected = false
                assignmentDetected = false
                next = ""
              }
              else {
                fatalError("unsupported content detected: \(detected)")
                
                callDetected = false
                callNewInstanceDetected = false
                assignmentDetected = false
                numericDetected = false
                
                next = ""
              }
              break
            }
          }
          break
        default :
          next.append(char)
        }
        content = next.trimmingCharacters(in: .whitespaces)
      } // END-FOR
      // last part of statement
      var detected =  next.trimmingCharacters(in: .whitespaces)
      if detected.count > 0 {
        if callDetected {
          print ("call detected with target: \(next)")
          callDetected = false
          next = ""
        }
        else if assignmentDetected {
          print ("assignment detected of \(varName) with value \(next)")
          assignmentDetected = false
          next = ""
        }
      }
    } // END-DO
    print ("=== END OF STATEMENT ===")
    
    
    if content.components(separatedBy: ["(",".", " ", "-", "+", "*", "/"]).count == 1 {
      //print ("ValueNode: \(content)")
    }
    else {
      //print (content)
    }

    
    
    
    return Node()
  }
}

