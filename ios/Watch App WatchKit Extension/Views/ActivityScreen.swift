//
//  ActivityScreen.swift
//  Watch App WatchKit Extension
//
//  Created by Gioele on 06/09/21.
//

import SwiftUI

struct ActivityScreen: View {
    
    @ObservedObject var stopWatch = StopWatch()
    
    var body: some View {
        NavigationView {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(stopWatch.disaplyedTimer)
                        .font(.title2)
                    Text("500mt")
                        .font(.title3)
                    Text("10mt/s")
                        .font(.caption)
                    Spacer()
                }
                Spacer()
            }
                .navigationTitle("Swimming")
        }.onAppear {
            stopWatch.start()
        }.padding()
    }
}

struct ActivityScreen_Previews: PreviewProvider {
    static var previews: some View {
        ActivityScreen()
    }
}
