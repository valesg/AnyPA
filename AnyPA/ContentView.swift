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


func distanceFromOttawaStation(whereAmI: CLLocation) {
    
    
    let latitude: CLLocationDegrees = 37.2
    let longitude: CLLocationDegrees = 22.9
    
    let stationPimisiLocation: CLLocation = CLLocation(latitude: latitude,
      longitude: longitude)
    // distanceFromStation = Int((location.distance(from: stationPimisiLocation) / 1000))
    // distanceFromStation = Int((whereAmI.distance(from: stationPimisiLocation) / 1000))
}

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
                
                Text("Blair Bound: Next train @ " + "\(trainStation.nextTrainTimeBlairBound)")
                .font(.subheadline)
                Text("Tunneys Bound: Next train @ " + "\(trainStation.tunneysBoundNextTrainTime)")
                .font(.subheadline)
                Text("Loc: " + "\(trainStation.stationlatitude)" + ", \(trainStation.stationlongitude) " + "\(self.astationProximityDetector.shortestDistance)")
                .font(.subheadline)
                
            }
           }
        }
        .navigationBarTitle(Text("Train Stations"))
        // .navigationBarItems(leading:
        //    HStack {
            
        //        NavigationLink(destination: Following()) {
        //            Text("Nearest @ " + "\(self.astationProximityDetector.distanceFromStation) km")
                
        //        }
                
                // Button("About") {
                //    print("About Tapped")
                // }

        //    })
           .alert(isPresented: $locatedInTrain) {
            Alert(title: Text("In-Train"), message: Text("In-Train announcements are also available"), dismissButton: .default(Text("Ok")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(trainStations: testData)
    }
}
