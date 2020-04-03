//
//  ViewModalTest.swift
//  Nike-AssesmentTests
//
//  Created by Varshini Thatiparthi on 4/2/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import XCTest
@testable import Nike_Assesment

class ViewModalTest: XCTestCase {
    func testTitle() {
        let vm = ViewModal()
        let title = vm.setTitle()
        
        XCTAssertEqual(title, "Top Albums")
    }
}

