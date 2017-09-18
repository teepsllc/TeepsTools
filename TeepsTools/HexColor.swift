//
//  HexColor.swift
//  TeepsTools
//
//  Created by Chayel Heinsen & Casey Barth on 9/18/17.
//  Copyright © 2017 teeps. All rights reserved.
//

import UIKit

/** USAGE:
 UIColor("#FFFFFF")
 UIColor("FFFFFF")
 UIColor("FFFFFF", alpha: 1)
 */
public extension UIColor {
  public convenience init(_ hex: String, alpha: CGFloat = 1) {
    var sanitzedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if sanitzedHex.hasPrefix("#") {
      sanitzedHex.remove(at: sanitzedHex.startIndex)
    }
    
    var rgbValue: UInt32 = 0
    Scanner(string: sanitzedHex).scanHexInt32(&rgbValue)
    
    self.init(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255,
      blue: CGFloat(rgbValue & 0x0000FF) / 255,
      alpha: alpha
    )
  }
}
