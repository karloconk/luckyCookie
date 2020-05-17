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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerOutlet.font = Font.getbigFont(size: 34)
        self.view.isUserInteractionEnabled = false
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
