//
//  DetailsViewController.swift
//  Today's History
//
//  Created by Difeng Chen on 4/27/22.
//

import UIKit

class DetailsViewController: UIViewController {

    // MARK: - Views
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        return label
    }()

    let viewModel = DetailsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(countLabel)

        countLabel.text = "Number of Events: \(viewModel.numberOfEvents)"

        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
