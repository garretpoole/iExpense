//
//  AddView.swift
//  iExpense
//
//  Created by Garret Poole on 3/9/22.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "personal"
    @State private var description = ""
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var dollarFormat: FloatingPointFormatStyle<Double>.Currency{
        //Locale is struct that gets area of user from iOS settings
        let currencyCode = Locale.current.currencyCode ?? "USD"
        return FloatingPointFormatStyle<Double>.Currency(code: currencyCode)
    }
    
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Description", text: $description)
                TextField("Amount", value: $amount, format: dollarFormat)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                Button("Save"){
                    let item = ExpenseItem(name: name, type: type, description: description, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
