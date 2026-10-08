//
//  HomeView.swift
//  fitnessApp
//
//  Created by Digiprem on 08/10/2026.
//

import SwiftUI

struct HomeView: View {
	
	@State var calories:Int = 123
	@State var active:Int = 52
	@State var stand:Int = 8
	
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
	
    var body: some View {
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
							Text("123 kcal")
								.font(.callout)
								.bold()
								.foregroundColor(Color.red)
						}
						.padding(.bottom)
						
						VStack(alignment: .leading,spacing: 8){
							Text("Active")
								.font(.callout)
							Text("52 min")
								.font(.callout)
								.bold()
								.foregroundColor(Color.green)
						}.padding(.bottom)
						VStack(alignment: .leading,spacing: 8){
							Text("Stand")
								.font(.callout)
							Text("8 hours")
								.font(.callout)
								.bold()
								.foregroundColor(Color.blue)
						}
					}
					
					Spacer()
					
					ZStack{
						ProgressCircleView(
							progress: $calories,
							goal: 600,
							color: .red
						)
						
						ProgressCircleView(
							progress: $active,
							goal: 600,
							color: .green
						)
						.padding(.all,20	)
						ProgressCircleView(
							progress: $stand,
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
					
					Button{
						print("Show more")
					} label: {
						Text("Show more")
							.padding(.all,10)
							.foregroundColor(.white)
							.background(.blue)
							.cornerRadius(20)
					}
					.padding(.horizontal)
				}
				
				LazyVGrid(
					columns:Array(repeating: GridItem(spacing:20), count: 2),
				){
					ForEach(mockActivities,id:\.id){activity in
						ActivityCard(
							activity: activity
						)
					}
					
				}

			}.padding()
			
		}
    }
}

#Preview {
    HomeView()
}
