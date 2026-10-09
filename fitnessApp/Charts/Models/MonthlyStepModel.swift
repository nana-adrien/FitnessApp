//
//  MonthlyStepModel.swift
//  fitnessApp
//
//  Created by Digiprem on 09/10/2026.
//

import Foundation

struct MonthlyStepModel : Identifiable{
	let id = UUID()
	let date: Date
	let count : Int
}
