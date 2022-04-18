//
//  History.swift
//  Today's History
//
//  Created by Difeng Chen on 4/17/22.
//

import Foundation

struct HistoryResponse: Decodable {
    struct HistoryData: Decodable {
        struct History: Decodable {
            let year: String?
            let text: String?
        }

        let Events: [History]?
        let Births: [History]?
        let Deaths: [History]?
    }

    let data: HistoryData?
}
