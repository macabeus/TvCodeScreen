//
//  CodeInputView.swift
//  TvCodeScreen
//
//  Created by Bruno Macabeus Aquino on 28/06/17.
//  Copyright © 2017 Bruno Macabeus Aquino. All rights reserved.
//

import UIKit

public protocol CodeInputViewDelegate {
    /**
     Delegate called when the user fill the code
     - parameter codeInputView: The CodeInputView that called this function
     - parameter codeText: Text typed by user
     */
    func finishTyping(_ codeInputView: CodeInputView, codeText: String)
}

public class CodeInputView: UIView {
    
    @IBInspectable public var codeLength: Int = 0
    private var codeLabels: [UILabel] = []
    private var currentCharacterSlotToType = 0
    public var delegate: CodeInputViewDelegate?
    public var codeText: String {
        return codeLabels.map({  $0.text! }).joined(separator: "")
    }
    
    public override func awakeFromNib() {
        // set the default value for code length
        if codeLength <= 0 {
            codeLength = 6
        }
        
        //
        drawComponent()
    }
    
    func drawComponent() {
        backgroundColor = .clear
        
        ////
        // Draw the placeholder labels
        for _ in 0..<codeLength {
            let label = UILabel()
            label.frame.size = CGSize(width: 110, height: 120)
            label.font = label.font.withSize(120) // todo: use dynamic type to set the size of label
            label.backgroundColor = .lightGray
            label.textColor = .black
            label.textAlignment = .center
            
            label.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            label.text = " "
            
            codeLabels.append(label)
        }
        
        // stackview and autolayout for the labels
        let stackLabels = UIStackView(arrangedSubviews: codeLabels)
        stackLabels.axis = .horizontal
        stackLabels.distribution = .equalSpacing
        stackLabels.alignment = .center
        stackLabels.spacing = 30
        
        addSubview(stackLabels)

        stackLabels.heightAnchor.constraint(equalToConstant: 120).isActive = true
        stackLabels.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackLabels.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackLabels.translatesAutoresizingMaskIntoConstraints = false
        
        ////
        // Draw buttons
        enum buttonTypeNumber {
            case pos(Int)
            
            var specification: (title: Character, target: Any, action: Selector)? {
                switch self {
                case .pos(let number) where number < 10:
                    return (
                        title: String(number).characters.first ?? " ",
                        target: self,
                        action: #selector(buttonTypeCharacter(_:))
                    )
                case .pos(10):
                    return (
                        title: "<",
                        target: self,
                        action: #selector(buttonRemoveCharacter(_:))
                    )
                default:
                    return nil
                }
            }
        }
        
        var buttons: [InputButton] = []
        for i in 0...10 {
            guard let currentSpecification = buttonTypeNumber.pos(i).specification else {
                continue
            }
            
            let button = InputButton(
                associatedCharacter: currentSpecification.title,
                target: currentSpecification.target,
                action: currentSpecification.action
            )
            
            buttons.append(button)
        }
        
        // stackview and autolayout for the buttons
        let stackButtons = UIStackView(arrangedSubviews: buttons)
        stackButtons.axis = .horizontal
        stackButtons.distribution = .equalSpacing
        stackButtons.alignment = .center
        stackButtons.spacing = 20
        
        addSubview(stackButtons)
        
        stackButtons.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stackButtons.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackButtons.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackButtons.translatesAutoresizingMaskIntoConstraints = false
    }

    func buttonTypeCharacter(_ sender: InputButton) {
        addCharacterToTheCode(character: sender.associatedCharacter)
    }
    
    func buttonRemoveCharacter(_ sender: InputButton) {
        removeCharacterToTheCode()
    }
    
    /**
     Add a character to the code
     */
    func addCharacterToTheCode(character: Character) {
        if currentCharacterSlotToType == codeLength {
            return
        }
        
        codeLabels[currentCharacterSlotToType].text = String(character)
        currentCharacterSlotToType += 1
        
        if currentCharacterSlotToType == codeLength {
            delegate?.finishTyping(self, codeText: codeText)
        }
    }
    
    /**
     Remove the last character in the code
     */
    func removeCharacterToTheCode() {
        if currentCharacterSlotToType == 0 {
            return
        }
        
        codeLabels[currentCharacterSlotToType - 1].text = " "
        currentCharacterSlotToType -= 1
    }
}
