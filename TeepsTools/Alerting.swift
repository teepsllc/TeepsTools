//
//  Alerting.swift
//  TeepsTools
//
//  Created by Casey Barth on 9/19/17.
//  Inspired by James Smith
//  Copyright © 2017 teeps. All rights reserved.
//

import UIKit

/**
 Protocol to easily show alerts
 */
public protocol Alerting {
  /**
   Call to show an alert. You can also use showError()
   
   ```
   showAlert(withTitle: "Congratulations", description: "You're a winner")
   ```
   
   - Parameter title: The title of the alert
   - Parameter description: The message of the alert
   */
  func showAlert(withTitle title: String, description: String)
}

public extension Alerting where Self: UIViewController {
  func showAlert(withTitle title: String, description: String) {
    let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
    self.present(alert, animated: true, completion: nil)
  }
  
  /**
   Call to show an error alert
   
   ```
   showError(withDescription: "You must include your name")
   ```
   
   - Parameter description: The message of the alert
   */
  func showError(withDescription description: String) {
    showAlert(withTitle: "Sorry!", description: description)
  }
  
  /**
   Call to show an error alert
   
   ```
   showError(error)
   ```
   
   - Parameter error: The error to use to show an alert. Will use the localizedFailureReason or localizedDescription
   */
  func showError(_ error: NSError) {
    let description = error.localizedFailureReason ?? error.localizedDescription
    showError(withDescription: description)
  }
  
  /**
   Call to show an error alert
   
   ```
   showError(error)
   ```
   
   - Parameter error: The error to use to show an alert. Will use the localizedFailureReason or localizedDescription
   */
  func showError(_ error: Error) {
    self.showError((error as Any) as! NSError)
  }
}
