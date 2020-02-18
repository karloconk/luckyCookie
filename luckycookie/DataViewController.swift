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
    @IBOutlet weak var luckyLabel: UILabel!
    @IBOutlet weak var luckyImage: UIImageView!
    @IBOutlet weak var fondo: UIView!
    @IBOutlet weak var bottomLabel: UILabel!
    
    //MARK:- Vars
    var currentTitle: String = "Basic"
    var index: Int?
    let topSeparatorHideSecs = 0.25
    var touched = false

    //MARK:- Actions
    
    @IBAction func buttonTapped(_ sender: Any) {
        if touched {
            reset()
        } else {
            popCookie()
            hideTopSeparator()
            showMessage()
        }
    }
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fondo.alpha        = 0.0
        self.topSeparator.alpha = 1.0
        if self.index ?? 0 < 1 {
            setBackground(image: UIImage(named: "basic_fondo")!)
        } else {
            self.view.backgroundColor = UIColor.random()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        GlobalVars.currentBolita = self.index!
    }
    
    //MARK:- Functions
                
    func setBackground(image: UIImage) {
        let backgroundColor = UIColor(patternImage: image)
        self.view.backgroundColor = backgroundColor
    }
    
    func hideTopSeparator() {
        UIView.animate(withDuration: 0.8, delay: 0.25, options: .curveLinear, animations: {
            self.topSeparator.alpha = 0.0
        }, completion: nil)
    }
    
    func popCookie() {
        self.mainImage.image   = UIImage(named: "basic_open")
        self.popImage.isHidden = false
    }

    func showMessage() {
        chooseMessage()
        UIView.animate(withDuration: 0.8, delay: 0.25, options: .curveLinear, animations: {
            self.fondo.alpha = 1.0
        }, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8 + 0.25) {
            self.touched = true
            self.bottomLabel.text = "Try again"

        }
    }
    
    func chooseMessage() {
        luckyLabel.text = "KKDPRRO"
    }
    
    func reset() {
        self.fondo.alpha = 0.0
        self.popImage.isHidden = true
        self.mainImage.image   = UIImage(named: "basic_closed")
        UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveLinear, animations: {
            self.topSeparator.alpha = 1.0
        }, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.touched = false
            self.bottomLabel.text = "Get Lucky"
        }
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
