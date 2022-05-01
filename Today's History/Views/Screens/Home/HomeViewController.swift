//
//  HomeViewController.swift
//  Today's History
//
//  Created by Difeng Chen on 4/17/22.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties

    private(set) lazy var coordinator = HomeCoordinator(view: self.view)
    var mainCoordinator: MainCoordinator?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        coordinator.configure()
        coordinator.mainCoordinator = mainCoordinator
    }
}
