//
//  CookieImages.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 18/02/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import Foundation
import UIKit

enum Imagenes {
    public static let basicClosed = UIImage(named: "basic_closed")
    public static let basicOpen   = UIImage(named: "basic_open")
    public static let basicPop    = UIImage(named: "basic_pop")
    public static let basicTop    = UIImage(named: "basic_top")
    public static let basicLuck   = UIImage(named: "basic_frame")
    
    public static let loveClosed = UIImage(named: "lovecookie")
    public static let loveOpen   = UIImage(named: "loveBroken")
    public static let lovePop    = UIImage(named: "lovePop")
    public static let loveTop    = UIImage(named: "topLove")
    public static let loveLuck   = UIImage(named: "loveFrame")
    
    public static let badClosed = UIImage(named: "badcookie")
    public static let badOpen   = UIImage(named: "badBroken")
    public static let badPop    = UIImage(named: "badPop")
    public static let badTop    = UIImage(named: "topBad")
    public static let badLuck   = UIImage(named: "badFrame")
}

enum Colours {
    public static let basicBackground = UIColor(red:1.00, green:0.00, blue:0.00, alpha:1.0)
    public static let basicTap        = UIColor(red:1.00, green:0.80, blue:0.00, alpha:1.0)
    public static let basicLuck       = UIColor(red:0.80, green:0.00, blue:0.00, alpha:1.0)
    
    public static let badBackground = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
    public static let badTap        = UIColor(red:0.93, green:0.98, blue:1.00, alpha:1.0)
    public static let badLuck       = UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0)
    
    public static let loveBackground = UIColor(red:0.92, green:0.38, blue:0.52, alpha:1.0)
    public static let loveTap        = UIColor(red:0.57, green:0.18, blue:0.31, alpha:1.0)
    public static let loveLuck       = UIColor(red:0.57, green:0.18, blue:0.31, alpha:1.0)
}
