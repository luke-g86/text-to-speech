//
//  DataError.swift
//  textToSpeech
//
//  Created by Lukasz Gajewski on 19/09/2019.
//  Copyright © 2019 Lukasz Gajewski. All rights reserved.
//

import Foundation

enum DataFetchError: Error {
    
    case network
    case decoding
    
    var details: String {
        switch self {
        case .network:
           return "Fetching data failed"
        case .decoding:
           return "Failed to decode data"
        }
    }
}
