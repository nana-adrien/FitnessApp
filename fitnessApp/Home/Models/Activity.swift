//
//  Activity.swift
//  fitnessApp
//
//  Created by Digiprem on 08/10/2026.
//

import SwiftUI

struct Activity: Identifiable {
	var id:UUID = UUID()
	let title:String
	let subtitle:String
	let image:String
	let tintColor:Color
	let amount: String
}
