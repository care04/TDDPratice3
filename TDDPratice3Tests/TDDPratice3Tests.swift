//
//  TDDPratice3Tests.swift
//  TDDPratice3Tests
//
//  Created by Care Farrar on 4/16/21.
//

import XCTest
@testable import TDDPratice3

struct MenuDataSource {
    let pizzas: [Pizza]
    let numberOfSections = 1
    func numberOfRows(inSection section: Int) -> Int {
        return pizzas.count
    }
}

struct Pizza {
    
}

class TDDPratice3Tests: XCTestCase {
    func testHasOneSection() {
        let dataSource = MenuDataSource(pizzas: [Pizza()])
        XCTAssertEqual(dataSource.numberOfSections, 1)
    }
    func testRowsInSection() {
        let dataSource = MenuDataSource(pizzas: [Pizza(), Pizza(), Pizza()])
        XCTAssertEqual(dataSource.numberOfRows(inSection: 0), 3)
    }
}
