# OneTimeCodeView

It's a simple iOS library written in swift, which provides a `UITextField` for `.oneTimeCode` with a great UX

👨‍💻  Written in Swift 5
🦸‍♂️ Automatically fills second-factor code from SMS
🧙‍♀️ Hidden cursor
🤳  Easy to use

## Filled code view
![Filled view](https://github.com/nethergrim/OneTimeCodeView/blob/master/res/filled.png)

## Empty view
![Empty view](https://github.com/nethergrim/OneTimeCodeView/blob/master/res/empty.png)

## Usage
```swift
@IBOutlet weak var oneTimeCodeView: OneTimeCodeView!

    override func viewDidAppear(_ animated: Bool) {
        oneTimeCodeView.configure()
    }
```
