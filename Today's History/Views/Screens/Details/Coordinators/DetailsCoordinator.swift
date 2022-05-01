//
//  DetailsCoordinator.swift
//  Today's History
//
//  Created by Difeng Chen on 5/1/22.
//

import UIKit

class DetailsCoordinator {

    // MARK: - Properties

    private(set) var numberOfEvents = 0 {
        didSet {
            viewCoordinator.updateViews()
        }
    }

    let viewCoordinator: DetailsViewCoordinator
    var mainCoordinator: MainCoordinator?

    // MARK: - Initializers

    init(view: UIView) {
        viewCoordinator = DetailsViewCoordinator(view: view)
    }

    // MARK: - Functions

    func configure() {
        viewCoordinator.coordinator = self
        viewCoordinator.configureView()
    }

    func set(numberOfEvents: Int) {
        self.numberOfEvents = numberOfEvents
    }

    func popViewController() {
        mainCoordinator?.popViewController()
    }
}
