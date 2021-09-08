//
//  StopWatch.swift
//  Watch App WatchKit Extension
//
//  Created by Gioele on 07/09/21.
//

import Foundation

class StopWatch: ObservableObject {
    @Published var secondsElapsed = 0.0
    var timer = Timer()
    
    var secondsDisplay: String {
        return String(Int(secondsElapsed))
    }
    
    var completeDisplay: String {
        let decimals = Int(secondsElapsed.truncatingRemainder(dividingBy: 1) * 10)
        let seconds = Int(secondsElapsed) % 60
        let minutes = Int(secondsElapsed / 60) % 60
        let hours = Int(secondsElapsed / 3600)
        
        return String(format: "%02d:%02d:%02d.%d", hours, minutes, seconds, decimals)
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {timer in
            self.secondsElapsed += 0.1
        }
    }
    
    func stop() {
        timer.invalidate()
        secondsElapsed = 0
    }
}
