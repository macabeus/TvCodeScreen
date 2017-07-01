//
//  InputButton.swift
//  TvCodeScreen
//
//  Created by Bruno Macabeus Aquino on 29/06/17.
//  Copyright © 2017 Bruno Macabeus Aquino. All rights reserved.
//

import UIKit

class InputButton: UIButton {
    
    let associatedCharacter: Character
    let backgroundFocusedColor: UIColor
    
    init(associatedCharacter: Character, target: Any?, action: Selector?, labelColor: UIColor, backgroundFocusedColor: UIColor) {
        
        self.associatedCharacter = associatedCharacter
        self.backgroundFocusedColor = backgroundFocusedColor
        
        super.init(frame: CGRect.zero)
        
        setTitle(String(associatedCharacter), for: .normal)
        setTitleColor(labelColor, for: .normal)
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 5
        
        if let target = target, let action = action {
            addTarget(target, action: action, for: .primaryActionTriggered)
        }
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        if context.nextFocusedItem === self {
            coordinator.addCoordinatedAnimations({
                self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                self.backgroundColor = self.backgroundFocusedColor
                self.layer.shadowOpacity = 0.2
            })
        } else {
            coordinator.addCoordinatedAnimations({
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.backgroundColor = .clear
                self.layer.shadowOpacity = 0
            })
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
}
