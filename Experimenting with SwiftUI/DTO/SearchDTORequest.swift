//
//  URL.swift
//  Experimenting with SwiftUI
//
//  Created by Martin Vidovic on 28/09/2019.
//  Copyright © 2019 Martin Vidovic. All rights reserved.
//

import Foundation

struct SearchDTORequest: APIRequestType {
    typealias Response = DestinationsDTO

    var path: String { return "/flights"}
    var queryItems: [URLQueryItem]? {
        return [
        .init(name: "v", value: "2"),
        .init(name: "sort", value: "popularity"),
        .init(name: "asc", value: "0"),
        .init(name: "locale", value: "en"),
        .init(name: "daysInDestinationFrom", value: ""),
        .init(name: "daysInDestinationTo", value: "2"),
        .init(name: "affilid", value: ""),
        .init(name: "children", value: "0"),
        .init(name: "infants", value: "0"),
        .init(name: "flyFrom", value: "49.2-16.61-250km"),
        .init(name: "to", value: "anywhere"),
        .init(name: "featureName", value: "aggregateResults"),
        .init(name: "dateFrom", value: "29/09/2019"),
        .init(name: "dateTo", value: "30/09/2019"),
        .init(name: "typeFlight", value: "oneway"),
        .init(name: "returnFrom", value: ""),
        .init(name: "returnTo", value: ""),
        .init(name: "one_per_date", value: "0"),
        .init(name: "oneforcity", value: "1"),
        .init(name: "wait_for_refresh", value: "0"),
        .init(name: "adults", value: "1"),
        .init(name: "limit", value: "45"),
        .init(name: "partner", value: "picky")
        ]
    }
}

//https://api.skypicker.com/flights?v=2&sort=popularity&asc=0&locale=en&daysInDestinationFrom=&daysInDestinationTo=&affilid=&children=0&infants=0&flyFrom=49.2-16.61-250km&to=anywhere&featureName=aggregateResults&dateFrom=29/09/2019&dateTo=30/09/2019&typeFlight=oneway&returnFrom=&returnTo=&one_per_date=0&oneforcity=1&wait_for_refresh=0&adults=1&limit=45&partner=picky
