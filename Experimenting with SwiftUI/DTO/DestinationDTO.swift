//
//  Destination.swift
//  Experimenting with SwiftUI
//
//  Created by Martin Vidovic on 26/09/2019.
//  Copyright © 2019 Martin Vidovic. All rights reserved.
//

import Foundation

struct DestinationDTO: Decodable, Identifiable {
    var id: String
    var countryFrom: CountryDTO
    var countryTo: CountryDTO
    var cityFrom: String
    var cityTo: String
    var mapIdfrom: String
    var mapIdto: String
}
