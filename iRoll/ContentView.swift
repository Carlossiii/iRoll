//
//  ContentView.swift
//  iRoll
//
//  Created by Carlos Vinicius on 14/11/22.
//

import SwiftUI

struct ContentView: View {
    
    let dice6 = [1, 2, 3, 4, 5, 6]
    @State private var results = [Int]()
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Roll the dice!") {
                    results.append(randomDiceNumber(dice: dice6))
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
        }
    }
    
    func randomDiceNumber (dice: [Int]) -> Int {
        dice.randomElement()!
    }
    
    func generateDice (dice: Int) -> [Int] {
        var diceArray = [Int]()
        for t in 0..<dice {
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
