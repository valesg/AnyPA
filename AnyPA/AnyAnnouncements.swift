//
//  AnyAnnouncements.swift
//  AnyPA
//
//  Created by Guy Vales on 2019-12-01.
//  Copyright © 2019 Guy Vales. All rights reserved.
//

import SwiftUI

struct AnyAnnouncements: View {
    
    let trainStation: TrainStation
    
    var body: some View {
        
    NavigationView {
        
        VStack(alignment: .leading) {
        Image(trainStation.thumbnailNameStation)
            .resizable()
            .aspectRatio(contentMode: .fit)
        
        Text("Recent Announcements (Audio-to-Text)")
        Spacer()
        Text("10:55AM (by OC Transpo) An earlier incident has been resolved.  Normal service now resumed - Pimisi station")
        Text("10:40AM (by Passenger) Due to an incident, there is an expected delay of 20 minutes - All stations")
        Text("10:30AM (by Passenger) Passengers with bicycles are invited to board the last car - All stations")
        Text("10:05AM (by OC Transpo) Please remove any obstruction to the door - Parliament station")
        Spacer()
            } .padding()
        .navigationBarTitle(Text("\(trainStation.name)" + " Station"), displayMode: .inline)
        }
    }
}

struct AnyAnnouncements_Previews: PreviewProvider {
    static var previews: some View {
        AnyAnnouncements(trainStation: testData[1])
    }
}
