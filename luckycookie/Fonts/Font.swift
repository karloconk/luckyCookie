//
//  Fonts.swift
//  albo
//
//  Created by Karlo Hurtado  on 23/01/20.
//  Copyright © 2020 Karlo Hurtado . All rights reserved.
//

import UIKit

public class Font {
    
    public class func getFont(size: CGFloat, isBold: Bool) -> UIFont {
        let font = isBold ? UIFont.systemFont(ofSize: size, weight: UIFont.Weight.bold) : UIFont.systemFont(ofSize: size)
        return font
    }
    
    public class func getbigFont(size: CGFloat) -> UIFont {
        let font = UIFont(name: "theboldfont", size: size)!
        return font
    }
    
    public class func getAttributes(lineSpacing: Double, fontColour: UIColor, typo: UIFont, isUnderlined: Bool) -> [NSAttributedString.Key : NSObject] {
        let pstyle = NSMutableParagraphStyle()
        pstyle.lineSpacing = CGFloat(lineSpacing)
        if isUnderlined {
            let myAttributesUnderlined = [
                NSAttributedString.Key.foregroundColor: fontColour,
                NSAttributedString.Key.font:            typo,
                NSAttributedString.Key.paragraphStyle:  pstyle,
                NSAttributedString.Key.underlineStyle:  NSUnderlineStyle.single.rawValue] as [NSAttributedString.Key : Any]
            return myAttributesUnderlined as! [NSAttributedString.Key : NSObject]
        }
        let myAttributes = [
            NSAttributedString.Key.foregroundColor: fontColour,
            NSAttributedString.Key.font:            typo,
            NSAttributedString.Key.paragraphStyle : pstyle ]
        return myAttributes
    }
    
    
}
