//
//  RestingStopWatch.swift
//  Watch App WatchKit Extension
//
//  Created by Gioele on 08/09/21.
//

import Foundation

class RestingStopWatch: ObservableObject {
    @Published var secondsElapsed: Int = 0
    var timer = Timer()
    
    var disaplyedTimer: String {
        return String(secondsElapsed)
    }
    
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {timer in
            self.secondsElapsed += 1
        }
    }
}
