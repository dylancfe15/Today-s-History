//
//  HomeViewController.swift
//  Today's History
//
//  Created by Difeng Chen on 4/17/22.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Views

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
        headerView.delegate = self
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
            self.navigateToDetails()
        }), for: .touchUpInside)
        return button
    }()

    // MARK: - Properties

    private lazy var viewModel = HomeViewModel()

    // MARK: - Lifecycle Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(stackView)

        view.backgroundColor = .white

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        updateDate()
    }

    // MARK: - Functions

    private func updateDate(byAdding day: Int = 0) {
        viewModel.updateDate(byAdding: day)

        viewModel.loadHistory {
            self.updateViews()
        }
    }

    private func updateViews() {
        DispatchQueue.main.async {
            self.headerView.setTitle(with: self.viewModel.date)

            self.countLabel.text = "Number of Events: \(self.viewModel.getNumberOfEven())"
        }
    }

    private func navigateToDetails() {
        let viewController = DetailsViewController()
        viewController.viewModel.set(numberOfEvent: viewModel.getNumberOfEven())
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - HomeViewController+HomeHeaderStackViewDelegate

extension HomeViewController: HomeHeaderStackViewDelegate {
    func toPreviousDay() {
        updateDate(byAdding: -1)
    }

    func toNextDay() {
        updateDate(byAdding: 1)
    }
}

