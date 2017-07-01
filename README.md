[![Version](https://img.shields.io/cocoapods/v/TvCodeScreen.svg?style=flat)](http://cocoapods.org/pods/TvCodeScreen)
[![License](https://img.shields.io/cocoapods/l/TvCodeScreen.svg?style=flat)](http://cocoapods.org/pods/TvCodeScreen)
[![Platform](https://img.shields.io/cocoapods/p/TvCodeScreen.svg?style=flat)](http://cocoapods.org/pods/TvCodeScreen)

# TvCodeScreen
Simple code screen for tvOS

![](http://i.imgur.com/KRrcssn.png)

You can download this repository and see this example app.

# How to use

## Install
In `Podfile` add
```
pod 'TvCodeScreen'
```

and use `pod install`.

## Setup

Create a new UIView and set `CodeInputView` as a custom class
![](http://i.imgur.com/o17Ts1I.png)

In Attribute Inspector tab you can change the code length and colors. The default code length value is 6 characters.

Then, your view controller need subscriber the `CodeInputViewDelegate` protocol. For example:

```swift
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
```

The function `finishTyping(codeInputView:codeText:)` is called when the user fill the code, and the parameter `codeText` is the text typed by user.

# TODO
- [ ] Use dynamic type
- [ ] Suport for letters

**Maintainer**:

> [macabeus](http://macalogs.com.br/) &nbsp;&middot;&nbsp;
> GitHub [@macabeus](https://github.com/macabeus)
