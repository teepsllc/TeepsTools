//
//  Jumping.swift
//  Teeps llc.
//
//  Created by Casey Barth on 7/24/17.
//  Copyright © 2017 teeps. All rights reserved.
//

import UIKit

/**
 Protocol to jump through TextFields.
 
 ```
 class ViewController: UITextFieldDelegate, Jumping {
   @IBOutlet weak var textfield1: UITextField!
   @IBOutlet weak var textfield2: UITextField!
 
   var textFields: [UITextField] {
     return [textfield1, textfield2]
   }
 
   override func viewDidLoad() {
     super.viewDidLoad()
     setTextFieldsDelegate()
   }
 }
 ```
 */
public protocol Jumping: class {
  /**
   Array of TextFields. The indices define the direction in which navigation will be handled.
   */
  var textFields: [UITextField] { get }
}

public extension Jumping where Self: UITextFieldDelegate, Self: UIViewController {
  /**
   jump should be called within the textFieldShouldReturn delegate method
   This will handle navigation to each field in the fields array and
   dismisal of keyboard on final textfield
   
   ```
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     jump(from: textField)
     return true
   }
   ```
   
   - Parameter textField: The current textfield
   */
  public func jump(from textField: UITextField) {
    if textField == textFields.last {
      textField.resignFirstResponder()
      return
    }
    guard let idx = textFields.index(of: textField) else { return }
    textFields[idx + 1].becomeFirstResponder()
  }
  
  /**
   Sets the delegate for every text field to be navigated
   */
  public func setTextFieldsDelegate() {
    textFields.forEach { $0.delegate = self }
  }
}
