//
//  TextToSpeech.swift
//  textToSpeech
//
//  Created by Lukasz Gajewski on 15/09/2019.
//  Copyright © 2019 Lukasz Gajewski. All rights reserved.
//

import UIKit
import AVFoundation

class TextToSpeech {
    
    let textToBeSaid: String
    
    init(textToBeSaid:String) {
        self.textToBeSaid = textToBeSaid
    }
    
    func speak() {
        
        let utterance = AVSpeechUtterance(string: textToBeSaid)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-En")
        utterance.rate = 0.4
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
   
    
}
