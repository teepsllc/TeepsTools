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

## Carthage Installation
To integrate TeepsTools into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "teepsllc/TeepsTools"
```
### Integration
To import all tools into your file:
i.e

```swift
import TeepsTools
```

If you need to import a single tool: `import TeepsTools.<TOOL>`
i.e

```swift
import TeepsTools.Jumping
```

## Adding a new tool
Adding a new tool is fairly simple.

1. Add your new tool under the modules folder in Xcode.
2. Create a header file, named the same as your module.
3. Go to Build Phases > Headers and add your header to the Public section.
4. Open `module.modulemap` and add your new module.

```swift
framework module TeepsTools {
  // Add your new module here
  module MyTool {
    header "MyTool.h"
  }
}
```
