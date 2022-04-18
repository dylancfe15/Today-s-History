//
//  HistoriesViewModel.swift
//  Today's History
//
//  Created by Difeng Chen on 4/17/22.
//

import Foundation

class HistoriesViewModel {
    // MARK: - Properties

    private(set) var date = Date()
    private(set) var histories: [[HistoryResponse.HistoryData.History]] = []

    // MARK: - Functions

    func loadData(byAdding days: Int, completion: @escaping() -> Void) {
        if let date = Calendar.current.date(byAdding: .day, value: days, to: date) {
            self.date = date
        }

        let components = Calendar.current.dateComponents([.day, .month], from: date)

        guard let day = components.day, let month = components.month, let url = URL(string: "https://history.muffinlabs.com/date/\(month)/\(day)") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            do {
                let response = try JSONDecoder().decode(HistoryResponse.self, from: data)
                self.histories.removeAll()

                if let events = response.data?.Events {
                    self.histories.append(events)
                }

                if let births = response.data?.Births {
                    self.histories.append(births)
                }

                if let deaths = response.data?.Deaths {
                    self.histories.append(deaths)
                }

                completion()
            } catch {
                print(error)
            }
        }.resume()
    }
}
