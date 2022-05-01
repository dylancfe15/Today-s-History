//
//  DetailsViewCoordinator.swift
//  Today's History
//
//  Created by Difeng Chen on 5/1/22.
//

import UIKit

class DetailsViewCoordinator {

    // MARK: - Views

    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        return label
    }()

    private let view: UIView

    // MARK: - Properties

    var coordinator: DetailsCoordinator?

    // MARK: - Intializers

    init(view: UIView) {
        self.view = view
    }

    // MARK: - Functions

    func configureView() {
        view.backgroundColor = .white

        view.addSubview(countLabel)

        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        let tap = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))

        view.addGestureRecognizer(tap)
    }

    func updateViews() {
        countLabel.text = "Number of Events: \(coordinator?.numberOfEvents ?? 0)"
    }

    @objc private func viewDidTap() {
        coordinator?.popViewController()
    }
}
