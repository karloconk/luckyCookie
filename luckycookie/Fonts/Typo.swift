//
//  Typo.swift
//
//  Created by Karlo Hurtado  on 23/01/20.
//  Copyright © 2020 Karlo Hurtado . All rights reserved.
//

import UIKit
import Foundation

public enum Typo {
    public static let h1      = Font.getFont( size: (SpaceUnits.five - SpaceUnits.quarter), isBold: true)
    public static let h2      = Font.getFont( size: (SpaceUnits.three), isBold: true)
    public static let h3Bold  = Font.getFont( size: (SpaceUnits.two), isBold: true)
    public static let h3      = Font.getFont( size: (SpaceUnits.two), isBold: false)
    public static let paragraph     = Font.getFont( size: (SpaceUnits.two - SpaceUnits.quarter), isBold: false)
    public static let paragraphBold = Font.getFont( size: (SpaceUnits.two - SpaceUnits.quarter), isBold: true)
    public static let small         = Font.getFont( size: (SpaceUnits.two - SpaceUnits.half), isBold: false)
    public static let smallBold     = Font.getFont( size: (SpaceUnits.two - SpaceUnits.half), isBold: true)
    public static let ten           = Font.getFont( size: (SpaceUnits.one + SpaceUnits.quarter), isBold: false)
    public static let tenBold       = Font.getFont( size: (SpaceUnits.one + SpaceUnits.quarter), isBold: true)
}
