//
//  WorkoutCard.swift
//  fitnessApp
//
//  Created by Digiprem on 08/10/2026.
//

import SwiftUI



struct WorkoutCard: View {
	@State var  workout: Workout
    var body: some View {
		HStack{
			Image(systemName: workout.image)
				.resizable()
				.scaledToFit()
				.frame(width: 48,height: 48)
				.foregroundColor(workout.tintColor)
				.padding()
				.background(.gray.opacity(0.1))
				.cornerRadius(10)
			
			VStack(alignment: .leading){
		
				HStack{
					Text(workout.title)
						.font(.title3)
						.bold()
					Spacer()
					Text(workout.duration)
				}
				HStack{
					Text(workout.date)
					Spacer()
					Text(workout.calories)
				}
				
			}
		}
    }
}

#Preview {
    WorkoutCard(
		workout: Workout(id: 0, title: "Running", image: "figure.run", tintColor: .green, duration: "23 mins", date: "Aug 3", calories: "432 kcal")
	)
}
