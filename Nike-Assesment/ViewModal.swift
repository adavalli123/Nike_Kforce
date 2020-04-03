//
//  ViewModal.swift
//  Nike-Assesment
//
//  Created by Varshini Thatiparthi on 4/2/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import Foundation

struct ViewModal: Response {
    var delegate: UpdateAlbumDelegate?
    
    func handleTopAlbumsAPI() {
        Self.handle(url: Constants.topAlbums, decodingType: TopAlbums.self) { [self] (topAlbums, error) in
            DispatchQueue.main.async {
                guard let albums = topAlbums else { return }
                self.delegate?.update(albums.feed.results)
            }
        }
    }
    
    func setTitle() -> String {
        return "Top Albums"
    }
}

private extension ViewModal {
    enum Constants {
        static let topAlbums = "api/v1/us/apple-music/top-albums/all/100/explicit.json"
    }
}
