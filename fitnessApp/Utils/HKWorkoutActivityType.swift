//
//  HKWorkoutActivityType.swift
//  fitnessApp
//
//  Created by Digiprem on 08/10/2026.
//

import HealthKit
import SwiftUI
extension HKWorkoutActivityType {
	var displayName: String {
		switch self {
		case .americanFootball: return "American Football"
		case .archery:          return "Archery"
		case .australianFootball: return "Australian Football"
		case .badminton:        return "Badminton"
		case .baseball:         return "Baseball"
		case .basketball:       return "Basketball"
		case .bowling:          return "Bowling"
		case .boxing:           return "Boxing"
		case .climbing:         return "Climbing"
		case .cricket:          return "Cricket"
		case .crossTraining:    return "Cross Training"
		case .curling:          return "Curling"
		case .cycling:          return "Cycling"
		case .dance:            return "Dance"
		case .elliptical:       return "Elliptical"
		case .equestrianSports: return "Equestrian Sports"
		case .fencing:          return "Fencing"
		case .fishing:          return "Fishing"
		case .functionalStrengthTraining: return "Functional Strength Training"
		case .golf:             return "Golf"
		case .gymnastics:       return "Gymnastics"
		case .handball:         return "Handball"
		case .hiking:           return "Hiking"
		case .hockey:           return "Hockey"
		case .hunting:          return "Hunting"
		case .lacrosse:         return "Lacrosse"
		case .martialArts:      return "Martial Arts"
		case .mindAndBody:         return "Mind Body"
		case .mixedCardio:      return "Mixed Cardio"
		case .paddleSports:     return "Paddle Sports"
		case .play:             return "Play"
		case .preparationAndRecovery: return "Preparation and Recovery"
		case .racquetball:      return "Racquetball"
		case .rowing:           return "Rowing"
		case .rugby:            return "Rugby"
		case .running:          return "Running"
		case .sailing:          return "Sailing"
		case .skatingSports:    return "Skating Sports"
		case .snowSports:       return "Snow Sports"
		case .soccer:           return "Soccer"
		case .softball:         return "Softball"
		case .squash:           return "Squash"
		case .stairClimbing:    return "Stair Climbing"
		case .surfingSports:    return "Surfing Sports"
		case .swimming:         return "Swimming"
		case .tableTennis:      return "Table Tennis"
		case .tennis:           return "Tennis"
		case .trackAndField:    return "Track and Field"
		case .traditionalStrengthTraining: return "Traditional Strength Training"
		case .volleyball:       return "Volleyball"
		case .walking:          return "Walking"
		case .waterFitness:     return "Water Fitness"
		case .waterPolo:        return "Water Polo"
		case .waterSports:      return "Water Sports"
		case .wrestling:        return "Wrestling"
		case .yoga:             return "Yoga"
			
			// iOS 10+ / iOS 11+ / iOS 13+ Additions
		case .barre:            return "Barre"
		case .coreTraining:     return "Core Training"
		case .crossCountrySkiing: return "Cross Country Skiing"
		case .downhillSkiing:   return "Downhill Skiing"
		case .flexibility:      return "Flexibility"
		case .highIntensityIntervalTraining: return "HIIT"
		case .jumpRope:         return "Jump Rope"
		case .kickboxing:       return "Kickboxing"
		case .pilates:          return "Pilates"
		case .snowboarding:     return "Snowboarding"
		case .stairs:           return "Stairs"
		case .stepTraining:     return "Step Training"
		case .wheelchairWalkPace: return "Wheelchair Walk Pace"
		case .wheelchairRunPace:  return "Wheelchair Run Pace"
			
			// iOS 14+ / iOS 16+ Additions
		case .cooldown:         return "Cooldown"
		case .fitnessGaming:    return "Fitness Gaming"
		case .pickleball:       return "Pickleball"
		case .socialDance:      return "Social Dance"
		case .swimBikeRun:      return "Duathlon/Triathlon"
		case .underwaterDiving: return "Underwater Diving"
			
		case .other:            return "Other Workout"
		@unknown default:       return "Unknown Workout"
		}
	}
	
	// MARK: - Couleur associée
	var associatedColor: Color {
		switch self {
			// 🚴‍♂️ SPORTS D'ENDURANCE / CARDIO EXTÉRIEUR (Vert)
		case .cycling, .running, .walking, .hiking, .trackAndField,
				.wheelchairWalkPace, .wheelchairRunPace:
			return .green
			
			// 🏊‍♂️ SPORTS AQUATIQUES (Bleu)
		case .swimming, .waterFitness, .waterPolo, .waterSports,
				.sailing, .surfingSports, .underwaterDiving:
			return .blue
			
			// 🏀 SPORTS D'ÉQUIPE (Orange)
		case .americanFootball, .australianFootball, .baseball, .basketball,
				.cricket, .handball, .hockey, .lacrosse, .rugby, .soccer,
				.softball, .volleyball:
			return .orange
			
			// 🏸 SPORTS DE RAQUETTE (Jaune)
		case .badminton, .pickleball, .racquetball, .squash, .tableTennis, .tennis:
			return .yellow
			
			// 🧘‍♂️ BIEN-ÊTRE & SOUPLESSE (Turquoise / Teal)
		case .yoga, .mindAndBody, .pilates, .barre, .flexibility, .cooldown:
			return .teal
			
			// 🏋️‍♂️ MUSCULATION & CARDIO INTENSE (Rouge)
		case .traditionalStrengthTraining, .functionalStrengthTraining,
				.crossTraining, .highIntensityIntervalTraining, .coreTraining,
				.stepTraining, .stairClimbing, .stairs, .jumpRope, .elliptical:
			return .red
			
			// 🥊 SPORTS DE COMBAT (Rouge Sombre)
		case .boxing, .kickboxing, .martialArts, .wrestling, .fencing:
			return Color(red: 0.8, green: 0.1, blue: 0.1)
			
			// ❄️ SPORTS D'HIVER (Cyan)
		case .crossCountrySkiing, .downhillSkiing, .snowboarding, .snowSports, .curling:
			return .cyan
			
			// 💃 DANSE & RYTHME (Rose)
		case .dance, .socialDance, .gymnastics, .fitnessGaming:
			return .pink
			
			// 🎯 PRÉCISION, LOISIRS & GLISSE (Indigo)
		case .archery, .bowling, .golf, .climbing, .equestrianSports, .fishing,
				.hunting, .paddleSports, .rowing, .play:
			return .indigo
			
			// 🏁 MULTISPORT / PERFORMANCE (Violet)
		case .swimBikeRun, .preparationAndRecovery:
			return .purple
			
		case .other:
			return .gray
		@unknown default:
			return .gray
		}
	}
	
	// MARK: - Image Système (SF Symbol)
	var systemImageName: String {
		switch self {
		case .americanFootball:             return "football.fill"
		case .archery:                      return "target"
		case .australianFootball:           return "football"
		case .badminton:                    return "tennisball.fill" // SF Symbol n'a pas de volant spécifique, tennisball fait l'affaire
		case .baseball:                     return "baseball.fill"
		case .basketball:                   return "basketball.fill"
		case .bowling:                      return "bowling.ball.fill"
		case .boxing:                       return "glove.fill"
		case .climbing:                     return "figure.climbing"
		case .cricket:                      return "cricket.ball.fill"
		case .crossTraining:                return "figure.cross.training"
		case .curling:                      return "curling.stone.fill"
		case .cycling:                      return "figure.outdoor.cycle"
		case .dance, .socialDance:          return "figure.dance"
		case .elliptical:                   return "figure.elliptical"
		case .equestrianSports:             return "figure.equestrian.sports"
		case .fencing:                      return "figure.fencing"
		case .fishing:                      return "fish.fill"
		case .functionalStrengthTraining:   return "figure.functional.strength.training"
		case .golf:                         return "figure.golf"
		case .gymnastics:                   return "figure.gymnastics"
		case .handball:                     return "figure.handball"
		case .hiking:                       return "figure.hiking"
		case .hockey:                       return "figure.hockey"
		case .hunting:                      return "scope"
		case .lacrosse:                     return "figure.lacrosse"
		case .martialArts, .kickboxing:     return "figure.kickboxing"
		case .mindAndBody, .yoga:           return "figure.yoga"
		case .mixedCardio:                  return "figure.mixed.cardio"
		case .paddleSports:                 return "figure.cooldown"
		case .play:                         return "figure.play"
		case .preparationAndRecovery:       return "heart.text.square.fill"
		case .racquetball, .squash:         return "figure.squash"
		case .rowing:                       return "figure.rowing"
		case .rugby:                        return "rugbyball.fill"
		case .running:                      return "figure.run"
		case .sailing:                      return "sailing.fill"
		case .skatingSports:                return "figure.skating"
		case .snowSports, .downhillSkiing: return "figure.downhill.skiing"
		case .crossCountrySkiing:           return "figure.cross.country.skiing"
		case .snowboarding:                 return "figure.snowboarding"
		case .soccer:                       return "soccerball"
		case .softball:                     return "softball.fill"
		case .stairClimbing, .stairs, .stepTraining: return "figure.stair.stepper"
		case .surfingSports:                return "figure.surfing"
		case .swimming:                     return "figure.pool.swim"
		case .tableTennis:                  return "table.tennis.view.topdown"
		case .tennis:                       return "figure.tennis"
		case .trackAndField:                return "figure.track.and.field"
		case .traditionalStrengthTraining:  return "figure.strengthtraining.traditional"
		case .volleyball:                   return "figure.volleyball"
		case .walking:                      return "figure.walk"
		case .waterFitness:                 return "figure.water.fitness"
		case .waterPolo:                    return "figure.water.polo"
		case .waterSports:                  return "figure.water.object"
		case .wrestling:                    return "figure.wrestling"
		case .barre:                        return "figure.barre"
		case .coreTraining:                 return "figure.core.training"
		case .flexibility:                  return "figure.flexibility"
		case .highIntensityIntervalTraining: return "figure.highintensity.intervaltraining"
		case .jumpRope:                     return "figure.jumprope"
		case .pilates:                      return "figure.pilates"
		case .wheelchairWalkPace:           return "figure.roll.runningpace"
		case .wheelchairRunPace:            return "figure.roll"
		case .cooldown:                     return "figure.cooldown"
		case .fitnessGaming:                return "gamecontroller.fill"
		case .pickleball:                   return "pickleball.fill"
		case .swimBikeRun:                  return "figure.triathlon"
		case .underwaterDiving:             return "figure.open.water.swim"
			
		case .other:                        return "sportscourt.fill"
		@unknown default:                   return "questionmark.circle.fill"
		}
	}
}

// Usage:
let activityType: HKWorkoutActivityType = .highIntensityIntervalTraining
