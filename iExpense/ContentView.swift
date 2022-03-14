//
//  ContentView.swift
//  iExpense
//
//  Created by Garret Poole on 3/7/22.
//

import SwiftUI


struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    @State private var amountColor = Color.green
    
    var dollarFormat: FloatingPointFormatStyle<Double>.Currency{
        //Locale is struct that gets area of user from iOS settings
        let currencyCode = Locale.current.currencyCode ?? "USD"
        return FloatingPointFormatStyle<Double>.Currency(code: currencyCode)
    }
    
    var body: some View {
        NavigationView{
            List{
                Section("Personal"){
                    ForEach(expenses.personalExpenses) { item in
                            HStack{
                                VStack(alignment: .leading){
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.description)
                                }
                                Spacer()
                                Text(item.amount, format: dollarFormat)
                                    .foregroundColor(item.amount > 100 ? Color.red : (item.amount > 10 ? Color.orange: Color.green))
                            }
                    }
                    .onDelete(perform: removeItems)
                }
                Section("Business"){
                    ForEach(expenses.businessExpenses) { item in
                            HStack{
                                VStack(alignment: .leading){
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.description)
                                }
                                Spacer()
                                Text(item.amount, format: dollarFormat)
                                    .foregroundColor(item.amount > 100 ? Color.red : (item.amount > 10 ? Color.orange: Color.green))
                            }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
