//
//  ISpeak.swift
//  AnyPA
//
//  Created by Guy Vales on 2019-11-10.
//  Copyright © 2019 Guy Vales. All rights reserved.
//

import SwiftUI

struct ISpeak: View {
    var announceType = ["Delay", "On-Time", "Ad-hoc", "Boarding", "Departure", "Gate Change", "Lost & Found"]
    var passengerType = ["With small children", "Premiere", "A-F", "G-L", "M-R", "All Passengers"]
    var affectedTrainLine = ["Blair Bound", "Tunneys Bound"]
    var listeningStation = ["Tunneys", "Bayview", "Lyon", "Parliament", "Rideau"]
    @State var adHocMsg: String = "This is an Ad-hoc message"
    @State private var selectedAnnounceType = 0
    @State private var selectedPassengerType = 0
    @State private var selectedListeningStation = 0
    @State private var selectedAffectedTrainLine = 1
    @State var sayAnnouncement = false
    @State var delay = 5
    @State var trainLine: String = ""
    
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
                        Text("Say What?")
                        Button(action: {
                            self.sayAnnouncement.toggle()
                        })
                           {
                               Text("Play Announcement")
                           }
                
                    }
                    else if self.announceType[selectedAnnounceType] == "Boarding" {
                            Text("What Train?")
                            TextField("Train Line", text: $trainLine)
                            // TextField($trainLine)
                            // {
                            // Text("Train Line")
                            // }
                            Picker(selection: $selectedPassengerType, label: Text("Passenger Type")) {
                                ForEach(0..<passengerType.count) {
                                    Text(self.passengerType[$0])
                                }
                            }
                            // Text("Passenger Category")
                             Button(action: {
                                 self.sayAnnouncement.toggle()
                             })
                                {
                                    Text("Play Announcement")
                                }
                        }
                    else if self.announceType[selectedAnnounceType] == "Departure" {
                            Text("What Train?")
                            Text("Departure Time?")
                             Button(action: {
                                 self.sayAnnouncement.toggle()
                             })
                                {
                                    Text("Play Announcement")
                                }
                        }
                    else if self.announceType[selectedAnnounceType] == "Gate Change" {
                        Text("What Train?")
                        
                        Text("Previous Gate?")
                        Text("New Gate?")
                         Button(action: {
                             self.sayAnnouncement.toggle()
                         })
                            {
                                Text("Play Announcement")
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
                                Text("Play Announcement")
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
                        Text("Msg: Attention, trains are running on time.")
                         Button(action: {
                             self.sayAnnouncement.toggle()
                         })
                            {
                                .spacer()
                                Text("Play Announcement")
                            }
                    }
                    else if self.announceType[selectedAnnounceType] == "Lost & Found" {
                            Text("Lost Item")
                            Text("Description")
                             Button(action: {
                                 self.sayAnnouncement.toggle()
                             })
                                {
                                    Text("Play Announcement")
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
