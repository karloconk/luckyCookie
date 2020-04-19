//
//  StoryBoardsBasics.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 18/04/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import Foundation
import UIKit

fileprivate enum Storyboards{
    public static let main = "Main"
}

fileprivate extension UIStoryboard {
    
    static func load(identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
}

extension UIStoryboard {

    class func goToGalleta() -> FirstViewController {
        return load(identifier: "GalletaDeLaFortuna") as! FirstViewController
    }
    
    class func goToColours() -> ColoursViewController {
        return load(identifier: "coloresmn") as! ColoursViewController
    }
    
    class func goToBolaocho() -> bolaOchoViewController {
        return load(identifier: "bolaocho") as! bolaOchoViewController
    }
}

