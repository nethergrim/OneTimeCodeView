#
#  Be sure to run `pod spec lint OneTimeCodeView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "OneTimeCodeView"
  spec.version      = "1.0.0"
  spec.summary      = "Simple iOS library written in swift, which provides a UITextField for .oneTimeCode with a great UX"
  spec.description      = <<-DESC
This is a handy replacement for UITextField which should be used with .oneTimeCode (2FA, second factor)
Accessible from iOS 12
                     DESC

  spec.homepage     = "https://github.com/nethergrim/OneTimeCodeView"
  spec.screenshots  = "https://github.com/nethergrim/OneTimeCodeView/blob/master/res/filled.png?raw=true", "https://github.com/nethergrim/OneTimeCodeView/blob/master/res/empty.png?raw=true"
  spec.license      = "MIT"
  spec.author             = { "Andrii Drobiazko" => "c2q9450@gmail.com" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :git => "https://github.com/nethergrim/OneTimeCodeView.git", :tag => "#{spec.version}" }
  spec.source_files  = 'OneTimeCodeView/*.{h,m,swift}'
  spec.swift_version = '4.0'
  spec.ios.deployment_target  = '12.0'
  spec.ios.framework  = 'UIKit'
end
