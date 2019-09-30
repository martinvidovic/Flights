//
//  Cell.swift
//  Experimenting with SwiftUI
//
//  Created by Martin Vidovic on 29/09/2019.
//  Copyright © 2019 Martin Vidovic. All rights reserved.
//

import SwiftUI

struct Cell: View {
    @ObservedObject var viewModel: CellViewModel

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(uiImage: viewModel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            HStack {
                Text(viewModel.destination.cityFrom)
                    .padding(5)
                    .background(Color(red: 25/255, green: 152/255, blue: 171/255))
                    .cornerRadius(5)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .offset(x: 5, y: -5)
                Spacer()
                Text(viewModel.destination.cityTo)
                    .padding(5)
                    .background(Color(red: 25/255, green: 152/255, blue: 171/255))
                    .cornerRadius(5)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .offset(x: -5, y: -5)
            }
        }
    }

}

// I am not using preview, because I have macOs 10.14 and it is not available.
//struct Cell_Previews: PreviewProvider {
//    static var previews: some View {
//        Cell()
//    }
//}
