//
//  InputField.swift
//  TeepsTools
//
//  Created by Casey Barth on 9/19/17.
//  Copyright © 2017 teeps. All rights reserved.
//

class InputField: UITextField, Validating {
  var fieldType: RegexType?
  var customRegex: String?
}
