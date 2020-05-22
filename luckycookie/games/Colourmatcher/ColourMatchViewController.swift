//
//  ColourMatchViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 19/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class ColourMatchViewController: UIViewController, ColorsViewDelegate {

    // MARK:- Outlets
    
    @IBOutlet weak var gobackBtn: UIButton!
    @IBOutlet weak var roundLbl: UILabel!
    
    // MARK:- Variables
    public var rounds = 1
    public var currentRound = 1
    var steptimes = 1
    var coloursVVV = ColorsView()
    
    // MARK:- Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        coloursVVV = ColorsView(frame: CGRect(x: CGFloat(0), y: CGFloat(0),
            width:  self.view.frame.width,
            height: self.view.frame.height), atY: 74)
        coloursVVV.delegate = self
        view.addSubview(coloursVVV)
        currentRound -= 1
        setRound()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
 
    // MARK:- Functions

    func setRound(){
        currentRound += 1
        if currentRound == rounds {
            roundLbl.text = "Último round"
        } else {
            roundLbl.text = "Round \(currentRound) de \(rounds)"
        }
    }
    
    func valueChanged(win: Bool) {
        if win {
            print("win")
            animateViewWin()
        } else {
            winfunc(lose: true)
        }
    }
    
    func animateViewWin() {
        if currentRound == rounds {
            winfunc(lose: false)
        } else {
            UIView.animate(withDuration: 0.7, delay: 0.2, options: .curveEaseInOut, animations: {
                self.coloursVVV.transform = CGAffineTransform(translationX: 0, y: (self.view.frame.height))
            }, completion: {(Bool) in
                self.coloursVVV.resete()
                UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseInOut, animations: {
                    self.coloursVVV.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: {(Bool) in self.setRound() })
            })
        }
    }
    
    func winfunc(lose: Bool) {
        let maWidth    = 400
        let maHeight   = 270
        let longWidth  = self.view.frame.width/2
        let longHeight = self.view.frame.height/2
        let winview = WinView(frame: CGRect(x: Int(longWidth) - maWidth/2,
                                            y: Int(longHeight) - maHeight/2 + 30,
                                            width: maWidth, height: maHeight),
                              titler: "¿Qué quieres hacer ahora?", viewController: self,
                              actionL:  #selector(ledft),
                              actionM:  #selector(redo),
                              actionR:  #selector(rigtht),
                              win: !lose)
        winview.alpha = 0.0
        view.addSubview(winview)
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveLinear, animations: {
            winview.alpha = 1.0
            winview.transform = CGAffineTransform(translationX: 0, y: -30)
        }, completion: {(Bool) in print("")})
    }
    
    // MARK:- @objc Functions
    
    @objc func ledft() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func redo() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rigtht() {
        MyGVariables.istoLucks = true
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK:- Actions
    
    @IBAction func gobackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
