//
//  GamesViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 14/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class GamesViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override public var shouldAutorotate: Bool {
        return false
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
}

