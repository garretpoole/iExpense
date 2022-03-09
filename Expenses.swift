//
//  Expenses.swift
//  iExpense
//
//  Created by Garret Poole on 3/9/22.
//

import Foundation

class Expenses: ObservableObject{
    @Published var items = [ExpenseItem]()
}
