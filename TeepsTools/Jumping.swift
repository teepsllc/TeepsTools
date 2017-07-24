//
//  Jumping.swift
//  Teeps llc.
//
//  Created by Casey Barth on 7/24/17.
//  Copyright © 2017 teeps. All rights reserved.
//

import UIKit

/** USAGE:
 ViewController must conform to UITextFieldDelegate and Jumping
 */

public protocol Jumping: class {
  /**
   Outlets array defines the direction in which navigation will be handled
   */
  var fields: [UITextField] { get }
}

public extension Jumping where Self: UITextFieldDelegate, Self: UIViewController {
  
  /**
   Jump should be called within the textFieldShouldReturn delegate method
   Parameter: textField being returned
   This will handle navigation to each field in the fields array and
   dismisal of keyboard on final textfield
   */
  public func jump(from textField: UITextField) {
    if textField == fields.last {
      textField.resignFirstResponder()
      return
    }
    guard let idx = fields.index(of: textField) else { return }
    fields[idx + 1].becomeFirstResponder()
  }
  
  /**
   Sets the delegate for every text field to be navigated
   */
  public func setDelegates() {
    fields.forEach { textField in
      textField.delegate = self
    }
  }
}
