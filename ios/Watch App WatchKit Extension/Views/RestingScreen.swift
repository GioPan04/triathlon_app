//
//  RestingScreen.swift
//  Watch App WatchKit Extension
//
//  Created by Gioele on 06/09/21.
//

import SwiftUI

struct RestingScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("5").font(.largeTitle)
                Text("seconds remaning").font(.caption2)
            }
            
                .navigationTitle("Resting")
        }
    }
}

struct RestingScreen_Previews: PreviewProvider {
    static var previews: some View {
        RestingScreen()
    }
}
