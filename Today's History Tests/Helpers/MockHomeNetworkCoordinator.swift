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
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "Histories", ofType: "json"),
              let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8),
              let data = jsonString.data(using: .utf8),
              let response = try? JSONDecoder().decode(HistoryResponse.self, from: data) else { return }

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
