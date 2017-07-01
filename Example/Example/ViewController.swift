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
        setBackground()
    }
    
    func setBackground() {
        let gradientLayer = CAGradientLayer()
        self.view.backgroundColor = .white
        
        gradientLayer.frame = self.view.bounds
        
        let color1 = #colorLiteral(red: 0.3294117647, green: 0.2117647059, blue: 0.3882352941, alpha: 1).cgColor
        let color2 = #colorLiteral(red: 0.2823529412, green: 0.1921568627, blue: 0.3490196078, alpha: 1).cgColor
        let color3 = #colorLiteral(red: 0.2705882353, green: 0.1921568627, blue: 0.3450980392, alpha: 1).cgColor
        let color4 = #colorLiteral(red: 0.1411764706, green: 0.1529411765, blue: 0.2549019608, alpha: 1).cgColor
        gradientLayer.colors = [color1, color2, color3, color4]
        
        gradientLayer.startPoint = CGPoint(x: 0.35, y: 0.25)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.6)
        gradientLayer.zPosition = -1
        
        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        
        self.view.layer.addSublayer(gradientLayer)
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
