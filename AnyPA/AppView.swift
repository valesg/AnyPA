//
//  AppView.swift
//  AnyPA
//
//  Created by Guy Vales on 2019-11-30.
//  Copyright © 2019 Guy Vales. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var trainStations: [TrainStation] = []
    
    var body: some View {
        TabView {
            ContentView(trainStations: testData).tabItem({
                Image(systemName: "tram.fill")
                    .font(.title)
                Text("Stations")
            }).tag(0)
            ContentView(trainStations: testData).tabItem({
                Image(systemName: "list.dash")
                    .font(.title)
                Text("Announcement")
            }).tag(1)
            ISpeak().tabItem({
                Image(systemName: "mic")
                    .font(.title)
                Text("Speak")
            }).tag(2)
            LocatorVenueVehicle().tabItem({
                Image(systemName: "location")
                    .font(.title)
                Text("Nearby")
            }).tag(3)

            Following().tabItem({
                Image(systemName: "gear")
                    .font(.title)
                Text("Settings")
            }).tag(4)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(trainStations: testData)
    }
}
