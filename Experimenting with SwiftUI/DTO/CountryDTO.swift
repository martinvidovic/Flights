//
//  Country.swift
//  Experimenting with SwiftUI
//
//  Created by Martin Vidovic on 25/09/2019.
//  Copyright © 2019 Martin Vidovic. All rights reserved.
//

import Foundation

struct Country: Codable {
    var code: String
    var name: String

    private enum countryJSON: String, CodingKey {
        case code
        case name
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: countryJSON.self)
        code = try container.decode(String.self, forKey: .code)
        name = try container.decode(String.self, forKey: .name)
    }
}
