//
//  HistoriesViewModel.swift
//  Today's History
//
//  Created by Difeng Chen on 4/17/22.
//

import Foundation

class HomeViewModel {
    // MARK: - Properties

    private(set) var date = Date()
    private(set) var histories: [[HistoryResponse.HistoryData.History]] = []

    var networkManager = NetworkManager()

    // MARK: - Functions

    func updateDate(byAdding days: Int) {
        if let date = Calendar.current.date(byAdding: .day, value: days, to: date) {
            self.date = date
        }
    }

    func loadHistory(completion: @escaping() -> Void) {
        networkManager.loadHistories(for: date) { [weak self] histories in
            self?.histories = histories

            completion()
        }
    }

    func getNumberOfEven() -> Int {
        histories.reduce(0, { $0 + $1.count })
    }
}
