//
//  ViewController.swift
//  Example
//
//  Created by Bruno Macabeus Aquino on 28/06/17.
//  Copyright © 2017 Bruno Macabeus Aquino. All rights reserved.
//

import UIKit
import TvCodeScreen

class ViewController: UIViewController {

    @IBOutlet weak var myCodeInputView: CodeInputView!
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        myCodeInputView.delegate = self
    }
}

extension ViewController: CodeInputViewDelegate {
    
    func finishTyping(_ codeInputView: CodeInputView, codeText: String) {
        if codeText == "42" {
            labelResult.text = "Yes! Good number! 🎉"
        } else {
            labelResult.text = "No! Wrong number! 💥"
        }
    }
}
