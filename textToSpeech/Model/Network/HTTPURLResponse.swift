//
//  HTTPURLResponse.swift
//  textToSpeech
//
//  Created by Lukasz Gajewski on 19/09/2019.
//  Copyright © 2019 Lukasz Gajewski. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    var connectionSuccessful: Bool {
        return 200...299 ~= statusCode
    }
}
