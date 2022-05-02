//
//  Coordinators.swift
//  Today's History
//
//  Created by Difeng Chen on 4/30/22.
//

import UIKit

class MainCoordinator {

    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let homeViewController = HomeViewController()
        homeViewController.mainCoordinator = self
        navigationController.viewControllers = [homeViewController]
    }

    func pushDetails(numberOfEvents: Int) {
        let viewController = DetailsViewController()
        viewController.mainCoordinator = self
        viewController.numberOfEvents = numberOfEvents
        navigationController.pushViewController(viewController, animated: true)
    }

    func popViewController() {
        navigationController.popViewController(animated: true)
    }
}
