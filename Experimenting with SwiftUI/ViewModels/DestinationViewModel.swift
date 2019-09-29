//
//  DestinationViewModel.swift
//  Experimenting with SwiftUI
//
//  Created by Martin Vidovic on 27/09/2019.
//  Copyright © 2019 Martin Vidovic. All rights reserved.
//

import Foundation
import Combine
import UIKit



final class DestinationViewModel: ObservableObject {
    private let responseSubject = PassthroughSubject<DestinationsDTO, Never>()
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()

    private let onAppearSubject = PassthroughSubject<Void, Never>()

    private let apiService: APIServiceType
    private var cancellables: [AnyCancellable] = []


    @Published private(set) var destinations: [DestinationDTO] = []
    @Published private var destinationImages: [UIImage] = []
    @Published var isErrorShown = false
    @Published var errorMessage = ""

    enum Input {
        case onAppear
    }
    func apply(_ input: Input) {
        switch input {
        case .onAppear:
            onAppearSubject.send(())

        }
    }
    
    init(apiService: APIServiceType = ApiService()) {
        self.apiService = apiService
        bindInputs()
        bindOutputs()
    }

    func bindInputs() {
        let request = SearchDTORequest()

        let responsePublisher = onAppearSubject
            .flatMap { [apiService] _ in
                apiService.response(
                    from: request,
                    dateFrom: self.convertDateFormater(Date()),
                    dateTo: self.convertDateFormater(self.tomorrow())
                )
                    .catch { [weak self] error -> Empty<DestinationsDTO, Never> in
                        self?.errorSubject.send(error)
                        return .init()
                }
        }
        let responseStream = responsePublisher
            .share()
            .subscribe(responseSubject)

        cancellables += [
            responseStream,
        ]
    }
    private func bindOutputs() {
        let repositoriesStream = responseSubject
            .map { $0.data }
            .assign(to: \.destinations, on: self)

        let errorMessageStream = errorSubject
            .map { error -> String in
                switch error {
                case .responseError: return "network error"
                case .parseError: return "parse error"
                }
            }
            .assign(to: \.errorMessage, on: self)

        let errorStream = errorSubject
            .map { _ in true }
            .assign(to: \.isErrorShown, on: self)

        cancellables += [
            repositoriesStream,
            errorStream,
            errorMessageStream,
        ]
    }
    func convertDateFormater(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let stringDate = formatter.string(from: date)
        return stringDate
    }
    func tomorrow() -> Date {
        var dateComponents = DateComponents()
        dateComponents.setValue(1, for: .day)
        let tomorrow = Calendar.current.date(byAdding: dateComponents, to: Date())
        return tomorrow!
    }
}
