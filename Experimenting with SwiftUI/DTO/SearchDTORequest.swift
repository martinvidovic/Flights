//
//  URL.swift
//  Experimenting with SwiftUI
//
//  Created by Martin Vidovic on 28/09/2019.
//  Copyright © 2019 Martin Vidovic. All rights reserved.
//

import Foundation

struct SearchDTORequest: APIRequestType {
    func getQueryItems(dateFrom: String, dateTo: String) -> [URLQueryItem]? {
        return [
               .init(name: "v", value: "2"),
               .init(name: "sort", value: "popularity"),
               .init(name: "asc", value: "0"),
               .init(name: "locale", value: "en"),
               .init(name: "daysInDestinationFrom", value: ""),
               .init(name: "daysInDestinationTo", value: ""),
               .init(name: "affilid", value: ""),
               .init(name: "children", value: "0"),
               .init(name: "infants", value: "0"),
               .init(name: "flyFrom", value: "49.2-16.57-250km"),  // Brno and surroundings.
               .init(name: "to", value: "anywhere"),
               .init(name: "featureName", value: "aggregateResults"),
               .init(name: "dateFrom", value: dateFrom),
               .init(name: "dateTo", value: dateTo),
               .init(name: "typeFlight", value: "oneway"),
               .init(name: "returnFrom", value: ""),
               .init(name: "returnTo", value: ""),
               .init(name: "one_per_date", value: "0"),
               .init(name: "oneforcity", value: "1"),
               .init(name: "wait_for_refresh", value: "0"),
               .init(name: "adults", value: "1"),
               .init(name: "limit", value: "5"),
               .init(name: "partner", value: "picky")
               ]
    }
    typealias Response = DestinationsDTO
    var path: String { return "/flights"}
}
