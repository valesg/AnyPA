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
    @State var selected = 0
    
    var body: some View {
        TabView(selection: $selected) {
            ContentView(trainStations: testData).tabItem({
                Image(systemName: "tram.fill")
                    .font(.title)
                Text("Stations")
            }).tag(0)
            AnyAnnouncements(trainStation: testData[1]).tabItem({
                Image(systemName: "dot.radiowaves.left.and.right")
                    .font(.title)
                Text("Announcements")
            }).tag(1)
            ISpeak().tabItem({
                Image(systemName: "mic")
                    .font(.title)
                Text("Speak")
            }).tag(2)
            LocatorVenueVehicle(trainStations: testData).tabItem({
                Image(systemName: "location")
                    .font(.title)
                Text("Nearby")
            }).tag(3)

            Following().tabItem({
                Image(systemName: "gear")
                    .font(.title)
                Text("Settings")
            }).tag(4)
        } //.accentColor(Color.red)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(trainStations: testData)
    }
}
