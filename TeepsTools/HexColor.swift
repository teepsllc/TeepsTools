//
//  HexColor.swift
//  TeepsTools
//
//  Created by Chayel Heinsen & Casey Barth on 9/18/17.
//  Copyright © 2017 teeps. All rights reserved.
//

import UIKit

public extension UIColor {
  /**
   Creates a color from a Hex value
   
   ```
   UIColor("#FFFFFF")
   UIColor("FFFFFF")
   UIColor("FFFFFF", alpha: 1)
   ```
   
   - Parameter hex: A hex string. The `#` is optional. `#FFFFFF` and `FFFFFF` will both return white.
   - Parameter alpha: The alpha of the color. Defaults to 1
   */
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
