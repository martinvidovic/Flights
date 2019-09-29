//
//  Destinations.swift
//  Experimenting with SwiftUI
//
//  Created by Martin Vidovic on 25/09/2019.
//  Copyright © 2019 Martin Vidovic. All rights reserved.
//

import Foundation
struct Destinations: Codable {
    var destinations: [Destination]
    private enum destinationsJSON: String, CodingKey {
        case destinations = "data"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: destinationsJSON.self)
        destinations = try container.decode([Destination].self, forKey: .destinations)
    }
}

struct Destination: Codable {
    var id: String
    var countryFrom: Country
    var countryTo: Country
//    var bags: Bags
//    var bagsLimit: BagLimit
//    var dTime: String
    var cityFrom: String
    var cityTo: String
//    var mapIdTo: String
//    var flyDuration: String
//    var distance : Double
//    var price: Int
//    var conversionFromEur: Double
//    var aTime: Int

    private enum destinationJson: String, CodingKey {
        case id = "id"
        case countryFrom = "countryFrom"
        case countryTo = "countryTo"
        case cityFrom = "cityFrom"
        case cityTo = "cityTo"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: destinationJson.self)
        id = try container.decode(String.self, forKey: .id)
        countryFrom = try container.decode(Country.self, forKey: .countryFrom)
        countryTo = try container.decode(Country.self, forKey: .countryTo)
        cityFrom = try container.decode(String.self, forKey: .cityFrom)
        cityTo = try container.decode(String.self, forKey: .cityTo)
    }
}

