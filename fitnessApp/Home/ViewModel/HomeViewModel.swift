//
//  HomeViewModel.swift
//  fitnessApp
//
//  Created by Digiprem on 08/10/2026.
//
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
	
	 var calories:Int = 123
	 var active:Int = 600
	 var stand:Int = 400
	
	var mockActivities=[
		Activity(id: 0, title: "Today steps",
				 subtitle: "Goal 12,000",
				 image: "figure.walk", tintColor: .green, amount: "9,212"),
		Activity(id: 1, title: "Today steps",
				 subtitle: "Goal 12,000",
				 image: "figure.walk", tintColor: .red, amount: "812")
		,
		Activity(id: 2, title: "Today steps",
				 subtitle: "Goal 12,000",
				 image: "figure.walk", tintColor: .blue, amount: "9,212")
		,
		Activity(id: 3, title: "Today steps",
				 subtitle: "Goal 12,000",
				 image: "figure.run", tintColor: .cyan, amount: "55,812")
		,
	]
	var mockWorkouts=[
		Workout(id: 0, title: "Running", image: "figure.run", tintColor: .green, duration: "23 mins", date: "Aug 1", calories: "432 kcal"),
		Workout(id: 1, title: "Strength training", image: "figure.walk", tintColor: .red, duration: "23 mins", date: "Aug 1", calories: "500 kcal"),
		Workout(id: 2, title: "walk", image: "figure.run", tintColor: .blue, duration: "23 mins", date: "Aug 11", calories: "345 kcal"),
		Workout(id: 3, title: "Running", image: "figure.run", tintColor: .green, duration: "1 mins", date: "Aug 19", calories: "432 kcal"),
	]
	
	
}
