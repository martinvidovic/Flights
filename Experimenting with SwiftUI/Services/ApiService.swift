//
//  ApiService.swift
//  Experimenting with SwiftUI
//
//  Created by Martin Vidovic on 28/09/2019.
//  Copyright © 2019 Martin Vidovic. All rights reserved.
//

import Foundation
import Combine

protocol APIRequestType {
    associatedtype Response: Decodable

    var path: String { get }
    func getQueryItems(dateFrom: String, dateTo: String) -> [URLQueryItem]?
}

protocol APIServiceType {
    func response<Request>(from request: Request, dateFrom: String, dateTo: String) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType
}

enum APIServiceError: Error {
    case responseError
    case parseError(Error)
}

final class ApiService: APIServiceType {
    private let dataURL: URL
    init(baseURL: URL = URL(string: "https://api.skypicker.com")!) {
        self.dataURL = baseURL
    }

    func response<Request>(from request: Request, dateFrom: String, dateTo: String) -> AnyPublisher<Request.Response, APIServiceError> where Request : APIRequestType {
        let pathURL = URL(string: request.path, relativeTo: self.dataURL)!
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = request.getQueryItems(dateFrom: dateFrom, dateTo: dateTo)
        var request = URLRequest(url: urlComponents.url!)

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let decorder = JSONDecoder()
            return URLSession.shared.dataTaskPublisher(for: request)
                .map { data, urlResponse in data }
                .mapError { _ in APIServiceError.responseError }
                .decode(type: Request.Response.self, decoder: decorder)
                .mapError(APIServiceError.parseError)
                .receive(on: RunLoop.main)
                .eraseToAnyPublisher()
    }
}
