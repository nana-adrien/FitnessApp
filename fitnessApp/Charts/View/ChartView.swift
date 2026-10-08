//
//  ChartView.swift
//  fitnessApp
//
//  Created by Digiprem on 08/10/2026.
//

import SwiftUI
import Charts
import Combine


struct DailyStepModel : Identifiable{
	let id = UUID()
	let date: Date
	let count : Double
}



class ChartViewModel: ObservableObject{
	
	var mockChartData = [
		DailyStepModel(date: Date(), count: 12345),
		DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), count: 1345),
		DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), count: 10234),
		DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), count: 12450),
		DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), count: 12359),
		DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), count: 123405),
		DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -6, to: Date()) ?? Date(), count: 14005),
	]
	
	@Published var mockOneWeekData: [DailyStepModel] = []
	@Published var mockOneMonthData: [DailyStepModel] = []
	@Published var mockThreeMonthData: [DailyStepModel] = []

	
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

enum ChartOptions: String, CaseIterable{
	case oneWeek = "1W"
	case oneMonth = "1M"
	case threeWeek = "3M"
	case yearToDate = "YTD"
	case oneYear = "1Y"
}

struct ChartView: View {
	@StateObject var viewModel = ChartViewModel()
	@State var selectedChart:ChartOptions = .oneWeek
    var body: some View {
		VStack{
			Text("Charts")
				.font(.largeTitle)
				.bold()
				.padding()
			
			ZStack{
				
				switch selectedChart {
				case .oneMonth:
					Chart{
						ForEach(viewModel.mockOneMonthData){data in
							BarMark(
								x: .value(data.date.formatted(), data.date,unit: .day),
								y: .value("Steps", data.count)
							)
						}
					}
				case .oneWeek:
					Chart{
						ForEach(viewModel.mockOneWeekData){data in
							BarMark(
								x: .value(data.date.formatted(), data.date,unit: .day),
								y: .value("Steps", data.count)
							)
						}
					}
				case .threeWeek:
					Chart{
						ForEach(viewModel.mockThreeMonthData){data in
							BarMark(
								x: .value(data.date.formatted(), data.date,unit: .day),
								y: .value("Steps", data.count)
							)
						}
					}
				case .yearToDate:
					EmptyView()
				case .oneYear:
					EmptyView()
				}
			}
			.foregroundColor(.green)
			.frame(maxHeight:350)
			.padding(.horizontal)
			HStack{
				ForEach(ChartOptions.allCases,id:\.rawValue){ option in
					Button(option.rawValue) {
						withAnimation{
							selectedChart=option
						}
					}
					.padding()
					.foregroundColor(selectedChart == option ? .white : .green)
					.background(selectedChart == option ? .green : .clear)
					.cornerRadius(10)
				}
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)

		
    }
}

#Preview {
    ChartView()
}
