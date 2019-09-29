//
//  Destination.swift
//  Experimenting with SwiftUI
//
//  Created by Martin Vidovic on 26/09/2019.
//  Copyright © 2019 Martin Vidovic. All rights reserved.
//

import Foundation

struct DestinationDTO: Decodable, Identifiable {
    // This DTO could contain more information, but for this project I don't need them.
    var id: String
    var countryFrom: CountryDTO
    var countryTo: CountryDTO
    var cityFrom: String
    var cityTo: String
    var mapIdfrom: String
    var mapIdto: String
}
