//
//  ContentView.swift
//  Roulette
//
//  Created by Mr.JB on 2023/3/8.
//

import SwiftUI

struct Block{
    var value : Int;
    var color : Color;
    var coin : Int;
}


struct ContentView: View {
    @State  var firstBlock = [[Block(value: 1, color: .red, coin: 0), Block(value: 2, color: .black, coin: 0),Block(value: 3, color: .red,  coin: 0)],
                              [Block(value: 4, color: .red, coin: 0), Block(value: 5, color: .black, coin: 0),Block(value: 6, color: .red,  coin: 0)],
                              [Block(value: 7, color: .red, coin: 0), Block(value: 8, color: .black, coin: 0),Block(value: 9, color: .red,  coin: 0)],
                              [Block(value: 10, color: .red, coin: 0), Block(value: 11, color: .black, coin: 0),Block(value: 12, color: .red,  coin: 0)]];
    @State  var secondBlock = [[Block(value: 13, color: .red, coin: 0), Block(value: 14, color: .black, coin: 0),Block(value: 15, color: .red,  coin: 0)],
                               [Block(value: 16, color: .red, coin: 0), Block(value: 17, color: .black, coin: 0),Block(value: 18, color: .red,  coin: 0)],
                               [Block(value: 19, color: .red, coin: 0), Block(value: 20, color: .black, coin: 0),Block(value: 21, color: .red,  coin: 0)],
                               [Block(value: 22, color: .red, coin: 0), Block(value: 23, color: .black, coin: 0),Block(value: 24, color: .red,  coin: 0)]];
    @State  var thirdBlock = [[Block(value: 25, color: .red, coin: 0), Block(value: 26, color: .black, coin: 0),Block(value: 27, color: .red,  coin: 0)],
                              [Block(value: 28, color: .red, coin: 0), Block(value: 29, color: .black, coin: 0),Block(value: 30, color: .red,  coin: 0)],
                              [Block(value: 31, color: .red, coin: 0), Block(value: 32, color: .black, coin: 0),Block(value: 33, color: .red,  coin: 0)],
                              [Block(value: 34, color: .red, coin: 0), Block(value: 35, color: .black, coin: 0),Block(value: 36, color: .red,  coin: 0)]];
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
