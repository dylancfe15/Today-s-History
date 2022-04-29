//
//  HistoriesViewModel.swift
//  Today's History
//
//  Created by Difeng Chen on 4/29/22.
//

import Foundation

class HistoriesViewModel {

    private(set) var histories: [[HistoryResponse.HistoryData.History]] = []

    func updateHistories(_ histories: [[HistoryResponse.HistoryData.History]]) {
        self.histories = histories
    }
}
