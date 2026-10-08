//
//  HomeViewModel.swift
//  fitnessApp
//
//  Created by Digiprem on 08/10/2026.
//
import SwiftUI
import Combine
import HealthKit



class HomeViewModel: ObservableObject {
	let healthManger = HealthManager.shared
	
	@Published var calories:Int = 0
	@Published var exercise:Int = 600
	@Published var standTime:Int = 400
	@Published var activities = [Activity]()
	@Published var workouts = [Workout]()
	
	var mockActivities=[
		Activity( title: "Today steps",
				 subtitle: "Goal 12,000",
				 image: "figure.walk", tintColor: .green, amount: "9,212"),
		Activity( title: "Today steps",
				 subtitle: "Goal 12,000",
				 image: "figure.walk", tintColor: .red, amount: "812")
		,
		Activity( title: "Today steps",
				 subtitle: "Goal 12,000",
				 image: "figure.walk", tintColor: .blue, amount: "9,212")
		,
		Activity( title: "Today steps",
				 subtitle: "Goal 12,000",
				 image: "figure.run", tintColor: .cyan, amount: "55,812")
		,
	]
	var mockWorkouts=[
		Workout( title: "Running", image: "figure.run", tintColor: .green, duration: "23 mins", date: "Aug 1", calories: "432 kcal"),
		Workout( title: "Strength training", image: "figure.walk", tintColor: .red, duration: "23 mins", date: "Aug 1", calories: "500 kcal"),
		Workout( title: "walk", image: "figure.run", tintColor: .blue, duration: "23 mins", date: "Aug 11", calories: "345 kcal"),
		Workout( title: "Running", image: "figure.run", tintColor: .green, duration: "1 mins", date: "Aug 19", calories: "432 kcal"),
	]
	
	
	init(){
		Task{
			do{
				try await healthManger.requestHealthKitAccess()
				fetchCurrentWeekActivities()
				fetchTodayCalories()
				fetchTodayExerciceTime()
				fetchTodayStandHours()
				fetchTodaySteps()
			} catch{
				print(error.localizedDescription)
			}
		}
		
	}
	
	
	func fetchTodayCalories(){
		healthManger.fechTodayCaloriesBurned { (result) in
			switch result {
			case .success( let calories):
				DispatchQueue.main.async {
					self.calories = Int(calories)
					let activity = Activity(
						id: UUID(),
						title: "Calories Burned",
						subtitle: "today",
						image: "flame",
						tintColor: .red,
						amount: calories.formattedNumberToString()
					)
					self.activities.append(activity)
				}
			case .failure(let failure):
				print(failure.localizedDescription)
				
			}
		}
	}
	func fetchTodayExerciceTime(){
		
		healthManger.fechTodayStandTime { (result) in
			switch result {
			case .success( let exercise):
				DispatchQueue.main.async {
					self.exercise = Int(exercise)
				}
			case .failure(let failure):
				print(failure.localizedDescription)
				
			}
		}
	}
	func fetchTodayStandHours(){
		
		healthManger.fechTodayStandTime { (result) in
			switch result {
			case .success( let hours):
				DispatchQueue.main.async {
					self.standTime = hours
				}
			case .failure(let failure):
				print(failure.localizedDescription)
				
			}
		}
	}
	
	// MARK : Fitness Activities
	
	func fetchTodaySteps(){
		healthManger.fetchTodaySteps { (result) in
			switch result {
			case .success(let activity):
				DispatchQueue.main.async {
					self.activities.append(activity)
				}
			case .failure(let failure):
				print(failure)
				
			}
		}
		
	}
	
	func fetchCurrentWeekActivities(){
		healthManger.fetchCurrentWeekWorkoutStats { (result) in
			switch result {
			case .success(let activities):
				DispatchQueue.main.async {
					self.activities.append(contentsOf: activities)
				}
			case .failure(let failure):
				print(failure)
				
			}
		}
	}
	
	func fetchRecentWorkouts(){
		healthManger.fetchWorkoutsForMonth(month:Date()) { (result) in
			switch result {
			case .success(let workouts):
				DispatchQueue.main.async {
					self.workouts = Array(workouts.prefix(4))
				}
			case .failure(let failure):
				print(failure)
			}
		}
	}
}
