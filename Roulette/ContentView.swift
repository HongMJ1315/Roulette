//
//  ContentView.swift
//  Roulette
//
//  Created by Mr.JB on 2023/3/8.
//

import SwiftUI

struct coinInBlock : Hashable{
    var value: Int
    var total: Int
    
}

struct chipState : Hashable{
    var isSelect : Bool
    var value : Int
    var label : String
    var color: Color
}

struct Block : Hashable, Identifiable{
    var id = UUID()
    var value: String
    var color: Color
    var coins: [coinInBlock]{
        willSet{
            print("\(coins.count)")
            for i in coins{
                print("\(value), \(i.value), \(i.total)")
            }
        }
        
    }
}


struct ContentView: View {
    @State private var isPresented = false
    @State var number : Int = 0;
    @State var other : Int = 0;
    @State var money : Int = 30000;
    @State var selectCoin : Int = 0;
    @State var isOtherSelect : Bool = false;
    @State var topBlock = [
        Block(value: "0", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: []),
        Block(value: "00", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [])
    ]
    @State var sideBlock1 = [
        Block(value: "1st", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: []),
        Block(value: "2nd", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: []),
        Block(value: "3rd", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [])
    ]
    @State var sideBlock2 = [
        Block(value: "1-18", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: []),
        Block(value: "Even", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: []),
        Block(value: "Black", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: []),
        Block(value: "Red", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: []),
        Block(value: "Odd", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: []),
        Block(value: "19-36", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [])
    ]
    @State var firstBlock = [
            [
                Block(value: "1", color: .red, coins: []),
                Block(value: "2", color: .black, coins: []),
                Block(value: "3", color: .red, coins: [])
            ],
            [   Block(value: "4", color: .black, coins: []),
                Block(value: "5", color: .red, coins: []),
                Block(value: "6", color: .black, coins: [])],
            [
                Block(value: "7", color: .red, coins: []),
                Block(value: "8", color: .black, coins: []),
                Block(value: "9", color: .red, coins: [])
            ],
            [
                Block(value: "10", color: .black, coins: []),
                Block(value: "11", color: .black, coins: []),
                Block(value: "12", color: .red, coins: [])
            ]
        ]
    @State var secondBlock = [
            [
                Block(value: "13", color: .black, coins: []),
                Block(value: "14", color: .red, coins: []),
                Block(value: "15", color: .black, coins: [])
            ],
            [
                Block(value: "16", color: .red, coins: []),
                Block(value: "17", color: .black, coins: []),
                Block(value: "18", color: .red, coins: [])
            ],
            [
                Block(value: "19", color: .red, coins: []),
                Block(value: "20", color: .black, coins: []),
                Block(value: "21", color: .red, coins: [])
            ],
            [
                Block(value: "22", color: .black, coins: []),
                Block(value: "23", color: .red, coins: []),
                Block(value: "24", color: .black, coins: [])
            ]
        ]
    @State var thirdBlock = [
            [
                Block(value: "25", color: .red, coins: []),
                Block(value: "26", color: .black, coins: []),
                Block(value: "27", color: .red, coins: [])
            ],
            [
                Block(value: "28", color: .black, coins: []),
                Block(value: "29", color: .black, coins: []),
                Block(value: "30", color: .red, coins: [])
            ],
            [
                Block(value: "31", color: .black, coins: []),
                Block(value: "32", color: .red, coins: []),
                Block(value: "33", color: .black, coins: [])
            ],
            [
                Block(value: "34", color: .red, coins: []),
                Block(value: "35", color: .black, coins: []),
                Block(value: "36", color: .red, coins: [])
            ]
        ]
    @State var selectedBlock: Block = Block(value: "0", color: .red, coins: []){
        willSet{
            print("\(selectedBlock.value)")
        }
    }
    @State var chips = [
        chipState(isSelect: false, value: 10, label: "10", color : Color(red: .random(in: 0...255)/255, green: .random(in: 0...255)/255, blue: .random(in: 0...255)/255)),
        chipState(isSelect: false, value: 100, label: "100", color : Color(red: .random(in: 0...255)/255, green: .random(in: 0...255)/255, blue: .random(in: 0...255)/255)),
        chipState(isSelect: false, value: 1000, label: "1K", color : Color(red: .random(in: 0...255)/255, green: .random(in: 0...255)/255, blue: .random(in: 0...255)/255)),
        chipState(isSelect: false, value: 10000, label: "10K", color : Color(red: .random(in: 0...255)/255, green: .random(in: 0...255)/255, blue: .random(in: 0...255)/255)),
        chipState(isSelect: false, value: 100000, label: "100K", color : Color(red: .random(in: 0...255)/255, green: .random(in: 0...255)/255, blue: .random(in: 0...255)/255))
    ]
//    var chips = ["10", "100", "1K", "10K", "100K"]
    @State var randNumber : String = "0";
    var body: some View {
        HStack(spacing: 1){
            VStack{
                ForEach(0..<chips.count, id: \.self){ i in
                    Text(chips[i].label)
                        .foregroundColor(.white)
                        .frame(width: 35.0, height: 25.0)
                        .padding()
                        .font(.system(size: 15))
                        .background(chips[i].color)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.red, lineWidth: chips[i].isSelect ? 3 : 0))
                        .onTapGesture {
                            isOtherSelect = false;
                            for j in chips{
                                if j.label == chips[i].label{
                                    continue;
                                }
                                if(j.isSelect == true){
                                    isOtherSelect = true;
                                }
                            }
                            if(isOtherSelect == false){
                                if(chips[i].isSelect == false){
                                    selectCoin = chips[i].value;
                                    chips[i].isSelect = true;
                                }
                                else if(chips[i].isSelect == true){
                                    selectCoin = 0;
                                    chips[i].isSelect = false;
                                }
                            }
                        }
                }
                .rotationEffect(Angle(degrees: 90))
                .offset(y : -150)
                Button{
                    for col in 0..<firstBlock.count{
                        for row in 0..<firstBlock[col].count{
                            firstBlock[col][row].coins.removeAll()
                        }
                    }
                    for col in 0..<secondBlock.count{
                        for row in 0..<secondBlock[col].count{
                            secondBlock[col][row].coins.removeAll()
                        }
                    }
                    for col in 0..<thirdBlock.count{
                        for row in 0..<thirdBlock[col].count{
                            thirdBlock[col][row].coins.removeAll()
                        }
                    }
                    for row in 0..<topBlock.count{
                        topBlock[row].coins.removeAll()
                    }
                } label:{
                    Text("Clear")
                }
                .offset(x:150)
                .rotationEffect(Angle(degrees: 90))
            }
            HStack(spacing:0){
                VStack(spacing: 0){
                    ForEach(sideBlock2.indices, id: \.self) { row in
                        let blockColor = sideBlock2[row].color
                        let blockValue = sideBlock2[row].value
                        Text(String(blockValue))
                            .rotationEffect(Angle(degrees: 90))
                            .foregroundColor(.white)
                            .padding(0.0)
                            .frame(width: 50.0, height: 100.0)
                            .background(blockColor)
                            .border(Color.cyan, width: sideBlock2[row].coins.count == 0 ? 0 : 3)
                            .onTapGesture {
                                if selectCoin == 0 {
                                    return
                                }
                                if let index = sideBlock2[row].coins.firstIndex(where: { $0.value == selectCoin }) {
                                    sideBlock2[row].coins[index].total += 1
                                    return
                                } else {
                                    sideBlock2[row].coins.append(coinInBlock(value: selectCoin, total: 1))
                                }
                                
                                
                            }
                            .onLongPressGesture {
                                selectedBlock = sideBlock2[row]
                                isPresented = true
                            }
                            .sheet(isPresented: $isPresented) {
                                ChildView(selectBlock: selectedBlock, isPresented: $isPresented)
                                    .onAppear {
                                        selectedBlock = selectedBlock
                                    }
                            }
                        }
//                    .rotationEffect(Angle(degrees: 90))
            
                }
                .offset(y : 25)
                VStack(spacing: 0){
                    ForEach(sideBlock1.indices, id: \.self) { row in
                        let blockColor = sideBlock1[row].color
                        let blockValue = sideBlock1[row].value
                        Text(String(blockValue))
                            .rotationEffect(Angle(degrees: 90))
                            .foregroundColor(.white)
                            .padding(0.0)
                            .frame(width: 50.0, height: 200.0)
                            .background(blockColor)
                            .border(Color.cyan, width: sideBlock1[row].coins.count == 0 ? 0 : 3)
                            .onTapGesture {
                                if selectCoin == 0 {
                                    return
                                }
                                if let index = sideBlock1[row].coins.firstIndex(where: { $0.value == selectCoin }) {
                                    sideBlock1[row].coins[index].total += 1
                                    return
                                } else {
                                    sideBlock1[row].coins.append(coinInBlock(value: selectCoin, total: 1))
                                }
                                
                                
                            }
                            .onLongPressGesture {
                                selectedBlock = sideBlock1[row]
                                isPresented = true
                            }
                            .sheet(isPresented: $isPresented) {
                                ChildView(selectBlock: selectedBlock, isPresented: $isPresented)
                                    .onAppear {
                                        selectedBlock = selectedBlock
                                    }
                            }
                    }
                    
                }
                .offset(y : 25)
                VStack(spacing:0){
                    HStack(spacing:0){
                        ForEach(topBlock.indices, id: \.self) { row in
                            let blockColor = topBlock[row].color
                            let blockValue = topBlock[row].value
                            Text(String(blockValue))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 82.5, height: 50.0)
                                .background(blockColor)
                                .border(Color.cyan, width: topBlock[row].coins.count == 0 ? 0 : 3)
                                .onTapGesture {
                                    
                                    if selectCoin == 0 {
                                        //                                        selectBlock.coins.removeAll()
                                        return
                                    }
                                    if let index = topBlock[row].coins.firstIndex(where: { $0.value == selectCoin }) {
                                        topBlock[row].coins[index].total += 1
                                        return
                                    } else {
                                        topBlock[row].coins.append(coinInBlock(value: selectCoin, total: 1))
                                    }
                                    
                                    
                                }
                                .onLongPressGesture {
                                    selectedBlock = topBlock[row]
                                    isPresented = true
                                }
                                .sheet(isPresented: $isPresented) {
                                    ChildView(selectBlock: selectedBlock, isPresented: $isPresented)
                                        .onAppear {
                                            selectedBlock = selectedBlock
                                        }
                                }
                            
                        }
                    }
                    ForEach(firstBlock.indices, id: \.self) { col in
                        HStack (spacing:0){
                            ForEach(firstBlock[col].indices, id: \.self) { row in
                                let blockColor = firstBlock[col][row].color
                                let blockValue = firstBlock[col][row].value
                                Text(String(blockValue))
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 55.0, height: 50.0)
                                    .background(blockColor)
                                    .border(Color.cyan, width: firstBlock[col][row].coins.count == 0 ? 0 : 3)
                                    .onTapGesture {
                                        
                                        if selectCoin == 0 {
                                            //                                        selectBlock.coins.removeAll()
                                            return
                                        }
                                        if let index = firstBlock[col][row].coins.firstIndex(where: { $0.value == selectCoin }) {
                                            firstBlock[col][row].coins[index].total += 1
                                            return
                                        } else {
                                            firstBlock[col][row].coins.append(coinInBlock(value: selectCoin, total: 1))
                                        }
                                        
                                        
                                    }
                                    .onLongPressGesture {
                                        selectedBlock = firstBlock[col][row]
                                        isPresented = true
                                    }
                                    .sheet(isPresented: $isPresented) {
                                        ChildView(selectBlock: selectedBlock, isPresented: $isPresented)
                                            .onAppear {
                                                selectedBlock = selectedBlock
                                            }
                                    }
                                
                                
                            }
                        }
                    }
                    ForEach(secondBlock.indices, id: \.self){ col in
                        HStack(spacing:0){
                            ForEach(secondBlock[col].indices, id: \.self){ row in
                                let selectBlock = secondBlock[col][row]
                                let blockColor = selectBlock.color;
                                let blockValue = selectBlock.value;
                                Text(String(blockValue))
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 55.0, height: 50.0)
                                    .background(blockColor)
                                    .border(Color.cyan, width: secondBlock[col][row].coins.count == 0 ? 0 : 3)
                                    .onTapGesture {
                                        if selectCoin == 0 {
                                            //                                        selectBlock.coins.removeAll()
                                            return
                                        }
                                        if let index = secondBlock[col][row].coins.firstIndex(where: { $0.value == selectCoin }) {
                                            secondBlock[col][row].coins[index].total += 1
                                        } else {
                                            secondBlock[col][row].coins.append(coinInBlock(value: selectCoin, total: 1))
                                        }
                                        
                                    }
                                    .onLongPressGesture {
                                        selectedBlock = secondBlock[col][row]
                                        isPresented = true
                                    }
                                    .sheet(isPresented: $isPresented) {
                                        ChildView(selectBlock: selectedBlock, isPresented: $isPresented)
                                            .onAppear {
                                                selectedBlock = selectedBlock
                                            }
                                    }
                            }
                        }
                    }
                    ForEach(thirdBlock.indices, id: \.self){ col in
                        HStack(spacing:0){
                            ForEach(thirdBlock[col].indices, id: \.self){ row in
                                let selectBlock = thirdBlock[col][row]
                                let blockColor = selectBlock.color;
                                let blockValue = selectBlock.value;
                                Text(String(blockValue))
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 55.0, height: 50.0)
                                    .background(blockColor)
                                    .border(Color.cyan, width: thirdBlock[col][row].coins.count == 0 ? 0 : 3)
                                    .onTapGesture {
                                        if selectCoin == 0 {
                                            //                                        selectBlock.coins.removeAll()
                                            return
                                        }
                                        if let index = thirdBlock[col][row].coins.firstIndex(where: { $0.value == selectCoin }) {
                                            thirdBlock[col][row].coins[index].total += 1
                                        } else {
                                            thirdBlock[col][row].coins.append(coinInBlock(value: selectCoin, total: 1))
                                        }
                                    }
                                    .onLongPressGesture {
                                        selectedBlock = thirdBlock[col][row]
                                        isPresented = true
                                    }
                                    .sheet(isPresented: $isPresented) {
                                        ChildView(selectBlock: selectedBlock, isPresented: $isPresented)
                                            .onAppear {
                                                selectedBlock = selectedBlock
                                            }
                                    }
                            }
                        }
                    }
                }
            }
            VStack{
                Text(String(randNumber))
                    .offset(x:-250)
                    .frame(width: 50.0, height: 0.0)
                    .rotationEffect(Angle(degrees: 90))
                Text(String(money))
                    .rotationEffect(Angle(degrees: 90))
                Button{
                    number = .random(in:0...36);
                    if(number==0){
                        
                        other = .random(in:0...1);
                        if(other==0){
                            randNumber = "00"
                        }
                        else{
                            randNumber = "0"
                        }
                    }
                    else{
                        randNumber = String(number)
                    }
                } label:{
                    Text("Roll")
                }
                .offset(x:250)
                .rotationEffect(Angle(degrees: 90))
            }
        }
        .rotationEffect(Angle(degrees: 270))
            
    }
}

struct ChildView: View {
    var selectBlock : Block
//    var row : Int
//    var col : Int
    @Binding var isPresented : Bool
    var body: some View {
        HStack(){
            Text("\(selectBlock.value)")
                .font(.system(size: 15))
            ForEach(selectBlock.coins, id:\.self){ coin in
                Text("\(coin.value), \(coin.total)")
                    .font(.largeTitle)
                    .padding()
                    .border(Color.red, width: 2)
                    
            }
            Text("Back")
                .font(.largeTitle)
                .padding()
                .onTapGesture {
                    isPresented = false
                }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
