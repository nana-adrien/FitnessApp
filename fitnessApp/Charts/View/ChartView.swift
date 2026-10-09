//
//  ChartView.swift
//  fitnessApp
//
//  Created by Digiprem on 08/10/2026.
//

import SwiftUI
import Charts
import Combine



struct ChartView: View {
	@StateObject var viewModel = ChartViewModel.shared
	@State var selectedChart:ChartOptions = .oneWeek
    var body: some View {
		VStack{
			Text("Charts")
				.font(.largeTitle)
				.bold()
				.frame(maxWidth: .infinity,alignment: .leading)
				.padding()
			
			ZStack{
				
				switch selectedChart {
				case .oneMonth:
					
					VStack{
						ChartDataView(
							average: viewModel.oneMonthAverage,
							total: viewModel.oneMonthTotal
						)
						Chart{
							ForEach(viewModel.mockOneMonthData){data in
								BarMark(
									x: .value(data.date.formatted(), data.date,unit: .day),
									y: .value("Steps", data.count)
								)
							}
						}
					}
				case .oneWeek:
					VStack{
						ChartDataView(
							average: viewModel.oneWeekAverage,
							total: viewModel.oneWeekTotal
						)
						Chart{
							ForEach(viewModel.mockOneWeekData){data in
								BarMark(
									x: .value(data.date.formatted(), data.date,unit: .day),
									y: .value("Steps", data.count)
								)
							}
						}
					}
				case .threeMonth:
					
					VStack{
						ChartDataView(
							average: viewModel.threeMonthAverage,
							total: viewModel.threeMonthTotal
						)
						Chart{
							ForEach(viewModel.mockThreeMonthData){data in
								LineMark(
									x: .value(data.date.formatted(), data.date,unit: .day),
									y: .value("Steps", data.count)
								)
							}
						}
					}
				case .yearToDate:
					
					VStack{
						ChartDataView(
							average: viewModel.ytdAverage,
							total: viewModel.ytdTotal
						)
						Chart{
							ForEach(viewModel.mockYTDChartData){data in
								BarMark(
									x: .value(data.date.formatted(), data.date,unit: .year),
									y: .value("Steps", data.count)
								)
							}
						}
					}
				case .oneYear:
					
					VStack{
						ChartDataView(
							average: viewModel.oneYearAverage,
							total: viewModel.oneYearTotal
						)
						Chart{
							ForEach(viewModel.mockOneWeekData){data in
								BarMark(
									x: .value(data.date.formatted(), data.date,unit: .day),
									y: .value("Steps", data.count)
								)
							}
						}
					}
				}
			}
			.foregroundColor(.green)
			.frame(maxHeight:450)
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
			
			Spacer()
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)


    }

}

#Preview {
    ChartView()
}
