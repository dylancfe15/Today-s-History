//
//  DetailsViewController.swift
//  Today's History
//
//  Created by Difeng Chen on 4/27/22.
//

import UIKit

class DetailsViewController: UIViewController {

    // MARK: - Views

    private(set) lazy var coordinator = DetailsCoordinator(view: self.view)
    var mainCoordinator: MainCoordinator?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        coordinator.configure()
        coordinator.mainCoordinator = mainCoordinator
    }
}
