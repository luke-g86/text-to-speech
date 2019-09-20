//
//  Articles.swift
//  textToSpeech
//
//  Created by Lukasz Gajewski on 19/09/2019.
//  Copyright © 2019 Lukasz Gajewski. All rights reserved.
//

import Foundation

struct Articles: Codable {
    
    let source: Source?
    let author: String?
    let title: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
}


struct Source: Codable {
    let id: String?
    let name: String?
}
