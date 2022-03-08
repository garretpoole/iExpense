//
//  ContentView.swift
//  iExpense
//
//  Created by Garret Poole on 3/7/22.
//

import SwiftUI

struct ContentView: View {
    //monitored and works just like @State
    //@AppStorage works just like UserDefault but more complex when it comes to larger data types
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
