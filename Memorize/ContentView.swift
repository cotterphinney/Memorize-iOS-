//
//  ContentView.swift
//  Memorize
//
//  Created by Cotter Phinney on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🎃", "☠️", "🍬", "🏚️", "👻", "🫣", "👺", "💀", "🎃", "☠️", "🍬", "🏚️", "👻", "🫣", "👺", "💀", "🎃", "☠️", "🍬", "🏚️", "👻", "🫣", "👺", "💀"]
    
    @State var cardCount = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardButtons
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index]).aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardButtons: some View {
        HStack {
            cardCountAdjuster(by: -1, symbol: "minus.circle.fill")
            Spacer()
            cardCountAdjuster(by: +1, symbol: "plus.app")
        }
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 0 || cardCount + offset > emojis.count)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    let content: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 25)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}




#Preview {
    ContentView()
}
