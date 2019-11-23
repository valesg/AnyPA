//
//  LocatorVenueVehicle.swift
//  AnyPA
//
//  Created by Guy Vales on 2019-10-20.
//  Copyright © 2019 Guy Vales. All rights reserved.
//

import Foundation
import Combine
import CoreLocation
import SwiftUI

class StationProximityDetector: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var shortestDistance: Int = 2
    var locationManager: CLLocationManager?
    @Published var distanceFromStation: Int = 4

    
    override init() {
    
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.shortestDistance += 1
         }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            // Great
            self.shortestDistance = 111
        } else {
           self.shortestDistance = 333
         }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let myLastKnownLocation = location.coordinate
        let myLastKnownCourse = location.course
        
        let latitude: CLLocationDegrees = 37.2
        let longitude: CLLocationDegrees = 22.9
        
        let stationPimisiLocation: CLLocation = CLLocation(latitude: latitude,
          longitude: longitude)
        distanceFromStation = Int((location.distance(from: stationPimisiLocation) / 1000))
        print("My Last Long/Lat is: \(myLastKnownLocation) and \(myLastKnownCourse) and distance is: \(distanceFromStation)")
    }
}
struct LocatorVenueVehicle: View {
    @ObservedObject var stationProximityDetector = StationProximityDetector()
    var trainStations: [TrainStation] = []
    
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
                Text("Geo: " + "\(trainStation.stationlatitude)" + ", \(trainStation.stationlongitude)" + " DIST")
                    .font(.subheadline)
                Text("Get Taxi. Find scooter")
                .font(.subheadline)
                Text("Restaurants & Bars")
                .font(.subheadline)
                Text("Coupons")
                .font(.subheadline)
            }
           }
        }
        .navigationBarTitle(Text("Assistant"))
        }

        // VStack {
        // Text("\(stationProximityDetector.shortestDistance)")
        // Text("\(stationProximityDetector.distanceFromStation) km")
        // Text("Based on curent location, travel habits, train status, get info on...")
        // Text(">Nearest train station")
        // Text(">Offers for taxi or other transport alternatives")
        // Text(">Suggestions on best time to leave, route etc.")
        // }
        
    }
}

struct LocatorVenueVehicle_Previews: PreviewProvider {
    static var previews: some View {
        LocatorVenueVehicle(trainStations: testData)
    }
}
