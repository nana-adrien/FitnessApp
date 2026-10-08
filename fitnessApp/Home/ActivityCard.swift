//
//  ActivityCard.swift
//  fitnessApp
//
//  Created by Digiprem on 08/10/2026.
//

import SwiftUI


struct Activity: Identifiable {
	let id:Int
	let title:String
	let subtitle:String
	let image:String
	let tintColor:Color
	let amount: String
}

struct ActivityCard: View {
	@State var activity :Activity
    var body: some View {
		ZStack{
			Color(uiColor: .systemGray6)
				.cornerRadius(15)
			
			VStack{
				HStack(alignment: .top){
		
					VStack{
						Text(activity.title)
						Text(activity.subtitle)
							.font(.caption)
					}
					Spacer()
					
					Image(systemName: activity.image)
						.foregroundColor(activity.tintColor)
					
				}
				Text(activity.amount)
					.font(.title)
					.bold()
					.padding()
				
			}
			.padding()
		}
    }
}

#Preview {
    ActivityCard(
		activity: Activity(id: 0, title: "Today steps",
						   subtitle: "Goal 12,000",
						   image: "figure.walk", tintColor: .green, amount: "6,212")
	)
}
