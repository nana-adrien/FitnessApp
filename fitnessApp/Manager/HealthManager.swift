//
//  HealthManager.swift
//  fitnessApp
//
//  Created by Digiprem on 08/10/2026.
//

import Foundation
import HealthKit
import SwiftUI


extension Date{
	static var startOfDay:Date{
		let calendar = Calendar.current
		return calendar.startOfDay(for: Date())
	}
	
	
	static var startOfWeek:Date{
		let calendar = Calendar.current
		var components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from:Date())
		components.weekday = 2
		return calendar.date(from: components) ?? Date()
	}
}


extension Double{
	
	func formattedNumberToString()->String{
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.maximumFractionDigits = 0
		return formatter.string(from: NSNumber(value: self)) ?? "0"
	}
}


enum HealthError: Error {
	case requeteEchouee
}
class HealthManager{
	static let shared = HealthManager()
	
	let healthStore=HKHealthStore()
	
	private init(){
		Task{
			do{
				try await requestHealthKitAccess()
			} catch{
				print(error.localizedDescription)
			}
		}
	}
	func requestHealthKitAccess() async throws {
		let calories = HKQuantityType(.activeEnergyBurned)
		let exercise = HKQuantityType(.appleExerciseTime)
		let stand = HKQuantityType(.appleStandTime)
		let steps = HKQuantityType(.stepCount)
		let workout = HKObjectType.workoutType()
		
		let healthTypes:Set = [calories,exercise,stand,steps,workout]
		try await healthStore.requestAuthorization(toShare: [], read: healthTypes)

	}
	
	func fechTodayCaloriesBurned(completion: @escaping(Result<Double,HealthError>)->Void){
		let calories = HKQuantityType( .activeEnergyBurned)
		let predicate = HKQuery.predicateForSamples(withStart:.startOfDay, end: Date())
		let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate){_,results, error in
			
			
			guard let quantity = results?.sumQuantity(), error == nil else {
				completion(.failure(.requeteEchouee))
				return
			}
			
			let calorieCount=quantity.doubleValue(for: .kilocalorie())
			completion(.success(calorieCount))
		}
		
		healthStore.execute(query)
	}
	
	func fechTodayExerciseTime(completion: @escaping(Result<Double,HealthError>)->Void){
		let exercice = HKQuantityType( .appleExerciseTime)
		let predicate = HKQuery.predicateForSamples(withStart:.startOfDay, end: Date())
		let query = HKStatisticsQuery(quantityType: exercice, quantitySamplePredicate: predicate,options: .cumulativeSum){_,results, error in
			
			
			guard let quantity = results?.sumQuantity(), error == nil else {
				completion(.failure(.requeteEchouee))
				return
			}
			
			let exerciceTime=quantity.doubleValue(for: .minute())
			completion(.success(exerciceTime))
		}
		
		healthStore.execute(query)
	}
	
	func fechTodayStandTime(completion: @escaping(Result<Int,HealthError>)->Void){
		let stand = HKQuantityType( . appleStandTime)
		let predicate = HKQuery.predicateForSamples(withStart:.startOfDay, end: Date())
		let query = HKSampleQuery(sampleType: stand, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil){_,results,error in
			
			guard let samples = results as? [HKCategorySample], error == nil else {
				completion(.failure(.requeteEchouee))
				return
			}
			print(samples)
			print(samples.map({$0.value}))
			let standCount = samples.filter({$0.value == 0}).count
			completion(.success(standCount))
		}
		healthStore.execute(query)
	}
	
	
	// MARK: Fitness Activity
	
	func fetchTodaySteps(completion: @escaping(Result<Activity,HealthError>)->Void){
		
		let steps = HKQuantityType( .stepCount)
		let predicate = HKQuery.predicateForSamples(withStart:.startOfDay, end: Date())
		let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate,){_,results,error in
			
			guard let quantity = results?.sumQuantity(), error == nil else {
				completion(.failure(.requeteEchouee))
				return
			}
			let steps = quantity.doubleValue(for: .count())
			let activity = Activity(
				title: "Today Steps",
				subtitle: "Goal 800",
				image: "figure.walk",
				tintColor: .green,
				amount: steps.formattedNumberToString()
			)
			completion(.success(activity))
		}
		healthStore.execute(query)
	}
	
	
	func fetchCurrentWeekWorkoutStats(completion: @escaping(Result<[Activity],HealthError>)->Void){
		let workout	= HKSampleType.workoutType()
		let predicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
		let query = HKSampleQuery(sampleType: workout, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil){[weak self] _,results,error in
			
			
			guard let workouts = results as? [HKWorkout], let self=self, error == nil else {
				completion(.failure(.requeteEchouee))
				return
			}
			
			var runningCount:Int = 0
			var strengthCount:Int = 0
			var soccerCount:Int = 0
			var basketballCount:Int = 0
			var stairsCount:Int = 0
			var kickboxingCount:Int = 0
			
			for workout in workouts {
				let duration = Int(workout.duration)/60
				if workout.workoutActivityType == .running {
					runningCount += duration
				} else if workout.workoutActivityType == .traditionalStrengthTraining {
					strengthCount += duration
				} else if workout.workoutActivityType == .soccer {
					soccerCount += duration
				} else if workout.workoutActivityType == .baseball {
					basketballCount += duration
				} else if workout.workoutActivityType == .stairs {
					stairsCount += duration
				} else if workout.workoutActivityType == .kickboxing {
					kickboxingCount += duration
				}
				
			}
			
			completion(.success(generateActivitiesFromDurations(running: runningCount,
																strength: strengthCount,
																soccer: soccerCount,
																basketball: basketballCount,
																stairs: stairsCount,
																kickboxing: kickboxingCount)))

		}
		healthStore.execute(query)
	}
	
	func generateActivitiesFromDurations(running:Int,strength:Int,soccer:Int,basketball:Int,stairs:Int,kickboxing:Int)->[Activity]{
		return[
			Activity(
				title: "Running",
				subtitle: "This week",
				image: "figure.run",
				tintColor: .green,
				amount:"\(running) mins"
			),
			Activity(
				title: "Strength Training",
				subtitle: "This week",
				image: "dumbbell",
				tintColor: .blue,
				amount:"\(strength) mins"
		),
			Activity(
			title: "Soccer",
			subtitle: "This week",
			image: "figure.soccer",
			tintColor: .indigo,
			amount:"\(soccer) mins"
		),
			Activity(
			title: "Basketball",
			subtitle: "This week",
			image: "figure.basketball",
			tintColor: .green,
			amount:"\(basketball) mins"
		),
			Activity(
			title: "Stairstepper",
			subtitle: "This week",
			image: "figure.stairs",
			tintColor: .green,
			amount:"\(stairs) mins"
		),
			Activity(
			title: "Kickboxing",
			subtitle: "This week",
			image: "figure.kickboxing",
			tintColor: .green,
			amount:"\(kickboxing) mins"
		),
		
		]
		
	}
	
}
