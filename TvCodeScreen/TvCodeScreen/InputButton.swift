//
//  InputButton.swift
//  TvCodeScreen
//
//  Created by Bruno Macabeus Aquino on 29/06/17.
//  Copyright © 2017 Bruno Macabeus Aquino. All rights reserved.
//

import UIKit

class InputButton: UIButton {
    
    var associatedCharacter: Character
    
    init(associatedCharacter: Character, target: Any?, action: Selector?) {
        self.associatedCharacter = associatedCharacter
        
        super.init(frame: CGRect.zero)
        
        setTitle(String(associatedCharacter), for: .normal)
        setTitleColor(.gray, for: .normal)
        
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
                self.backgroundColor = .white
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
