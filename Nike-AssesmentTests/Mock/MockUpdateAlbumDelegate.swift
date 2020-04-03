//
//  MockUpdateAlbumDelegate.swift
//  Nike-AssesmentTests
//
//  Created by Varshini Thatiparthi on 4/3/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import Foundation
@testable import Nike_Assesment

class MockUpdateAlbumDelegate: UpdateAlbumDelegate {
    var isCalled = false
    var results: [AlbumResults] = []
    
    func update(_ result: [AlbumResults]) {
        isCalled = true
        results = result
    }
}
