//
//  MemoryGame.swift
//  Memorize
//
//  Created by 안재원 paramecium6 on 2020/05/31.
//  Copyright © 2020 안재원 paramecium6. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    init(pairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        
        for pairIdx in 0..<pairs {
            let content = cardContentFactory(pairIdx)
            cards += [Card(id: pairIdx*2, content: content), Card(id: pairIdx*2 + 1, content: content)]
        }
        
        cards.shuffle()
    }
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
