//
//  AlbumResultBuilder.swift
//  Nike-AssesmentTests
//
//  Created by Varshini Thatiparthi on 4/2/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import Foundation
@testable import Nike_Assesment

struct AlbumResultBuilder {
    static func build() -> [AlbumResults] {
        return [
            AlbumResults(name: "Slum Dog Millionarie",
                         artistName: "AR Rahman",
                         artworkUrl100: "www.google.com",
                         url: "www.bigcloud.com",
                         genres: [Genres(name: "Movie")],
                         copyright: "CopyRight Access"),
            AlbumResults(name: "Roja",
                         artistName: "Andre",
                         artworkUrl100: "www.andre.com",
                         url: "www.largeCloud.com",
                         genres: [Genres(name: "Spirtual")],
                         copyright: "CopyRight Access 2")
        ]
    }
}
