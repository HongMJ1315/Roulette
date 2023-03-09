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
}
struct Block : Hashable{
    var value: Int
    var color: Color
    var coins: [coinInBlock]
}


struct ContentView: View {
    @State var number : Int = 0;
    @State var other : Int = 0;
    @State var money : Int = 30000;
    @State var selectCoin : Int = 0;
    @State var firstBlock = [
            [
                Block(value: 1, color: .red, coins: []),
                Block(value: 2, color: .black, coins: []),
                Block(value: 3, color: .red, coins: [])
            ],
            [   Block(value: 4, color: .black, coins: []),
                Block(value: 5, color: .red, coins: []),
                Block(value: 6, color: .black, coins: [])],
            [
                Block(value: 7, color: .red, coins: []),
                Block(value: 8, color: .black, coins: []),
                Block(value: 9, color: .red, coins: [])
            ],
            [
                Block(value: 10, color: .black, coins: []),
                Block(value: 11, color: .black, coins: []),
                Block(value: 12, color: .red, coins: [])
            ]
        ]
    @State var secondBlock = [
            [
                Block(value: 13, color: .black, coins: []),
                Block(value: 14, color: .red, coins: []),
                Block(value: 15, color: .black, coins: [])
            ],
            [
                Block(value: 16, color: .red, coins: []),
                Block(value: 17, color: .black, coins: []),
                Block(value: 18, color: .red, coins: [])
            ],
            [
                Block(value: 19, color: .red, coins: []),
                Block(value: 20, color: .black, coins: []),
                Block(value: 21, color: .red, coins: [])
            ],
            [
                Block(value: 22, color: .black, coins: []),
                Block(value: 23, color: .red, coins: []),
                Block(value: 24, color: .black, coins: [])
            ]
        ]
    @State var thirdBlock = [
            [
                Block(value: 25, color: .red, coins: []),
                Block(value: 26, color: .black, coins: []),
                Block(value: 27, color: .red, coins: [])
            ],
            [
                Block(value: 28, color: .black, coins: []),
                Block(value: 29, color: .black, coins: []),
                Block(value: 30, color: .red, coins: [])
            ],
            [
                Block(value: 31, color: .black, coins: []),
                Block(value: 32, color: .red, coins: []),
                Block(value: 33, color: .black, coins: [])
            ],
            [
                Block(value: 34, color: .red, coins: []),
                Block(value: 35, color: .black, coins: []),
                Block(value: 36, color: .red, coins: [])
            ]
        ]
    @State var chips = [
        chipState(isSelect: false, value: 10, label: "10"),
        chipState(isSelect: false, value: 100, label: "100"),
        chipState(isSelect: false, value: 1000, label: "1K"),
        chipState(isSelect: false, value: 10000, label: "10K"),
        chipState(isSelect: false, value: 100000, label: "100K")
    ]
//    var chips = ["10", "100", "1K", "10K", "100K"]
    @State var randNumber : String = "0";
    var body: some View {
        HStack{
            VStack{
                ForEach(0..<chips.count, id: \.self){ i in
                    Text(chips[i].label)
                        .foregroundColor(.white)
                        .frame(width: 40.0, height: 40.0)
                        .padding()
                        .background(Color(red: .random(in: 0...255)/255, green: .random(in: 0...255)/255, blue: .random(in: 0...255)/255))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.red, lineWidth: chips[i].isSelect ? 3 : 0))
                        .onTapGesture {
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
                .rotationEffect(Angle(degrees: 90))
                
            }
            VStack{
                
                ForEach(firstBlock, id: \.self){ col in
                    HStack{
                        ForEach(col, id: \.self){ row in
                            let blockColor = row.color;
                            let blockValue = row.value;
                            Text(String(blockValue))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 60.0, height: 50.0)
                            //                            .rotationEffect(Angle(degrees: 90))
                                .background(blockColor)
                            
                        }
                    }
                }
                ForEach(secondBlock, id: \.self){ col in
                    HStack{
                        ForEach(col, id: \.self){ row in
                            let blockColor = row.color;
                            let blockValue = row.value;
                            Text(String(blockValue))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 60.0, height: 50.0)
                            //                            .rotationEffect(Angle(degrees: 90))
                                .background(blockColor)
                            
                        }
                    }
                }
                ForEach(thirdBlock, id: \.self){ col in
                    HStack{
                        ForEach(col, id: \.self){ row in
                            let blockColor = row.color;
                            let blockValue = row.value;
                            Text(String(blockValue))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 60.0, height: 50.0)
                            //                            .rotationEffect(Angle(degrees: 90))
                                .background(blockColor)
                            
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
