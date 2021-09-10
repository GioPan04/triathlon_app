//
//  ActivityScreen.swift
//  Watch App WatchKit Extension
//
//  Created by Gioele on 06/09/21.
//

import SwiftUI
import HealthKit

struct ActivityScreen: View {
    
    @EnvironmentObject var workoutManager: WorkoutManager
    
    var body: some View {
        NavigationView {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(String(format: "%.2f bpm", workoutManager.heartRate))
                        .font(.title2)
                    Text(String(format: "%.2f m", workoutManager.distance))
                        .font(.title3)
                    Text(String(format: "%.2f m/s", workoutManager.speed))
                        .font(.caption)
                    Spacer()
                    NavigationLink(
                        destination: RestingScreen(),
                        label: {
                            Text("Finish")
                        })
 
                }
                Spacer()
            }
                .navigationTitle("Swimming")
        }.onAppear {
            workoutManager.selectedWorkout = HKWorkoutActivityType.running
        }.onDisappear {
            workoutManager.endWorkout()
        }.padding()
    }
}

struct ActivityScreen_Previews: PreviewProvider {
    static var previews: some View {
        ActivityScreen().environmentObject(WorkoutManager())
    }
}
