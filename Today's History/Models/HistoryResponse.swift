//
//  History.swift
//  Today's History
//
//  Created by Difeng Chen on 4/17/22.
//

import Foundation

public struct HistoryResponse: Decodable {
    public struct HistoryData: Decodable {
        public struct History: Decodable {
            let year: String?
            let text: String?
        }

        public let Events: [History]?
        public let Births: [History]?
        public let Deaths: [History]?
    }

    public let data: HistoryData?
}
