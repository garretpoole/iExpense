//
//  ContentView.swift
//  iExpense
//
//  Created by Garret Poole on 3/7/22.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var current = 1
    
    var body: some View {
        NavigationView{
            VStack{
                //same as below but onDelete() works for only ForEach
    //            List(numbers, id: \.self){
    //                Text("Row \($0)")
    //            }
                List{
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(current)
                    current += 1
                }
            }
            .navigationTitle("onDelete()")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet){
        numbers.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
