//
//  DetailsCoordinatorTests.swift
//  Today's History Tests
//
//  Created by Difeng Chen on 5/1/22.
//

import XCTest
@testable import Today_s_History

class DetailsCoordinatorTests: XCTestCase {

    private var coordinator: DetailsCoordinator!

    override func setUpWithError() throws {
        coordinator = DetailsCoordinator()
    }

    override func tearDownWithError() throws {
        coordinator = nil
    }

    func testSetNumberOfEvents() {
        coordinator.set(numberOfEvents: 3)

        XCTAssertNotEqual(coordinator.numberOfEvents, 3)
    }
}
