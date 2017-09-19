//
//  Validating.swift
//  TeepsTools
//
//  Created by Casey Barth on 9/19/17.
//  Copyright © 2017 teeps. All rights reserved.
//

protocol Validating {
  var fieldType: RegexType? { get set }
  var customRegex: String? { get set }
}

extension Validating where Self: UITextField {
  var validates: Bool {
    guard let text = self.text else { return true }
    if let customRegex = customRegex {
      return matches(for: customRegex, in: text)
    }
    
    guard let type = fieldType else { return true }
    return matches(for: type.rawValue, in: text)
  }
  
  func matches(for regexPattern: String, in text: String) -> Bool {
    return text.range(of: regexPattern,
                      options: [.regularExpression, .caseInsensitive]) != nil
  }
}

