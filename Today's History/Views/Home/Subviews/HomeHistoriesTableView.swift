//
//  HomeHistoriesTableView.swift
//  Today's History
//
//  Created by Difeng Chen on 4/17/22.
//

import UIKit

class HomeHistoriesTableView: UITableView {

    // MARK: - Properties
    var viewModel: HistoriesViewModel?

    // MARK: - Initializers

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configureUI()
    }

    // MARK: - Functions

    private func configureUI() {
        separatorStyle = .singleLine

        register(HomeHistoriesTableViewCell.self, forCellReuseIdentifier: HomeHistoriesTableViewCell.reusableIdentifier)

        delegate = self
        dataSource = self
    }

    func reload() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}

// MARK: - HomeHistoriesTableView+UITableViewDataSource

extension HomeHistoriesTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.histories.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.histories[section].count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeHistoriesTableViewCell.reusableIdentifier, for: indexPath) as? HomeHistoriesTableViewCell else { return UITableViewCell() }

        let history = viewModel?.histories[indexPath.section][indexPath.row]

        cell.configure(with: history)

        return cell
    }
}

// MARK: - HomeHistoriesTableView+UITableViewDelegate

extension HomeHistoriesTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // FIXME: - title shouldn't depend on static indices
        switch section {
        case 0: return "Events"
        case 1: return "Births"
        default: return "Deaths"
        }
    }
}
