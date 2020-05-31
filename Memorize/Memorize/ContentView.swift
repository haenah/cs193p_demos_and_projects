//
//  ContentView.swift
//  Memorize
//
//  Created by 안재원 paramecium6 on 2020/05/30.
//  Copyright © 2020 안재원 paramecium6. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel: ContentViewModel
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.chooseCard(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
        .font((viewModel.cards.count > 4) ? .body : .largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill()
            }
        }
            .aspectRatio(2/3, contentMode: .fit)
    }
}


// MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
