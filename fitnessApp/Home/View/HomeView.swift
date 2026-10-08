//
//  HomeView.swift
//  fitnessApp
//
//  Created by Digiprem on 08/10/2026.
//

import SwiftUI




struct HomeView: View {
	@StateObject var viewModel = HomeViewModel()
	
	
	
    var body: some View {
		NavigationStack {
			ScrollView(showsIndicators: false){
				VStack(alignment: .leading){
					Text("Welcome")
						.font(.largeTitle)
						.padding()
					
					HStack{
						Spacer()
						VStack{
							VStack(alignment: .leading,spacing: 8){
								Text("Calories")
									.font(.callout)
								Text("\(viewModel.calories) kcal")
									.font(.callout)
									.bold()
									.foregroundColor(Color.red)
							}
							.padding(.bottom)
							
							VStack(alignment: .leading,spacing: 8){
								Text("Active")
									.font(.callout)
								Text("\(viewModel.exercise) min")
									.font(.callout)
									.bold()
									.foregroundColor(Color.green)
							}.padding(.bottom)
							VStack(alignment: .leading,spacing: 8){
								Text("Stand")
									.font(.callout)
								Text("\(viewModel.standTime) hours")
									.font(.callout)
									.bold()
									.foregroundColor(Color.blue)
							}
						}
						
						Spacer()
						
						ZStack{
							ProgressCircleView(
								progress: $viewModel.calories,
								goal: 600,
								color: .red
							)
							
							ProgressCircleView(
								progress: $viewModel.exercise,
								goal: 600,
								color: .green
							)
							.padding(.all,20	)
							ProgressCircleView(
								progress: $viewModel.standTime,
								goal: 600,
								color: .blue
							)
							.padding(.all,40	)
							
							Spacer()
						}
						.padding()
						
						
					}
					HStack{
						Text("Fitness Activity")
							.font(.title2)
						
						Spacer()
						
						
						NavigationLink{
							EmptyView()
						} label: {
							Text("Show more")
								.padding(.all,10)
								.foregroundColor(.white)
								.background(.blue)
								.cornerRadius(20)
						}
						.padding(.horizontal)
					}.padding(.top)
					
					LazyVGrid(
						columns:Array(repeating: GridItem(spacing:20), count: 2),
					){
						ForEach(viewModel.mockActivities,id:\.id){activity in
							ActivityCard(
								activity: activity
							)
						}
						
					}
					HStack{
						Text("Fitness Activity")
							.font(.title2)
						
						Spacer()
						
						
						NavigationLink{
							EmptyView()
						} label: {
							Text("Show more")
								.padding(.all,10)
								.foregroundColor(.white)
								.background(.blue)
								.cornerRadius(20)
						}
						.padding(.horizontal)
					}.padding(.top)
					LazyVStack{
						ForEach(viewModel.mockWorkouts,id:\.id){workout in
							WorkoutCard(
								workout: workout
							)
						}
						
					}
				}.padding()
				
				
				
			}
		}
    }
}

#Preview {
    HomeView()
}
