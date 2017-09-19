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
showError(withTitle: "Oops!", description: "You must include your name")
 */
protocol Alerting {
  func showError(withTitle title: String, description: String)
}

extension Alerting where Self: UIViewController {
  func showError(withTitle title: String, description: String) {
    let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
    self.present(alert, animated: true, completion: nil)
  }
  
  /// Show an error with the default title
  func showError(withDescription description: String) {
    showError(withTitle: "Sorry!", description: description)
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
