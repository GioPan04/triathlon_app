//
//  ContentView.swift
//  Watch App WatchKit Extension
//
//  Created by Gioele on 06/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedDistance = Distances.olimpic
    
    @StateObject var workoutManager = WorkoutManager()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select a distance", selection: $selectedDistance) {
                    Text("Olimpic").tag(Distances.olimpic)
                    Text("Ironmain").tag(Distances.ironman)
                    Text("Ironman 70.3").tag(Distances.ironman703)
                }
                NavigationLink(destination: ActivityScreen().environmentObject(workoutManager), label: {
                    Text("Start")
                })
            }
        }.onAppear {
            workoutManager.requestAuthorization()
        }.environmentObject(workoutManager)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(WorkoutManager())
    }
}
