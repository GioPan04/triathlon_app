//
//  ActivityScreen.swift
//  Watch App WatchKit Extension
//
//  Created by Gioele on 06/09/21.
//

import SwiftUI

struct ActivityScreen: View {
    var body: some View {
        NavigationView {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("00:00.00")
                        .font(.title)
                    Text("500mt")
                        .font(.title2)
                    Spacer()
                }
                Spacer()
            }
                .navigationTitle("Swimming")
        }.padding()
    }
}

struct ActivityScreen_Previews: PreviewProvider {
    static var previews: some View {
        ActivityScreen()
    }
}
