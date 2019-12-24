//
//  ISpeak.swift
//  AnyPA
//
//  Created by Guy Vales on 2019-11-10.
//  Copyright © 2019 Guy Vales. All rights reserved.
//

import SwiftUI

struct ISpeak: View {
    var announceType = ["Delay", "On-Time", "Ad-hoc", "Lost & Found", "Boarding", "Departure", "Arrival"]
    var passengerType = ["with small children", "in First Class", "remaining"]
    var affectedTrainLine = ["Blair Bound", "Tunneys Bound", "Line 1"]
    var listeningStation = ["Tunneys", "Bayview", "Pimisi", "Lyon", "Parliament", "Rideau", "uOttawa", "Lees", "Hurdman", "Tremblay", "St-Laurent", "Cyrville", "Blair"]
    @State var adHocMsg: String = "This is an Ad-hoc message"
    @State private var selectedAnnounceType = 0
    @State private var selectedPassengerType = 0
    @State private var selectedListeningStation = 0
    @State private var selectedAffectedTrainLine = 0
    @State var sayAnnouncement = false
    @State var delay = 10
    @State var trainLine: String = ""
    @State var lostItem: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedAnnounceType, label: Text("Announcement Type")) {
                        ForEach(0..<announceType.count) {
                            Text(self.announceType[$0])
                        }
                    }
                }
                
                Section {
                    Text("Build your \(self.announceType[selectedAnnounceType]) message:")
                    if self.announceType[selectedAnnounceType] == "Ad-hoc" {
                        Text("What do you want to say?")
                        TextField("Enter your announcement", text: $trainLine)
                        Button(action: {
                            self.sayAnnouncement.toggle()
                        })
                           {
                               Text("Make \(self.announceType[selectedAnnounceType]) Announcement")
                           }
                
                    }
                    else if self.announceType[selectedAnnounceType] == "Boarding" {
                            // Text("What Train?")
                            // TextField("Train Line", text: $trainLine)
                            Picker(selection: $selectedAffectedTrainLine, label: Text("Train Line")) {
                            ForEach(0..<affectedTrainLine.count) {
                                Text(self.affectedTrainLine[$0])
                                }
                            }
                            Picker(selection: $selectedPassengerType, label: Text("Passenger Type")) {
                                ForEach(0..<passengerType.count) {
                                    Text(self.passengerType[$0])
                                }
                            }
                        Text("Msg: Passengers  \(self.passengerType[selectedPassengerType]), boarding now")
                             Button(action: {
                                 self.sayAnnouncement.toggle()
                             })
                                {
                                    Text("Make \(self.announceType[selectedAnnounceType]) Announcement")
                                }
                        }
                    else if self.announceType[selectedAnnounceType] == "Departure" {
                            Text("What Trip?")
                            Text("Departure Time?")
                             Button(action: {
                                 self.sayAnnouncement.toggle()
                             })
                                {
                                    Text("Make \(self.announceType[selectedAnnounceType]) Announcement")
                                }
                        }
                    else if self.announceType[selectedAnnounceType] == "Delay" {
                        Picker(selection: $selectedAffectedTrainLine, label: Text("Train Line")) {
                            ForEach(0..<affectedTrainLine.count) {
                                Text(self.affectedTrainLine[$0])
                            }
                        }
                        Picker(selection: $selectedListeningStation, label: Text("Train Station")) {
                            ForEach(0..<listeningStation.count) {
                                Text(self.listeningStation[$0])
                            }
                        }
                        Stepper(value: $delay, in: 5...50) {
                         Text("Estimated Delay: \(self.delay) min")
                        }
                        Text("Msg: Attention, there is a delay of around \(self.delay) minutes.")
                         Button(action: {
                             self.sayAnnouncement.toggle()
                         })
                            {
                                Text("Make \(self.announceType[selectedAnnounceType]) Announcement")
                            }
                        
                    }
                    else if self.announceType[selectedAnnounceType] == "On-Time" {
                        Picker(selection: $selectedAffectedTrainLine, label: Text("Train Line")) {
                            ForEach(0..<affectedTrainLine.count) {
                                Text(self.affectedTrainLine[$0])
                            }
                        }
                        Picker(selection: $selectedListeningStation, label: Text("Train Station")) {
                            ForEach(0..<listeningStation.count) {
                            Text(self.listeningStation[$0])
                            }
                        }
                        Text("Msg: Attention, \(self.affectedTrainLine[selectedAffectedTrainLine]) trains are running on time.")
                         Button(action: {
                            self.sayAnnouncement.toggle()
                         })
                            {
                                Text("Make \(self.announceType[selectedAnnounceType]) Announcement")
                            }
                    }
                    else if self.announceType[selectedAnnounceType] == "Lost & Found" {
                            Text("Found Item:")
                            TextField("E.g. Purse, glove etc.", text: $lostItem)
                        Text("Msg: \(self.lostItem) found in train or station")
                        
                             Button(action: {
                                 self.sayAnnouncement.toggle()
                             })
                                {
                                    Text("Make \(self.announceType[selectedAnnounceType]) Announcement")
                                }
                        }
                    else {
                        Text("No message for selected category")
                    }
                    
            }
        }.navigationBarTitle("Say something...")

    }
}
}
struct ISpeak_Previews: PreviewProvider {
    static var previews: some View {
        ISpeak()
    }
}
