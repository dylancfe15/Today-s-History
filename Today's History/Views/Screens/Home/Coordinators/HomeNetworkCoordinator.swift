//
//  HomeNetworkCoordinator.swift
//  Today's History
//
//  Created by Difeng Chen on 4/30/22.
//

import Foundation

class HomeNetworkCoordinator {

    var networkManager = NetworkManager()

    func loadHistories(for date: Date, completion: @escaping(_ histories: [[HistoryResponse.HistoryData.History]]) -> Void) {
        networkManager.loadHistories(for: date) { histories in
            completion(histories)
        }
    }
}
