//
//  ChartViewModel.swift
//  fitnessApp
//
//  Created by Digiprem on 09/10/2026.
//

import Combine
import SwiftUI
import Foundation


class ChartViewModel: ObservableObject{
	 
	
	static var shared = ChartViewModel()
	
	
	var mockWeekChartData:[DailyStepModel] =  [
		DailyStepModel(date: Date(), count: 12345),
		DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), count: 1345),
		DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), count: 10234),
		DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), count: 12450),
		DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), count: 12359),
		DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), count: 123405),
		DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -6, to: Date()) ?? Date(), count: 14005),
	]
	 var mockChartData :[MonthlyStepModel] = [
		MonthlyStepModel(date: Date(), count: 12345),
		MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date(), count: 1345),
		MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -2, to: Date()) ?? Date(), count: 10234),
		MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -3, to: Date()) ?? Date(), count: 12450),
	]
	 var mockYTDChartData :[MonthlyStepModel] = [
		MonthlyStepModel(date: Date(), count: 12345),
		MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date(), count: 1345),
		MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -2, to: Date()) ?? Date(), count: 10234),
		MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -3, to: Date()) ?? Date(), count: 13450),
		MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -4, to: Date()) ?? Date(), count: 12350),
		MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -5, to: Date()) ?? Date(), count: 14450),
		MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -6, to: Date()) ?? Date(), count: 12250),
		MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -7, to: Date()) ?? Date(), count: 12460),
	]
	
	
	@Published var mockOneWeekData = [DailyStepModel] ()
	@Published var oneWeekAverage = 1234
	@Published var oneWeekTotal = 123
	
	@Published var mockOneMonthData = [DailyStepModel] ()
	@Published var oneMonthAverage = 12345
	@Published var oneMonthTotal = 234
	
	@Published var mockThreeMonthData = [DailyStepModel] ()
	@Published var threeMonthAverage = 122
	@Published var threeMonthTotal = 121
	
	@Published var ytdAverage = 44
	@Published var ytdTotal = 666
	
	@Published var oneYearAverage = 0
	@Published var oneYearTotal = 0
	
	
	
	
	init(){
		var mockOneWeekData = mockDataFor(days: 7)
		var mockOneMonthData = mockDataFor(days: 30)
		var mockThreeMonthData = mockDataFor(days: 90)
		DispatchQueue.main.async {
			self.mockOneWeekData = mockOneWeekData
			self.mockOneMonthData = mockOneMonthData
			self.mockThreeMonthData = mockThreeMonthData
		}
	}
	
	func mockDataFor(days:Int)->[DailyStepModel]{
		var moockData = [DailyStepModel]()

		for day in 0..<days{
			let currentDate = Calendar.current.date(byAdding: .day, value: -day, to: Date()) ?? Date()
			let randomStepCount = Int.random(in: 5000...15000)
			let dailyStepData = DailyStepModel(date: currentDate, count: Double(randomStepCount))
			moockData.append(dailyStepData)
		}
		
		return moockData
	}
}
