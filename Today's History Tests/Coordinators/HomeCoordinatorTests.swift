//
//  HomeCoordinatorTests.swift
//  Today's History Tests
//
//  Created by Difeng Chen on 5/1/22.
//

import XCTest
@testable import Today_s_History

class HomeCoordinatorTests: XCTestCase {

    private var coordinator: HomeCoordinator! = nil
    let dateFormatter = DateFormatter()

    override func setUpWithError() throws {
        coordinator = HomeCoordinator(view: UIView())
        coordinator.networkCoordinator = MockHomeNetworkCoordinator()
        dateFormatter.dateFormat = "MM/dd/yyyy"
    }

    override func tearDownWithError() throws {
        coordinator = nil
    }

    func testUpdateDate() {
        coordinator.updateDate(byAdding: 0)

        let dateString = dateFormatter.string(from: coordinator.date)
        let expectedDateString = dateFormatter.string(from: Date())

        XCTAssertEqual(dateString, expectedDateString)
    }

    func testLoadHistories() {
        coordinator.loadHistories()

        XCTAssertTrue(coordinator.histories.isEmpty)
    }
}
