//
//  ViewController.swift
//  textToSpeech
//
//  Created by Lukasz Gajewski on 15/09/2019.
//  Copyright © 2019 Lukasz Gajewski. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Text to speech"
        textField.text = "Hello world"
        textField.delegate = self
        setButton()
    }

    
    func textToSpeech() {
        guard let text = textField.text else {return}
        let speak = TextToSpeech.init(textToBeSaid: text)
        speak.speak()
    }
    
    func setButton() {
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 4
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
       textToSpeech()
    }

}


extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.text = nil
        return true 
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.hasText {
        textToSpeech()
        }
        return true
        
    }
}
