//
//  ContentView.swift
//  iRoll
//
//  Created by Carlos Vinicius on 14/11/22.
//

import SwiftUI

struct ContentView: View {
    
    let dices = [4, 6, 8, 10, 12, 20, 50, 100]
    //@State private var timesButton = Int()
    @State private var selectedDice = Int()
    @State private var numberOfDice = Int()
    @State private var results = [Int]()
    @State private var totalRolled = 0
    
    var body: some View {
        NavigationStack {
            Form {
                //VStack {
                Picker("How many dices?", selection: $numberOfDice) {
                    ForEach((1..<6), id: \.self) {
                        Text("\($0)")
                    }
                }
                Picker("Choose a dice!", selection: $selectedDice) {
                    ForEach(dices, id: \.self) {
                        Text("\($0)")
                    }
                }
                Button {
                    totalRolled = 0
                    randomDiceNumber(howMany: numberOfDice, dice: generateDice(diceFaces: selectedDice))
                    //timesButton += 1
                } label: {
                    Image(systemName: "dice")
                }
                Section {
                    List {
                        ForEach(results.reversed(), id: \.self) { side in
                            Text("\(side)")
                        }
                    }
                }
            }
            .navigationTitle("iRoll")
            .toolbar() {
                Text("Total rolled this time: \(totalRolled)")
            }
        }
    }
    
    func randomDiceNumber (howMany: Int, dice: [Int]) {
        var result = Int()
        for _ in 0..<howMany {
            result = dice.randomElement()!
            results.append(result)
            totalRolled += result
        }
    }
    
    func generateDice (diceFaces: Int) -> [Int] {
        var diceArray = [Int]()
        for t in 0..<diceFaces {
            diceArray.append(t)
        }
        return diceArray
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
