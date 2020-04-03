//
//  MockTableViewDelegate.swift
//  Nike-AssesmentTests
//
//  Created by Varshini Thatiparthi on 4/2/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import UIKit
@testable import Nike_Assesment

class MockTableViewDelegate: NSObject, UITableViewDelegate {
    var isCalled = false
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isCalled = true
    }
}
