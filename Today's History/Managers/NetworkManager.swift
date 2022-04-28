//
//  NetworkManager.swift
//  Today's History
//
//  Created by Difeng Chen on 4/27/22.
//

import Foundation

class NetworkManager {

    func loadHistories(for date: Date, completion: @escaping(_ histories: [[HistoryResponse.HistoryData.History]]) -> Void) {
        let components = Calendar.current.dateComponents([.day, .month], from: date)

        guard let day = components.day, let month = components.month, let url = URL(string: "https://history.muffinlabs.com/date/\(month)/\(day)") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            do {
                let response = try JSONDecoder().decode(HistoryResponse.self, from: data)
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
            } catch {
                print(error)
            }
        }.resume()
    }
}
