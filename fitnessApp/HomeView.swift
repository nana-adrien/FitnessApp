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
	
    var body: some View {
		ScrollView(showsIndicators: false){
			VStack{
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
			}
			
		}
    }
}

#Preview {
    HomeView()
}
