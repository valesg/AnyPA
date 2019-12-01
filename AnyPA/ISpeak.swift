//
//  ISpeak.swift
//  AnyPA
//
//  Created by Guy Vales on 2019-11-10.
//  Copyright © 2019 Guy Vales. All rights reserved.
//

import SwiftUI

struct ISpeak: View {
    var announceType = ["Ad-hoc", "Boarding", "Departure", "Gate Change", "Lost & Found", "Delay"]
    var passengerType = ["With small children", "Premiere", "A-F", "G-L", "M-R", "All Passengers"]
    @State var adHocMsg: String = "This is an Ad-hoc message"
    @State private var selectedAnnounceType = 0
    @State private var selectedPassengerType = 0
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
                            Picker(selection: $selectedPassengerType, label: Text("Passenger Category")) {
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
                        Text("What Train?")
                        TextField("Train Line", text: $trainLine)
                        Stepper(value: $delay, in: 5...50) {
                         Text("Estimated Delay: \(self.delay) min")
                        }
                        Text("Msg: Attention, we expect a 15 minutes delay for Line 1 trains.")
                         Button(action: {
                             self.sayAnnouncement.toggle()
                         })
                            {
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
        }.navigationBarTitle("Say It...")
        
    }
}
}
struct ISpeak_Previews: PreviewProvider {
    static var previews: some View {
        ISpeak()
    }
}
