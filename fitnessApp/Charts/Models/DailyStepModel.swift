//
//  DailyStepModel.swift
//  fitnessApp
//
//  Created by Digiprem on 09/10/2026.
//

import Foundation
 
struct DailyStepModel : Identifiable{
	let id = UUID()
	let date: Date
	let count : Double
}
