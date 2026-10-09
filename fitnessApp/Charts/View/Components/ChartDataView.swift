//
//  ChartDataView.swift
//  fitnessApp
//
//  Created by Digiprem on 09/10/2026.
//

import SwiftUI

struct ChartDataView: View {
	
	let average: Int
	let total : Int
	
    var body: some View {
		HStack{
			Spacer()
			VStack{
				
				Text("Average")
					.font(.title2)
				Text("\(average)")
					.font(.title3)
			}
			.frame(width: 90)
			.foregroundColor(.black)
			.padding()
			.background(.gray.opacity(0.7))
			.cornerRadius(10)
			
			Spacer()
			
			VStack{
				Text("Total")
					.font(.title2)
				Text("\(total)")
					.font(.title3)
			}
			.frame(width: 90)
			.foregroundColor(.black)
			.padding()
			.background(.gray.opacity(0.7))
			.cornerRadius(10)
			
			Spacer()
		}
		
    }
}

#Preview {
    ChartDataView(
		average: 100, total: 100
	)
}
