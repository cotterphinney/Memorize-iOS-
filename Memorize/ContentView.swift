//
//  ContentView.swift
//  Memorize
//
//  Created by Cotter Phinney on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    var emojis = [
        "Halloween": ["🎃", "☠️", "🍬", "🏚️", "👻"],
        "Christmas": ["🎄", "☃️", "🌟", "🎁", "🎅", "🤶", "🦌"],
        "Thanksgiving": ["🥧", "🍴", "🍞", "🌽", "🥧", "🤤", "🦃", "🍂", "🍽"]
    ]
    
    @State var selectedTheme = "Halloween"
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            themeButtons
        }
        .padding()
    }
    
    var cards: some View {
        let selectedEmojis = emojis[selectedTheme]!
        let pairedEmojis = selectedEmojis + selectedEmojis
        let shuffledEmojis = pairedEmojis.shuffled()
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(0..<shuffledEmojis.count, id: \.self) { index in
                CardView(content: shuffledEmojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            .foregroundColor(.orange)
        }
    }
    
    var themeButtons: some View {
        HStack {
            themeChanger(themeName: "Christmas", iconName: "star")
            themeChanger(themeName: "Thanksgiving", iconName: "fork.knife")
            themeChanger(themeName: "Halloween", iconName: "theatermasks.circle.fill")
        }
    }
    
    func themeChanger(themeName: String, iconName: String) -> some View {
        VStack {
            Button(action: {
                selectedTheme = themeName
            }, label: {
                Image(systemName: iconName)
            })
            .font(.largeTitle)
            Text(themeName).font(.footnote)
        }
        .disabled(themeName == selectedTheme)
        .padding(.horizontal, 15)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
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
