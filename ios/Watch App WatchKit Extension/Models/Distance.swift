//
//  Distance.swift
//  Watch App WatchKit Extension
//
//  Created by Gioele on 06/09/21.
//

import Foundation

enum Distances: String, CaseIterable, Identifiable {
    case olimpic
    case ironman
    case ironman703


    var id: String { self.rawValue }
}
