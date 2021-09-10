//
//  RestingScreen.swift
//  Watch App WatchKit Extension
//
//  Created by Gioele on 06/09/21.
//

import SwiftUI

struct RestingScreen: View {
    
    @ObservedObject var stopwatch: StopWatch = StopWatch()
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text(stopwatch.secondsDisplay).font(.largeTitle)
                Text("seconds").font(.caption2)
            }
            
                .navigationTitle("Resting")
        }.onAppear {
            stopwatch.start()
        }
    }
}

struct RestingScreen_Previews: PreviewProvider {
    static var previews: some View {
        RestingScreen()
    }
}
