//
//  ContentView.swift
//  iExpense
//
//  Created by Garret Poole on 3/7/22.
//

import SwiftUI
//must use class over structs if data is between multiple views
class User{
    var firstname = "Bilbo"
    var lastname = "Baggins"
}

struct ContentView: View {
    //@state doesnt see change bc it doesnt watch value inside class (just class itself)
    @State private var user = User()
    
    var body: some View {
        VStack{
            Text("Your name is \(user.firstname) \(user.lastname)")
            TextField("First Name", text: $user.firstname)
            TextField("Last Name", text: $user.lastname)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
