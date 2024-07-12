//
//  ContentView.swift
//  Memorize
//
//  Created by Cotter Phinney on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if (isFaceUp) {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(lineWidth: 3)
                Text("😱").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 25)
            }
        }
    }
}




#Preview {
    ContentView()
}
