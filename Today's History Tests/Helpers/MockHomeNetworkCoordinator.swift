//
//  MockHomeNetworkCoordinator.swift
//  Today's History Tests
//
//  Created by Difeng Chen on 5/2/22.
//

import Foundation
import Today_s_History

class MockHomeNetworkCoordinator: HomeNetworkCoordinating {

    func loadHistories(for date: Date, completion: @escaping ([[HistoryResponse.HistoryData.History]]) -> Void) {
        let decoder = JSONDecoder()

        guard let url = Bundle.main.url(forResource: "Histories", withExtension: "json"), let data = try? Data(contentsOf: url), let response = try? decoder.decode(HistoryResponse.self, from: data) else {
            completion([])
           return
        }

        var histories: [[HistoryResponse.HistoryData.History]] = []

        if let events = response.data?.Events {
            histories.append(events)
        }

        if let births = response.data?.Births {
            histories.append(births)
        }

        if let deaths = response.data?.Deaths {
            histories.append(deaths)
        }

        completion(histories)
    }
}
