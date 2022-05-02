//
//  HomeCoordinator.swift
//  Today's History
//
//  Created by Difeng Chen on 4/30/22.
//

import UIKit

class HomeCoordinator {

    // MARK: - Properties

    private(set) var date = Date() {
        didSet {
            loadHistories()
        }
    }
    private(set) var histories: [[HistoryResponse.HistoryData.History]] = []

    let viewCoordinator: HomeViewCoordiantor
    var networkCoordinator: HomeNetworkCoordinating = HomeNetworkCoordinator()
    var mainCoordinator: MainCoordinator?

    // MARK: - Initializers

    init(view: UIView) {
        viewCoordinator = HomeViewCoordiantor(view: view)
    }

    // MARK: - Functions

    func configure() {
        viewCoordinator.coordinator = self
        viewCoordinator.configureView()

        loadHistories()
    }

    func updateDate(byAdding days: Int) {
        if let date = Calendar.current.date(byAdding: .day, value: days, to: date) {
            self.date = date
        }
    }

    func loadHistories(completion: (() -> Void)? = nil) {
        networkCoordinator.loadHistories(for: date) { [weak self] histories in
            self?.histories = histories

            self?.viewCoordinator.updateViews()

            completion?()
        }
    }

    func getNumberOfEvent() -> Int {
        histories.reduce(0, { $0 + $1.count })
    }

    func navigateToDetails() {
        mainCoordinator?.pushDetails(numberOfEvents: getNumberOfEvent())
    }
}

// MARK: - HomeCoordinator+HomeHeaderStackViewDelegate

extension HomeCoordinator: HomeHeaderStackViewDelegate {
    func toPreviousDay() {
        updateDate(byAdding: -1)
    }

    func toNextDay() {
        updateDate(byAdding: 1)
    }
}
