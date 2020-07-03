//
//  MainHubViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 14/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class MainHubViewController: UIViewController {

    @IBOutlet weak var headerOutlet: UILabel!
    @IBOutlet weak var gamesImageView: UIImageView!
    @IBOutlet weak var suerteImageView: UIImageView!
    @IBOutlet weak var lucksButton: UIButton!
    @IBOutlet weak var juegoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerOutlet.font = Font.getbigFont(size: 34)
        self.view.isUserInteractionEnabled = false
        self.setButton(button: lucksButton)
        self.setButton(button: juegoButton)
        self.view.backgroundColor = UIColor(red: 0.91, green: 0.47, blue: 0.56, alpha: 1.00)
        self.getRandomColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if MyGVariables.istoLucks {
            MyGVariables.istoLucks   = false
            headerOutlet.isHidden    = true
            gamesImageView.isHidden  = true
            suerteImageView.isHidden = true
            routeToLucks()
        }else if MyGVariables.istoGames {
            MyGVariables.istoGames   = false
            headerOutlet.isHidden    = true
            gamesImageView.isHidden  = true
            suerteImageView.isHidden = true
            routeToGames()
        } else {
            self.view.isUserInteractionEnabled = true
            headerOutlet.isHidden    = false
            gamesImageView.isHidden  = false
            suerteImageView.isHidden = false
        }
    }
    
    func setButton(button: UIButton) {
//        button.layer.borderWidth  = 1
//        button.layer.borderColor  = Colors.neutral.cgColor
//        button.layer.cornerRadius = 5
    }
    
    func getRandomColor() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options:[.curveEaseInOut], animations: {
            self.view.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.00)
        }, completion:nil)
    }
    
    func routeToGames() {
        let gotoGames = UIStoryboard.gotoGames()
        gotoGames.modalPresentationStyle = .fullScreen
        self.present(gotoGames, animated: true, completion: {})
    }
    
    func routeToLucks() {
        let gotolucks = UIStoryboard.gotoLucks()
        gotolucks.modalPresentationStyle = .fullScreen
        self.present(gotolucks, animated: true, completion: {})
    }
    
    @IBAction func gotoGamesTap(_ sender: Any) {
        routeToGames()
    }
    
    @IBAction func gotoLuckTap(_ sender: Any) {
        routeToLucks()
    }
}
