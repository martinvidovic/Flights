//
//  CellViewModel.swift
//  Experimenting with SwiftUI
//
//  Created by Martin Vidovic on 29/09/2019.
//  Copyright © 2019 Martin Vidovic. All rights reserved.
//

import Foundation
import Combine
import UIKit

final class CellViewModel: ObservableObject {
    private let responseSubject = PassthroughSubject<Data, Never>()
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    private let onAppearSubject = PassthroughSubject<Void, Never>()
    private var cancellables: [AnyCancellable] = []

    @Published private(set) var image: UIImage = UIImage()
    @Published var isErrorShown = false
    @Published var errorMessage = ""
    @Published var destination: DestinationDTO

    init(destination: DestinationDTO) {
        self.destination = destination
        cellImage(name: destination.mapIdto)
    }

    func cellImage(name: String) {
        let url = URL(string: "https://images.kiwi.com/photos/600x330/\(name).jpg")!
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error == nil {
                DispatchQueue.main.async {
                    // I know double "!" 😃 ... but this project is just for experimenting with SwiftUI & Combine
                    // http://giphygifs.s3.amazonaws.com/media/oS4bJ2sRXKVDa/giphy.gif
                    self.image = UIImage(data: data!)!
                }
            }
        }
        task.resume()
    }
}
