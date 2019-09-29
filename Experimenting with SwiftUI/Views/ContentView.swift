//
//  ContentView.swift
//  Experimenting with SwiftUI
//
//  Created by Martin Vidovic on 25/09/2019.
//  Copyright © 2019 Martin Vidovic. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    var body: some View {
        Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
