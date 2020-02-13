//
//  DataViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 04/02/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var fondoView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var luckyButton: UIButton!
    @IBOutlet weak var popImage: UIImageView!
    @IBOutlet weak var topSeparator: UIImageView!
    
    //MARK:- Vars
    var currentTitle: String = "Basic"
    var index: Int?
    let topSeparatorHideSecs = 1.0

    //MARK:- Actions
    
    @IBAction func buttonTapped(_ sender: Any) {
        popCookie()
        hideTopSeparator()
    }
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.index ?? 0 < 1 {
            setBackground(image: UIImage(named: "basic_fondo")!)
        }
    }
    
    //MARK:- Functions
                
    func setBackground(image: UIImage) {
        let backgroundColor = UIColor(patternImage: image)
        self.view.backgroundColor = backgroundColor
    }
    
    func hideTopSeparator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + topSeparatorHideSecs) {
            self.topSeparator.isHidden = true
        }
    }
    
    func popCookie() {
        self.mainImage.image   = UIImage(named: "basic_open")
        self.popImage.isHidden = false
    }

}
