//
//  ContentView.swift
//  iExpense
//
//  Created by Garret Poole on 3/7/22.
//

import SwiftUI
//must use class over structs if data is between multiple views
class User : ObservableObject {
    @Published var firstname = "Bilbo"
    @Published var lastname = "Baggins"
}

struct ContentView: View {
    //@State is for local struct changes only
    //@StateObject is for any change announcements
    //once created with @StateObject, use @ObservedObject everywhere else
    @StateObject var user = User()
    
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
