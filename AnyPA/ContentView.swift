//
//  ContentView.swift
//  AnyPA
//
//  Created by Guy Vales on 2019-10-05.
//  Copyright © 2019 Guy Vales. All rights reserved.
//


import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    @State var locatedInTrain = true
    var trainStations: [TrainStation] = []
    @ObservedObject var astationProximityDetector = StationProximityDetector()
    
    // let location: CLLocation
    var body: some View {
        
        NavigationView {
            
            List(trainStations) { trainStation in
            NavigationLink(destination: StationDetail(trainStation: trainStation)) {
            Image(trainStation.thumbnailNameStation)
                .resizable()
                .cornerRadius(5.0)
                .frame(width: 150, height: 125)
            
            VStack(alignment: .leading) {
                Text(trainStation.name)
                Text("Geo: " + "\(trainStation.stationlatitude)" + ", \(trainStation.stationlongitude) " + "\(self.astationProximityDetector.shortestDistance)")
                    .font(.subheadline)
                Text("Blair Bound: Next train @ " + "\(trainStation.nextTrainTimeBlairBound)")
                .font(.subheadline)
                Text("Tunneys Bound: Next train @ " + "\(trainStation.tunneysBoundNextTrainTime)")
                .font(.subheadline)
                //Text("Prox: " + "\(self.astationProximityDetector.shortestDistance)")
                
            }
           }
        }
        .navigationBarTitle(Text("Train Stations"))
        .navigationBarItems(leading:
            HStack {
                
                NavigationLink(destination: Following()) {
                Text("Stations")
    
                }
                NavigationLink(destination: Following()) {
                Text("In-Train")
                
                }
                NavigationLink(destination: Following()) {
                Text("Follow")
                
                }
                
                Button("About") {
                    print("About Tapped")
                }
                
                NavigationLink(destination: ISpeak()) {
                    Text("iSpeak")
                }
                NavigationLink(destination: LocatorVenueVehicle()) {
                    Text("Assistant")
                }

            })
           .alert(isPresented: $locatedInTrain) {
            Alert(title: Text("In-Train"), message: Text("In-Train announcements are available"), dismissButton: .default(Text("Ok")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(trainStations: testData)
    }
}
