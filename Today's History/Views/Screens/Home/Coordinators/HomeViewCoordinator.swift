//
//  HomeViewCoordinator.swift
//  Today's History
//
//  Created by Difeng Chen on 4/30/22.
//

import UIKit

class HomeViewCoordiantor {

    var coordinator: HomeCoordinator?

    // MARK: - Views

    private let view: UIView

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerView, countLabel, detailsButton, UIView()])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()

    private lazy var headerView: HomeHeaderStackView = {
        let headerView = HomeHeaderStackView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.delegate = coordinator
        return headerView
    }()

    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var detailsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Details", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addAction(UIAction(handler: { _ in
            self.coordinator?.navigateToDetails()
        }), for: .touchUpInside)
        return button
    }()

    // MARK: - Initializers

    init(view: UIView) {
        self.view = view
    }

    // MARK: - Functions

    func configureView() {
        view.addSubview(stackView)

        view.backgroundColor = .white

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func updateViews() {
        DispatchQueue.main.async {
            if let date = self.coordinator?.date {
                self.headerView.setTitle(with: date)
            }

            self.countLabel.text = "Number of Events: \(self.coordinator?.getNumberOfEvent() ?? 0)"
        }
    }
}

