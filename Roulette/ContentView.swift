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
//            print("\(coins.count)")
//            for i in coins{
//                print("\(value), \(i.value), \(i.total)")
//            }
        }
    }
    var odds : Int
}

enum numberColor {
    case red
    case black
    case green
}

struct ContentView: View {
    var numberDict = [
        "1" : numberColor.red,      "2" : numberColor.black,    "3" : numberColor.red,
        "4" : numberColor.black,    "5" : numberColor.red,      "6" : numberColor.black,
        "7" : numberColor.red,      "8" : numberColor.black,    "9" : numberColor.red,
        "10" : numberColor.black,   "11" : numberColor.black,     "12" : numberColor.red,
        
        "13" : numberColor.red, "14" : numberColor.red, "15" : numberColor.red,
        "16" : numberColor.red, "17" : numberColor.red, "18" : numberColor.red,
        "19" : numberColor.red, "20" : numberColor.red, "21" : numberColor.red,
        "22" : numberColor.red, "23" : numberColor.red, "24" : numberColor.red,
        
        "25" : numberColor.red,     "26" : numberColor.black, "27" : numberColor.red,
        "28" : numberColor.black,   "29" : numberColor.black, "30" : numberColor.red,
        "31" : numberColor.black,   "32" : numberColor.red,   "33" : numberColor.black,
        "34" : numberColor.red,     "35" : numberColor.black, "36" : numberColor.red,
        
        "0" : numberColor.green, "00" : numberColor.green
    ]
//    @State var warntext : String = ""
    @State private var isPresented = false
    @State var number : Int = 0{
        willSet{
            print((number-1)/12, (number-1)%3)
        }
    };
    @State var other : Int = 0;
    @State var money : Int = 30000;
    @State var selectCoin : Int = 0;
    @State var isOtherSelect : Bool = false;
    @State var topBlock = [
        Block(value: "0", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [], odds: 35),
        Block(value: "00", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [], odds: 35)
    ]
    @State var sideBlock1 = [
        Block(value: "1st", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [], odds: 2),
        Block(value: "2nd", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [], odds: 2),
        Block(value: "3rd", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [], odds: 2)
    ]
    @State var buttonBlock = [
        Block(value: "2To1", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [], odds: 2),
        Block(value: "2To1", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [], odds: 2),
        Block(value: "2To1", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [], odds: 2)
    ]
    @State var sideBlock2 = [
        Block(value: "1-18", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [], odds: 1),
        Block(value: "Even", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [], odds: 1),
        Block(value: "Black", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [], odds: 1),
        Block(value: "Red", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [], odds: 1),
        Block(value: "Odd", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [], odds: 1),
        Block(value: "19-36", color: Color(red: 44/255, green: 62/255, blue: 80/255), coins: [], odds: 1)
    ]
    @State var allBlock = [[
            [
                Block(value: "1", color: .red, coins: [], odds: 35),
                Block(value: "2", color: .black, coins: [], odds: 35),
                Block(value: "3", color: .red, coins: [], odds: 35)
            ],
            [
                Block(value: "4", color: .black, coins: [], odds: 35),
                Block(value: "5", color: .red, coins: [], odds: 35),
                Block(value: "6", color: .black, coins: [], odds: 35)
            ],
            [
                Block(value: "7", color: .red, coins: [], odds: 35),
                Block(value: "8", color: .black, coins: [], odds: 35),
                Block(value: "9", color: .red, coins: [], odds: 35)
            ],
            [
                Block(value: "10", color: .black, coins: [], odds: 35),
                Block(value: "11", color: .black, coins: [], odds: 35),
                Block(value: "12", color: .red, coins: [], odds: 35)
            ]
        ],
        [
            [
                Block(value: "13", color: .black, coins: [], odds: 35),
                Block(value: "14", color: .red, coins: [], odds: 35),
                Block(value: "15", color: .black, coins: [], odds: 35)
            ],
            [
                Block(value: "16", color: .red, coins: [], odds: 35),
                Block(value: "17", color: .black, coins: [], odds: 35),
                Block(value: "18", color: .red, coins: [], odds: 35)
            ],
            [
                Block(value: "19", color: .red, coins: [], odds: 35),
                Block(value: "20", color: .black, coins: [], odds: 35),
                Block(value: "21", color: .red, coins: [], odds: 35)
            ],
            [
                Block(value: "22", color: .black, coins: [], odds: 35),
                Block(value: "23", color: .red, coins: [], odds: 35),
                Block(value: "24", color: .black, coins: [], odds: 35)
            ]
        ],
        [
            [
                Block(value: "25", color: .red, coins: [], odds: 35),
                Block(value: "26", color: .black, coins: [], odds: 35),
                Block(value: "27", color: .red, coins: [], odds: 35)
            ],
            [
                Block(value: "28", color: .black, coins: [], odds: 35),
                Block(value: "29", color: .black, coins: [], odds: 35),
                Block(value: "30", color: .red, coins: [], odds: 35)
            ],
            [
                Block(value: "31", color: .black, coins: [], odds: 35),
                Block(value: "32", color: .red, coins: [], odds: 35),
                Block(value: "33", color: .black, coins: [], odds: 35)
            ],
            [
                Block(value: "34", color: .red, coins: [], odds: 35),
                Block(value: "35", color: .black, coins: [], odds: 35),
                Block(value: "36", color: .red, coins: [], odds: 35)
            ]
        ]]
    @State var selectedBlock: Block = Block(value: "0", color: .red, coins: [], odds: 0){
        willSet{
//            print("\(selectedBlock.value)")
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
                        .frame(width: 30.0, height: 40.0)
                        .padding()
                        .font(.system(size: 12))
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
                                if(money < chips[i].value){
                                    chips[i].isSelect = false;
                                    return
                                }
                                if(chips[i].isSelect == false){
                                    selectCoin = chips[i].value;
                                    chips[i].isSelect = true;
//                                    warntext = ""
                                }
                                else if(chips[i].isSelect == true){
                                    selectCoin = 0;
                                    chips[i].isSelect = false;
//                                    warntext = ""
                                }
                            }
                        }
                }
                .rotationEffect(Angle(degrees: 90))
                .offset(y : -100)
                Button{
                    for i in 0..<allBlock.count{
                        for col in 0..<allBlock[i].count{
                            for row in 0..<allBlock[i][col].count{
                                for coin in allBlock[i][col][row].coins{
                                    money += coin.value * coin.total
                                }
                                allBlock[i][col][row].coins.removeAll()
                            }
                        }
                    }
                    for row in 0..<topBlock.count{
                        for coin in topBlock[row].coins{
                            money += coin.value * coin.total
                        }
                        topBlock[row].coins.removeAll()
                    }
                    for row in 0..<buttonBlock.count{
                        for coin in buttonBlock[row].coins{
                            money += coin.value * coin.total
                        }
                        buttonBlock[row].coins.removeAll()
                    }
                    for row in 0..<sideBlock1.count{
                        for coin in sideBlock1[row].coins{
                            money += coin.value * coin.total
                        }
                        sideBlock1[row].coins.removeAll()
                    }
                    for row in 0..<sideBlock2.count{
                        for coin in sideBlock2[row].coins{
                            money += coin.value * coin.total
                        }
                        sideBlock2[row].coins.removeAll()
                    }
                } label:{
                    Text("Clear")
                        .foregroundColor(.black)
                }
                .offset(x:100)
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
                                if(money - selectCoin < 0){ return }
                                if let index = sideBlock2[row].coins.firstIndex(where: { $0.value == selectCoin }) {
                                    sideBlock2[row].coins[index].total += 1
                                } else {
                                    sideBlock2[row].coins.append(coinInBlock(value: selectCoin, total: 1))
                                }
                                money -= selectCoin
                                
                            }
                            .onLongPressGesture {
                                selectedBlock = sideBlock2[row]
                                isPresented = true
                            }
                            .sheet(isPresented: $isPresented) {
                                ChildView(selectBlock: selectedBlock, chips: chips, isPresented: $isPresented)
                                    .onAppear {
                                        selectedBlock = selectedBlock
                                    }
                            }
                        }
//                    .rotationEffect(Angle(degrees: 90))
            
                }
                .offset(y : 0)
                VStack(spacing: 0){
                    ForEach(sideBlock1.indices, id: \.self) { row in
                        let blockColor = sideBlock1[row].color
                        let blockValue = sideBlock1[row].value
                        Text(String(blockValue))
                            .rotationEffect(Angle(degrees: 90))
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                            .frame(width: 48.5, height: 200.0)
                            .background(blockColor)
                            .border(Color.cyan, width: sideBlock1[row].coins.count == 0 ? 0 : 3)
                            .onTapGesture {
                                if selectCoin == 0 {
                                    return
                                }
                                if(money - selectCoin < 0){ return }
                                if let index = sideBlock1[row].coins.firstIndex(where: { $0.value == selectCoin }) {
                                    sideBlock1[row].coins[index].total += 1
                                } else {
                                    sideBlock1[row].coins.append(coinInBlock(value: selectCoin, total: 1))
                                }
                                money -= selectCoin
                                
                            }
                            .onLongPressGesture {
                                selectedBlock = sideBlock1[row]
                                isPresented = true
                            }
                            .sheet(isPresented: $isPresented) {
                                ChildView(selectBlock: selectedBlock, chips: chips, isPresented: $isPresented)
                                    .onAppear {
                                        selectedBlock = selectedBlock
                                    }
                            }
                    }
                    
                }
                .offset(y : 0)
                VStack(spacing:0){
                    HStack(spacing:0){
                        ForEach(topBlock.indices, id: \.self) { row in
                            let blockColor = topBlock[row].color
                            let blockValue = topBlock[row].value
                            Text(String(blockValue))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 90, height: 50.0)
                                .background(blockColor)
                                .border(Color.cyan, width: topBlock[row].coins.count == 0 ? 0 : 3)
                                .onTapGesture {
                                    
                                    if selectCoin == 0 {
                                        //                                        selectBlock.coins.removeAll()
                                        return
                                    }
                                    if(money - selectCoin < 0){ return }
                                    if let index = topBlock[row].coins.firstIndex(where: { $0.value == selectCoin }) {
                                        topBlock[row].coins[index].total += 1
                                    } else {
                                        topBlock[row].coins.append(coinInBlock(value: selectCoin, total: 1))
                                    }
                                    money -= selectCoin
                                    
                                }
                                .onLongPressGesture {
                                    selectedBlock = topBlock[row]
                                    isPresented = true
                                }
                                .sheet(isPresented: $isPresented) {
                                    ChildView(selectBlock: selectedBlock, chips: chips, isPresented: $isPresented)
                                        .onAppear {
                                            selectedBlock = selectedBlock
                                        }
                                }
                            
                        }
                    }
                    ForEach(allBlock.indices, id: \.self){ i in
                        ForEach(allBlock[i].indices, id: \.self) { col in
                            HStack (spacing:0){
                                ForEach(allBlock[i][col].indices, id: \.self) { row in
                                    let blockColor = allBlock[i][col][row].color
                                    let blockValue = allBlock[i][col][row].value
                                    Text(String(blockValue))
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 60, height: 50.0)
                                        .background(blockColor)
                                        .border(Color.cyan, width: allBlock[i][col][row].coins.count == 0 ? 0 : 3)
                                        .onTapGesture {
                                            
                                            if selectCoin == 0 {
                                                //                                        selectBlock.coins.removeAll()
                                                return
                                            }
                                            if(money - selectCoin < 0){ return }
                                            if let index = allBlock[i][col][row].coins.firstIndex(where: { $0.value == selectCoin }) {
                                                allBlock[i][col][row].coins[index].total += 1
                                            } else {
                                                allBlock[i] [col][row].coins.append(coinInBlock(value: selectCoin, total: 1))
                                            }
                                            money -= selectCoin
                                            
                                        }
                                        .onLongPressGesture {
                                            selectedBlock = allBlock[i][col][row]
                                            isPresented = true
                                        }
                                        .sheet(isPresented: $isPresented) {
                                            ChildView(selectBlock: selectedBlock, chips: chips, isPresented: $isPresented)
                                                .onAppear {
                                                    selectedBlock = selectedBlock
                                                }
                                        }
                                    
                                    
                                }
                            }
                        }
                    }
                    HStack(spacing:0){
                        ForEach(buttonBlock.indices, id: \.self) { row in
                            let blockColor = buttonBlock[row].color
                            let blockValue = buttonBlock[row].value
                            Text(String(blockValue))
//                                .rotationEffect(Angle(degrees: 90))
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .frame(width: 60, height: 50.0)
                                .background(blockColor)
                                .border(Color.cyan, width: buttonBlock[row].coins.count == 0 ? 0 : 3)
                                .onTapGesture {
                                    
                                    if selectCoin == 0 {
                                        //                                        selectBlock.coins.removeAll()
                                        return
                                    }
                                    if(money - selectCoin < 0){ return }
                                    if let index = buttonBlock[row].coins.firstIndex(where: { $0.value == selectCoin }) {
                                        buttonBlock[row].coins[index].total += 1
                                    } else {
                                        buttonBlock[row].coins.append(coinInBlock(value: selectCoin, total: 1))
                                    }
                                    money -= selectCoin
                                    
                                }
                                .onLongPressGesture {
                                    selectedBlock = buttonBlock[row]
                                    isPresented = true
                                }
                                .sheet(isPresented: $isPresented) {
                                    ChildView(selectBlock: selectedBlock, chips: chips, isPresented: $isPresented)
                                        .onAppear {
                                            selectedBlock = selectedBlock
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
                HStack(spacing:0){
                    Text(String(money))
                        .rotationEffect(Angle(degrees: 90))
                    
                }
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        
                        if(randNumber != "0" && randNumber != "00"){
                            for coin in sideBlock1[Int((number-1)/12)].coins{
                                money += coin.value * coin.total * sideBlock1[Int((number-1)/12)].odds;
                            }
                            for coin in sideBlock2[((number%2==1) ? 4 : 1)].coins{
                                money += coin.value * coin.total * sideBlock2[((number%2==1) ? 4 : 1)].odds;
                            }
                            for coin in sideBlock2[((numberDict[randNumber]==numberColor.red) ? 3 : 2)].coins{
                                money += coin.value * coin.total * sideBlock2[((numberDict[randNumber]==numberColor.red) ? 3 : 2)].odds;
                            }
                            for coin in sideBlock2[((1 <= number && number <= 12) ? 0 : 5)].coins{
                                money += coin.value * coin.total * sideBlock2[((1 <= number && number <= 12) ? 0 : 5)].odds;
                            }
                            for coin in buttonBlock[(number-1)%3].coins{
                                money += coin.value * coin.total * buttonBlock[(number-1)%3].odds;
                            }
                        }
                        for i in 0..<allBlock.count{
                            for col in 0..<allBlock[i].count{
                                for row in 0..<allBlock[i][col].count{
                                    if(allBlock[i][col][row].value==randNumber){
                                        for coin in allBlock[i][col][row].coins{
                                            money += coin.value * coin.total * allBlock[i][col][row].odds;
                                        }
                                    }
                                    allBlock[i][col][row].coins.removeAll()
                                }
                            }
                        }

                        for row in 0..<topBlock.count{
                            if(topBlock[row].value==randNumber){
                                for coin in topBlock[row].coins{
                                    money += coin.value * topBlock[row].odds;
                                }
                            }
                            topBlock[row].coins.removeAll()
                        }
                        for row in 0..<buttonBlock.count{
                            if(buttonBlock[row].value==randNumber){
                                for coin in buttonBlock[row].coins{
                                    money += coin.value * buttonBlock[row].odds;
                                }
                            }
                            buttonBlock[row].coins.removeAll()
                        }
                        for row in 0..<sideBlock1.count{
                            sideBlock1[row].coins.removeAll()
                        }
                        for row in 0..<sideBlock2.count{
                            if(randNumber != "0" && randNumber != "00"){
                                
                            }
                            sideBlock2[row].coins.removeAll()
                        }
                        
                    }
                    
                } label:{
                    Text("spin")
                        .foregroundColor(.black)
                }
                .offset(x:250)
                .rotationEffect(Angle(degrees: 90))
            }
        }
        

        .background(Color(red: 20/255, green: 90/255, blue: 50/255))
        .rotationEffect(Angle(degrees: 270))
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

        
    }
}

struct ChildView: View {
    var selectBlock : Block
    var chips : [chipState]
//    var row : Int
//    var col : Int
    @Binding var isPresented : Bool
    var body: some View {
        VStack(){
            Text("Block : \(selectBlock.value)")
                .font(.system(size: 20))
            ForEach(selectBlock.coins, id:\.self){ coin in
                HStack{
                    if let matchingChip = chips.filter({ $0.value == coin.value }).first {
                        Text("\(matchingChip.label)")
                            .foregroundColor(.white)
                            .frame(width: 35.0, height: 25.0)
                            .padding()
                            .font(.system(size: 15))
                            .background(matchingChip.color)
                            .clipShape(Circle())
                        Text(" x \(coin.total)")
                    }
                }

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
