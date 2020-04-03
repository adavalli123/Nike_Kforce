//
//  TableViewTests.swift
//  Nike-AssesmentTests
//
//  Created by Varshini Thatiparthi on 4/3/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import XCTest
@testable import Nike_Assesment

class TableViewTests: XCTestCase {
    func testUpdateResults() {
        let results = AlbumResultBuilder.build()
        let delegate = MockUpdateAlbumDelegate()
        delegate.update(results)
        
        XCTAssertEqual(delegate.results.first?.artistName, results.first?.artistName)
        XCTAssertEqual(delegate.results.first?.artworkUrl100, results.first?.artworkUrl100)
        XCTAssertEqual(delegate.results.first?.name, results.first?.name)
        XCTAssertEqual(delegate.results.first?.url, results.first?.url)
        XCTAssertEqual(delegate.results.first?.copyright, results.first?.copyright)
        XCTAssertEqual(delegate.results.first?.genres.first?.name, results.first?.genres.first?.name)
        XCTAssertTrue(delegate.isCalled)
    }
    
    func testTableViewRows() {
        let tableView = TableView()
        let mockDataSource = MockTableViewDatasource()
        let results = AlbumResultBuilder.build()
        mockDataSource.results = results
        tableView.dataSource = mockDataSource
        
        let rowsCount = mockDataSource.tableView(tableView, numberOfRowsInSection: 100)
        XCTAssertEqual(rowsCount, 2)
    }
    
    func testCellForRowIsCalled() {
        let tableView = TableView()
        let mockDataSource = MockTableViewDatasource()
        tableView.dataSource = mockDataSource
        
        let _ = mockDataSource.tableView(tableView, cellForRowAt: IndexPath())
        XCTAssertEqual(mockDataSource.cellForRowIsCalled, true)
    }
}
