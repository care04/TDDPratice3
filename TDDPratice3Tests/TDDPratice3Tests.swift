//
//  TDDPratice3Tests.swift
//  TDDPratice3Tests
//
//  Created by Care Farrar on 4/16/21.
//

import XCTest
@testable import TDDPratice3

extension Pizza {
    static func fixture(name: String = "Margherita")  -> Pizza {
        return Pizza(name: name)
    }
}

extension MenuItem {
    init(pizza: Pizza) {
        self.init(title: pizza.name)
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
        return MenuItem(pizza: pizzas[row])
    }
}

struct MenuItem {
    let title: String
}

struct Pizza {
    let name: String
}

class TDDPratice3Tests: XCTestCase {
    var dataSource: MenuDataSource!
    override func setUp() {
        dataSource = MenuDataSource(pizzas: [.fixture(name: "Margherita"), .fixture(name: "Capricciaso"), .fixture()])
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
        XCTAssertEqual(dataSource.item(forRow: 1, inSection: 0).title, "Capricciaso")
    }
    
}
