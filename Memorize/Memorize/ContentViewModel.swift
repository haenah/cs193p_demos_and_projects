//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 안재원 paramecium6 on 2020/05/31.
//  Copyright © 2020 안재원 paramecium6. All rights reserved.
//

import SwiftUI

/*
 왜 class로 했는가?
 일단 클래스는 공유하기 쉬운 특성이 있지.
 모든 View들이 같은 포인터를 공유할 수 있지.
 그렇기 때문이야. 모든 뷰들이 얘를 지켜봐야 되잖아.
 그런데 클래스의 단점도 있지. 공유를 하면서, 한놈이 깽판을 칠 수 있다는 것.
 저 아래에 있는 model을 조회할 수가 있잖아...!
 그래서 model을 private으로 쓰는거고.
 모델을 볼 수는 있지만, 고칠 수는 없는.

 */

class ContentViewModel {
    private var model = ContentViewModel.createMemoryGame()
    
    // New game할 때마다 Model을 새로 만들어줘야 되잖아. 그 기능인거지.
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: [String] = ["👻", "🎃", "🕷", "🕯", "💀", "😈", "💎", "😡"]
        
        let pairs = Int.random(in: 2...5)
        let emojiSubset = emojis.shuffled().prefix(pairs)
        
        return MemoryGame<String>(pairs: pairs) {
            emojiSubset[$0]
        }
    }
    
    // MARK: - Access to the Model
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intent(s)
    func chooseCard(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

struct ContentViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
