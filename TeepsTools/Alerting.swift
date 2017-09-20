//
//  Alerting.swift
//  TeepsTools
//
//  Created by Casey Barth on 9/19/17.
//  Inspired by James Smith
//  Copyright © 2017 teeps. All rights reserved.
//

import UIKit

/** USAGE:
showAlert(withTitle: "Congratulations", description: "You're a winner")
showError(error)
showError(withDescription: "You must include your name")
 */
public protocol Alerting {
  func showAlert(withTitle title: String, description: String)
}

public extension Alerting where Self: UIViewController {
  func showAlert(withTitle title: String, description: String) {
    let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
    self.present(alert, animated: true, completion: nil)
  }
  
  /// Show an error with the default title
  func showError(withDescription description: String) {
    showAlert(withTitle: "Sorry!", description: description)
  }
  
  /// Show an error displaying the reason it occurred
  func showError(_ error: NSError) {
    let description = error.localizedFailureReason ?? error.localizedDescription
    showError(withDescription: description)
  }
  
  /// Show an error displaying the reason it occurred
  func showError(_ error: Error) {
    self.showError((error as Any) as! NSError)
  }
}
