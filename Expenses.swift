//
//  Expenses.swift
//  iExpense
//
//  Created by Garret Poole on 3/9/22.
//

import Foundation
//add codable, user defaults, custom initializer, did set prop observer
class Expenses: ObservableObject{
    @Published var items = [ExpenseItem]() {
        didSet{
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    var personalExpenses: [ExpenseItem]{
        items.filter{
            $0.type == "Personal"
        }
    }
    
    var businessExpenses: [ExpenseItem]{
        items.filter{
            $0.type == "Business"
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            //refer to array of ExpenseItem itself as a type
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
