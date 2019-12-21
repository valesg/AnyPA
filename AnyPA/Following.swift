//
//  Following.swift
//  AnyPA
//
//  Created by Guy Vales on 2019-10-11.
//  Copyright © 2019 Guy Vales. All rights reserved.
//

import SwiftUI

struct Following: View {
    @State var inTrain = true
    @State var atStation = true
    
    var body: some View {
            
            NavigationView {
                    VStack {
                    Toggle(isOn: $inTrain) {
                    Text("In-Train Announcements")
                    }
                    Toggle(isOn: $atStation) {
                        Text("Station Announcements")
                    }
                    Text(" ")
                    if inTrain && atStation {
                        Text("You are set to receive in-train and station announcements. We use your location data to automatically detect when you're on a train.")
                        }
                    else if inTrain {
                        Text("You are set to receive in-train announcements. We use your location data to automatically detect when you're on a train.")
                    }
                    else if atStation {
                        Text("You are set to receive announcements at the train station.")
                    }
                    Spacer()
                    }.padding()
                       .navigationBarTitle(Text("Following"))
                // .navigationBarTitle("Following", displayMode: .inline)
                .navigationBarHidden(false)
            }
        }
        
    }


struct Following_Previews: PreviewProvider {
    static var previews: some View {
        Following()
    }
}
