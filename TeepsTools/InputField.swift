//
//  InputField.swift
//  TeepsTools
//
//  Created by Casey Barth on 9/19/17.
//  Copyright © 2017 teeps. All rights reserved.
//

/** USAGE:
 Storyboard: 
 Set custom class of a TextField to InputField.
 Create an outlet in your view.
 Set the fieldType - inputField.fieldType = .email
 
 Programatically:
 Using prebuilt field types - let inputField = InputField(fieldType: .email)
 Using custom regex - let inputField = InputField(customRegex: "[0-9a-fxA-FX]")
 
 Validate input matches Regex by calling inputField.validates
*/
 

public class InputField: UITextField, Validating {
  var fieldType: RegexType?
  var customRegex: String?
  
  convenience init(fieldType: RegexType) {
    self.init()
    self.fieldType = fieldType
  }
  
  convenience init(customRegex: String) {
    self.init()
    self.customRegex = customRegex
  }
}
