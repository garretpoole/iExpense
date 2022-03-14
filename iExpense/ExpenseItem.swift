//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Garret Poole on 3/9/22.
//

import Foundation
//for identifiable, need id prop with UUID()
struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let description: String
    let amount: Double
}
