//
//  DetailView.swift
//  Experimenting with SwiftUI
//
//  Created by Martin Vidovic on 29/09/2019.
//  Copyright © 2019 Martin Vidovic. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    // In this view can be anything from price and duration or it might look like suggested design, this is just for example.
    var destination: DestinationDTO

    var body: some View {
        List {
            Section(header: Text("From")) {
                HStack{
                    Text("City:")
                    Spacer()
                    Text(destination.cityFrom)
                }
                HStack{
                    Text("Country:")
                    Spacer()
                    Text(destination.countryFrom.name)
                }
            }
            Section(header: Text("To")) {
                HStack{
                    Text("City:")
                    Spacer()
                    Text(destination.cityTo)
                }
                HStack{
                    Text("Country:")
                    Spacer()
                    Text(destination.countryTo.name)
                }
            }
        }.navigationBarTitle("Flight", displayMode: .inline)
    }
}

// I am not using preview, because I have macOs 10.14 and it is not available.
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
