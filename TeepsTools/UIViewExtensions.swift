//
//  UIViewExtensions.swift
//  TeepsTools
//
//  Created by Chayel Heinsen on 8/31/18.
//  Copyright © 2018 teeps. All rights reserved.
//

import UIKit

public extension UIView {
  /**
   Sets autoresizing for a view
   
   - Parameter withAttributes: The attributes to set for autoresizing. Defaults to [.flexibleHeight, .flexibleWidth]
   */
  public func setAutoresizing(withAttributes attributes: UIViewAutoresizing = [.flexibleHeight, .flexibleWidth]) {
    self.autoresizingMask = attributes
  }
}

public extension UIView {
  /**
   Creates an TapGestureRecognizer and sets the action to the `action` closure.
   
   ```
   myView.onTap {
     // Do something
   }
   ```
   
   - Parameter action: A closure that will be called when the view is tapped.
   */
  public func onTap(action: (() -> Void)?) {
    isUserInteractionEnabled = true
    tapGestureRecognizerAction = action
    let tapGestureRecognizer = UITapGestureRecognizer(
      target: self,
      action: #selector(handleTapGesture)
    )
    addGestureRecognizer(tapGestureRecognizer)
  }
  
  private struct AssociatedObjectKeys {
    static var tapGestureRecognizer = "TeepsToolsAssociatedObjectKey_tap"
  }
  
  private typealias Action = (() -> Void)?
  
  private var tapGestureRecognizerAction: Action? {
    set {
      if let newValue = newValue {
        objc_setAssociatedObject(
          self,
          &AssociatedObjectKeys.tapGestureRecognizer,
          newValue,
          objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN
        )
      }
    }
    get {
      let tapGestureRecognizerActionInstance = objc_getAssociatedObject(
        self,
        &AssociatedObjectKeys.tapGestureRecognizer
        ) as? Action
      return tapGestureRecognizerActionInstance
    }
  }
  
  @objc private func handleTapGesture(sender: UITapGestureRecognizer) {
    if let action = tapGestureRecognizerAction {
      action?()
    } else {
      print("no action")
    }
  }
}
