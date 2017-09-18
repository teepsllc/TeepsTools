//
//  HexColor.swift
//  TeepsTools
//
//  Created by Chayel Heinsen & Casey Barth on 9/18/17.
//  Copyright © 2017 teeps. All rights reserved.
//

import UIKit

/** USAGE:
 UIColor(hex: 0xFFFFFF)
 UIColor("#FFFFFF")
 UIColor("FFFFFF")
 */
public extension UIColor {
  public convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
    
    self.init(
      red: CGFloat(red) / 255,
      green: CGFloat(green) / 255,
      blue: CGFloat(blue) / 255,
      alpha: 1
    )
  }
  
  public convenience init(hex: Int) {
    self.init(
      red: (hex >> 16) & 0xFF,
      green: (hex >> 8) & 0xFF,
      blue: hex & 0xFF
    )
  }
  
  public convenience init(_ hex: String) {
    var sanitzedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if sanitzedHex.hasPrefix("#") {
      sanitzedHex.remove(at: sanitzedHex.startIndex)
    }
    
    var rgbValue: UInt32 = 0
    Scanner(string: sanitzedHex).scanHexInt32(&rgbValue)
    
    self.init(hex: Int(rgbValue))
  }
}
