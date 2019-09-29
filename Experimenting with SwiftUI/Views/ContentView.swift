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
    @ObservedObject var viewModel: DestinationViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.destinations) { destination in
                NavigationLink(destination: DetailView(destination: destination)) {
                    Cell(destination: destination, viewModel: CellViewModel(destination: destination))
                }
                .padding(.trailing, -32.0)
                .padding(.leading, -16.0)
            }
            .alert(isPresented: $viewModel.isErrorShown, content: { () -> Alert in
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
            })
            .navigationBarTitle(Text("Destinations"))
        }
        .onAppear(perform: { self.viewModel.apply(.onAppear) })
    }
}

// I am not using preview, because I have macOs 10.14 and it is not available.
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
