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

    let historiesViewModel = HistoriesViewModel()

    // MARK: - Functions

    func updateDate(byAdding days: Int) {
        if let date = Calendar.current.date(byAdding: .day, value: days, to: date) {
            self.date = date
        }
    }

    func loadData(completion: @escaping() -> Void) {
        let components = Calendar.current.dateComponents([.day, .month], from: date)

        guard let day = components.day, let month = components.month, let url = URL(string: "https://history.muffinlabs.com/date/\(month)/\(day)") else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
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

                self?.historiesViewModel.updateHistories(histories)

                completion()
            } catch {
                print(error)
            }
        }.resume()
    }
}
