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
        let stackView = UIStackView(arrangedSubviews: [headerView, tableView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var headerView: HomeHeaderStackView = {
        let headerView = HomeHeaderStackView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.delegate = self
        return headerView
    }()

    private lazy var tableView: HomeHistoriesTableView = {
        let tableView = HomeHistoriesTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.viewModel = viewModel.historiesViewModel
        return tableView
    }()

    // MARK: - Properties

    private(set) lazy var viewModel = HomeViewModel()

    // MARK: - Lifecycle Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        updateDate()

        updateHeaderTitle()
    }

    // MARK: - Functions

    private func updateHeaderTitle() {
        headerView.setTitle(with: viewModel.date)
    }

    fileprivate func updateDate(byAdding days: Int = 0) {
        viewModel.updateDate(byAdding: -1)
        viewModel.loadData {
            self.tableView.reload()
        }
    }
}

// MARK: - HomeViewController+HomeHeaderStackViewDelegate

extension HomeViewController: HomeHeaderStackViewDelegate {
    func toPreviousDay() {
        updateDate(byAdding: -1)

        updateHeaderTitle()
    }

    func toNextDay() {
        updateDate(byAdding: 1)

        updateHeaderTitle()
    }
}

