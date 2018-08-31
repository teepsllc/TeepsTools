[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# TeepsTools
A collection of useful reusable utilities, helpers, extensions, and views that we use to help boost productivity and code quality.

## Available Tools
### [Jumping](https://github.com/teepsllc/TeepsTools/blob/master/TeepsTools/Jumping.swift)
A text field navigation protocol that allows you to easily configure keyboard navigation through your textfields.

### [HexColor](https://github.com/teepsllc/TeepsTools/blob/master/TeepsTools/HexColor.swift)
An extension on UIColor to enable initialization with hex strings.

### [Alerting](https://github.com/teepsllc/TeepsTools/blob/master/TeepsTools/Alerting.swift)
A protocol that allows you to show simple alerts easily.

### [ImagePicking](https://github.com/teepsllc/TeepsTools/blob/master/TeepsTools/ImagePicking.swift)
A protocol for showing an image picker.

### [InputField](https://github.com/teepsllc/TeepsTools/blob/master/TeepsTools/InputField.swift)
A custom TextField that validates input against a pre-defined regex or custom.

### [NibLoadable](https://github.com/teepsllc/TeepsTools/blob/master/TeepsTools/NNibLoadable.swift)
A protocol for loading quickly loading views from nibs.

### [Registerable](https://github.com/teepsllc/TeepsTools/blob/master/TeepsTools/Registerable.swift)
A protocol to register and load TableView and CollectionView cells.

### [UIViewExtensions](https://github.com/teepsllc/TeepsTools/blob/master/TeepsTools/UIViewExtensions.swift)
Some extensions for UIView to enable some things like onTap closures.

[NSObjectExtensions](https://github.com/teepsllc/TeepsTools/blob/master/TeepsTools/NSObjectExtensions.swift)
Some extensions for NSObject and NSObjectProtocol. Adds easier KVO and bindings.

## Carthage Installation
To integrate TeepsTools into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "teepsllc/TeepsTools"
```

### Integration
To import all tools into your file

```swift
import TeepsTools
```
