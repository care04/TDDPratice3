//
//  TDDPratice3Tests.swift
//  TDDPratice3Tests
//
//  Created by Care Farrar on 4/16/21.
//

import XCTest
@testable import TDDPratice3

extension Pizza {
    static func fixture()  -> Pizza {
        return Pizza()
    }
}

struct MenuDataSource {
    let pizzas: [Pizza]
    let numberOfSections = 1
    func numberOfRows(inSection section: Int) -> Int {
        guard section == 0 else { return 0}
        return pizzas.count
    }
    func item(forRow row: Int, inSection section: Int) -> MenuItem {
        return MenuItem()
    }
}

struct MenuItem {
    let title =  "Margherita"
}

struct Pizza {
    
}

class TDDPratice3Tests: XCTestCase {
    var dataSource: MenuDataSource!
    override func setUp() {
        dataSource = MenuDataSource(pizzas: [.fixture(), .fixture(), .fixture()])
    }
    
    func testHasOneSection() {
        XCTAssertEqual(dataSource.numberOfSections, 1)
    }
    func testRowsInSection() {
        XCTAssertEqual(dataSource.numberOfRows(inSection: 0), 3)
    }
    func testRowsInOutOfBoundsSectionIsZero() {
        XCTAssertEqual(dataSource.numberOfRows(inSection: 1), 0)
        XCTAssertEqual(dataSource.numberOfRows(inSection: -1), 0)
    }
    func testItemForRowAndSection() {
        XCTAssertEqual(dataSource.item(forRow: 0, inSection: 0).title, "Margherita")
    }
}
