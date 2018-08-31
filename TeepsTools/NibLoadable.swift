//
//  NibLoadable.swift
//  TeepsTools
//
//  Created by Chayel Heinsen on 8/31/18.
//  Copyright © 2018 teeps. All rights reserved.
//

import UIKit

/**
 Protocol is quickly load nibs
 */
@objc public protocol NibLoadable {
  @objc var nibName: String { get }
  func loadViewFromNib() -> UIView
}

extension UIView: NibLoadable {
  /**
   The name of the nib file to look for. Defaults to the name of the UIView.
   */
  public var nibName: String {
    return String(describing: type(of: self))
  }
  
  /**
   Loads a view from a nib.
   
   ```
   view.loadViewFromNib()
   ```
   
   - Returns: A new UIView
   */
  public func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: nibName, bundle: bundle)
    // swiftlint:disable:next force_cast
    return nib.instantiate(withOwner: self, options: nil)[0] as! UIView
  }
}
