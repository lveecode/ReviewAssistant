
[![Version](https://img.shields.io/cocoapods/v/ReviewAssistant.svg?style=flat)](http://cocoapods.org/pods/ReviewAssistant)
[![License](https://img.shields.io/cocoapods/l/ReviewAssistant.svg?style=flat)](http://cocoapods.org/pods/ReviewAssistant)
[![Platform](https://img.shields.io/cocoapods/p/ReviewAssistant.svg?style=flat)](http://cocoadocs.org/docsets/ReviewAssistant)
[![Language](https://img.shields.io/badge/Swift-5-brightgreen.svg?style=flat)](http://cocoapods.org/pods/ReviewAssistant)


## Overview

# ReviewAssistant

Use ReviewAssistant to summon StoreKit's review controller without having to worry about pacing the review requests.  

- Track recent crashes with Crashlytics (recommended), save a crash cooldown date after a crash, the app will not ask for review until that date passes
- Only asks for review once per version
- Never requests for review more than once a day

## Installation

ReviewAssistant is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ReviewAssistant"
```

To generate an empty Podfile, navigate to your project folder and execute the following command:

```shell
$ pod init
```

If you do not have CocoaPods installed, run installation command first:

```shell
$ sudo gem install cocoapods
```

If you do not want to use CocoaPods, you can checkout the repository and copy framework files to your project manually.

## Requirements

- iOS11 and higher

## Author

Lesya V, lveecode@gmail.com

## License

Available under the MIT license. See the LICENSE file for more info.
