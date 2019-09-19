//
//  Codable.swift
//  textToSpeech
//
//  Created by Lukasz Gajewski on 19/09/2019.
//  Copyright © 2019 Lukasz Gajewski. All rights reserved.
//

import Foundation

struct News: Codable {
    
    let status: String
    let totalResults: Int
    let articles: [Articles]
    
}
