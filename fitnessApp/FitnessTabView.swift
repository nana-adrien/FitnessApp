//
//  FitnessTabView.swift
//  fitnessApp
//
//  Created by Digiprem on 08/10/2026.
//

import SwiftUI

struct FitnessTabView: View {
	@State var selectedTab = "Home"
	
	init () {
		let apparance=UITabBarAppearance()
		apparance.configureWithOpaqueBackground()
		apparance.stackedLayoutAppearance.selected.iconColor = .green
		apparance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
		UITabBar.appearance().scrollEdgeAppearance = apparance
	}
	
	var body: some View {
		TabView(selection: $selectedTab) {
			HomeView()
				.tag("Home")
				.tabItem {
					Image(systemName: "house.fill")
					Text("Home")
					}
			HistoricDataView()
				.tag("Historic")
				.tabItem {
					Image(systemName: "chart.line.uptrend.xyaxis")
					Text("Charts")
				}
		}
	}
}

struct Fitness_Previes: PreviewProvider {
	static var previews: some View {
		FitnessTabView()
	}
}
