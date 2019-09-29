//
//  DestinationsDTO.swift
//  Experimenting with SwiftUI
//
//  Created by Martin Vidovic on 25/09/2019.
//  Copyright © 2019 Martin Vidovic. All rights reserved.
//

import Foundation

struct DestinationsDTO: Decodable {
    // This DTO could contain more information, but for this project I don't need them.
    var data: [DestinationDTO]
}


