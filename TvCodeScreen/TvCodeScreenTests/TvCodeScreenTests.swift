//
//  TvCodeScreenTests.swift
//  TvCodeScreenTests
//
//  Created by Bruno Macabeus Aquino on 04/07/17.
//  Copyright © 2017 Bruno Macabeus Aquino. All rights reserved.
//

@testable import TvCodeScreen
import Quick
import Nimble

class DelegateTest: CodeInputViewDelegate {
    
    private var flagCalled: Bool = false
    
    func checkIfDelegateWasCalled() -> Bool {
        if flagCalled {
            flagCalled = false
            
            return true
        } else {
            return false
        }
    }
    
    func finishTyping(_ codeInputView: CodeInputView, codeText: String) {
        flagCalled = true
    }
}

class CodeInputViewSpec: QuickSpec {
    
    let newCodeLengthValue = 2
    
    func initializeCustomCodeInputView(delegate: DelegateTest? = nil) -> CodeInputView {
        let codeInputView = CodeInputView()
        let delegateTest = delegate
        codeInputView.delegate = delegateTest
        codeInputView.codeLength = newCodeLengthValue
        codeInputView.awakeFromNib()
        
        return codeInputView
    }
    
    override func spec() {
        describe("a CodeInputView") {
            describe("have codeLength") {
                it("with default value") {
                    let defaultCodeInputView = CodeInputView()
                    expect(defaultCodeInputView.codeLength).to(equal(6))
                }
                
                it("that we can change the default value") {
                    let codeInputView = self.initializeCustomCodeInputView()
                    expect(codeInputView.codeLength).to(equal(self.newCodeLengthValue))
                }
            }
            
            describe("that we created") {
                let codeInputView = self.initializeCustomCodeInputView()
                
                it("need be drawn with amount of code labels correctly") {
                    expect(codeInputView.codeLabels.count).to(equal(self.newCodeLengthValue))
                }
                
                it("need be drawn with amount of numeric input buttons correctly") {
                    let newNumericInputButtons = codeInputView.createNumericInputButtons()
                    
                    expect(newNumericInputButtons.count).to(equal(11))
                }
            }
            
            describe("can receive inputs") {
                let charNumber4 = Character("4")
                let charNumber2 = Character("2")
                
                it("write until fill code labels") {
                    let delegateTest = DelegateTest()
                    let codeInputView = self.initializeCustomCodeInputView(delegate: delegateTest)
                    
                    codeInputView.addCharacterToTheCode(character: charNumber4)
                    codeInputView.addCharacterToTheCode(character: charNumber2)
                    
                    expect(codeInputView.codeText).to(equal("42"))
                    expect(delegateTest.checkIfDelegateWasCalled()).to(equal(true))
                }
                
                it("write beyond the capacity") {
                    let delegateTest = DelegateTest()
                    let codeInputView = self.initializeCustomCodeInputView(delegate: delegateTest)
                    
                    codeInputView.addCharacterToTheCode(character: charNumber4)
                    codeInputView.addCharacterToTheCode(character: charNumber2)
                    
                    expect(codeInputView.codeText).to(equal("42"))
                    expect(delegateTest.checkIfDelegateWasCalled()).to(equal(true))
                    
                    codeInputView.addCharacterToTheCode(character: charNumber4)

                    expect(codeInputView.codeText).to(equal("42"))
                    expect(delegateTest.checkIfDelegateWasCalled()).to(equal(false))
                }
                
                it("erase and write again") {
                    let delegateTest = DelegateTest()
                    let codeInputView = self.initializeCustomCodeInputView(delegate: delegateTest)
                    
                    codeInputView.addCharacterToTheCode(character: charNumber4)
                    
                    codeInputView.removeCharacterToTheCode()
                    codeInputView.removeCharacterToTheCode()
                    
                    codeInputView.addCharacterToTheCode(character: charNumber4)
                    codeInputView.addCharacterToTheCode(character: charNumber2)
                    
                    expect(codeInputView.codeText).to(equal("42"))
                    expect(delegateTest.checkIfDelegateWasCalled()).to(equal(true))
                }
            }
        }
    }
}
