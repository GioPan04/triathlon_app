//
//  ActivityRow.swift
//  Watch App WatchKit Extension
//
//  Created by Gioele on 06/09/21.
//

import SwiftUI

struct ActivityRow: View {
    var activity: ActivityModel
    
    var body: some View {
        Button(action: {}, label: {
            VStack(alignment: .center) {
                Image(systemName: "person.circle")
                    .font(Font.system(.title))
                Text(activity.name)
            }
            .padding()
            
        })
    }
}

struct ActivityRow_Previews: PreviewProvider {
    static var previews: some View {
        ActivityRow(activity: ActivityModel(id: 1, name: "test"))
    }
}
