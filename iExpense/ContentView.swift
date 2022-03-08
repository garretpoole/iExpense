//
//  ContentView.swift
//  iExpense
//
//  Created by Garret Poole on 3/7/22.
//

import SwiftUI

struct User: Codable {
    let firstName : String
    let lastName : String
}

struct ContentView: View {
    @State private var user = User(firstName: "Tide", lastName: "Poole")
    var body: some View {
        Button("Save User"){
            //use JSONDecoder when trying to convert json data to Swift codable type
            let encoder = JSONEncoder()
            //data is a Data datatype designed to store any data
            if let data = try? encoder.encode(user){
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
