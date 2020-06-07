# OneTimeCodeView

Simple iOS library written in swift, which provides a `UITextField` for `.oneTimeCode` with a great UX

👨‍💻 iOS 10+ <3 CocoaPods
🦸‍♂️ Automatically fills second-factor code from SMS     
🧙‍♀️ Hidden cursor      
🤳 Easy to use  

## Installation

```
  pod 'OneTimeCodeView', '~> 1.0.1'
```    

## Filled code view
![Filled view](https://github.com/nethergrim/OneTimeCodeView/blob/master/res/filled.png)

## Empty view
![Empty view](https://github.com/nethergrim/OneTimeCodeView/blob/master/res/empty.png)

## Usage
```swift
@IBOutlet weak var oneTimeCodeView: OneTimeCodeView!

    override func viewDidAppear(_ animated: Bool) {
       // required:
      self.oneTimeCodeView.configure(countOfDigits: NUMBER_COUNT)
      self.oneTimeCodeView.didEnterLastDigit = { [weak self] (code) -> () in
          print(code)
          // TODO verify the code
      }
    }

    // (optional) if you want to clear OneTimeCodeView if verification fails
    func onVerificationError(error: Error) {
        self.oneTimeCodeView.clear()
        // display an error message
    }

```
