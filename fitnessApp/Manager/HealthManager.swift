//
//  HealthManager.swift
//  fitnessApp
//
//  Created by Digiprem on 08/10/2026.
//

import Foundation
import HealthKit
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
		
		let healthTypes:Set = [calories,exercise,stand]
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
		let exercice = HKQuantityType( .activeEnergyBurned)
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
		let stand = HKQuantityType( .activeEnergyBurned)
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
}
