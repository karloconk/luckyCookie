//
//  GamesDashboardTableViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 14/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class GamesDashboardTableViewController: UITableViewController {
    
    // MARK:- View Lifecycle

    let numberOfRows = 4

    // MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        setUpView()
        Tools.addGestureLeft(viewController: self, action: #selector(dismissme))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = false
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
    
    // MARK:- Functions
    
    func setUpView() {
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = Colors.blanco
        setupIcon()
    }
    
    func setupIcon() {
        let logo   = DashboardImages.kachamLogo?.resize(targetSize: CGSize(width: 24, height: 28))
        let button: UIButton = UIButton(type: .custom)
        button.setImage(logo, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 34, height: 28)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    func getHeaderBig(tablewidth: CGFloat, titlee: String) -> UILabel{
        let headerlabel = UILabel(frame: CGRect(x: 0,   y: 0,
                                                width:  Int(tablewidth),
                                                height: DashboardSections.headerheight))
        headerlabel.font             = Typo.h3
        headerlabel.textColor        = Colors.charcoal
        headerlabel.textAlignment    = .center
        headerlabel.backgroundColor  = Colors.blanco
        headerlabel.contentMode      = .scaleAspectFit
        headerlabel.text             = titlee
        return headerlabel
    }
    
    //MARK:- @objc Functions
    
    @objc func routeToGameSettingsMemoria() {
        let gotoGameSettings = UIStoryboard.goToGameSettings()
        gotoGameSettings.currentGame = GameSettingsDashboardSections.memorias
        self.navigationController?.pushViewController(gotoGameSettings, animated: true)
    }
    
    @objc func routeToGameSettingsARBall() {
        let gotoGameSettings = UIStoryboard.goToGameSettings()
        gotoGameSettings.currentGame = GameSettingsDashboardSections.ochoball
        self.navigationController?.pushViewController(gotoGameSettings, animated: true)
    }
    
    @objc func routeToGameSettingsColours() {
        let gotoGameSettings = UIStoryboard.goToGameSettings()
        gotoGameSettings.currentGame = GameSettingsDashboardSections.colours
        self.navigationController?.pushViewController(gotoGameSettings, animated: true)
    }
    
    @objc func routeToGameSettingsJigsaw() {
        let gotoGameSettings = UIStoryboard.goToGameSettings()
        gotoGameSettings.currentGame = GameSettingsDashboardSections.jigsaw
        self.navigationController?.pushViewController(gotoGameSettings, animated: true)
    }
    
    @objc func routeToAR1() {
        let gotoAR1 = UIStoryboard.gotofirstARscene()
        self.navigationController?.pushViewController(gotoAR1, animated: true)
    }
    
    //MARK:- Actions

    @objc func dismissme() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfRows
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        if indexPath.section == GameDashboardSections.dbheader {
            let smallview = UIView(frame: CGRect(x:      0,   y: 0,
                width:  tableView.frame.width, height: GameDashboardSections.dbheaderheight))
            smallview.backgroundColor = Colors.blanco
            cell.addSubview(smallview)
        }  else if indexPath.section == GameDashboardSections.level1 {
            cell.addSubview(TwinCell2(viewController: self,
                                     left:  DashboardImages.GdashBoardCookie!,
                                     right: DashboardImages.GdashBoardNumeros!,
                                     leftAction:  #selector(routeToGameSettingsMemoria),
                                     rightAction: #selector(routeToAR1)))
        }  else if indexPath.section == GameDashboardSections.level2 {
                cell.addSubview(TwinCell2(viewController: self,
                                         left:  DashboardImages.GdashBoardBola!,
                                         right: DashboardImages.GdashBoardColores!,
                                         leftAction:  #selector(routeToGameSettingsARBall),
                                         rightAction: #selector(routeToGameSettingsColours)))
        }  else if indexPath.section == GameDashboardSections.level3 {
                cell.addSubview(TwinCell2(viewController: self,
                                         left:  DashboardImages.GdashBoardLuna!,
                                         right: nil,
                                         leftAction:  #selector(routeToGameSettingsJigsaw),
                                         rightAction: nil))
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == GameDashboardSections.dbheader {
            return GameDashboardSections.dbheaderheight
        } else {
            return GameDashboardSections.level1height - 10
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tablewidth = tableView.frame.width
        let smallview  = UIView(frame: CGRect(x:      0,   y: 0,
                                              width:  Int(tablewidth),
                                              height: 0))
        smallview.backgroundColor = Colors.blanco
        
        if section == GameDashboardSections.dbheader {
            let littlestview  = UIView(frame: CGRect(x: 0,   y: 0, width:  Int(tablewidth), height:0))
            littlestview.backgroundColor = Colors.blanco
            return littlestview
        } else if section == GameDashboardSections.level1 {
            smallview.addSubview(TwinHeaders(width: Double(tablewidth), left: "Memoria", right: "Adivina número"))
        } else if section == GameDashboardSections.level2 {
            smallview.addSubview(TwinHeaders(width: Double(tablewidth), left: "¿Dónde está mi bola mágica?", right: "¿Cuál color es distinto?"))
        } else if section == GameDashboardSections.level3 {
            smallview.addSubview(getHeaderBig(tablewidth: tablewidth,
                                              titlee:  "Rompecabezas"))
        }
        return smallview
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == DashboardSections.dbheader {
            return CGFloat(0)
        }
        return CGFloat(DashboardSections.headerheight)
    }

}

// MARK: - enum


enum GameDashboardSections {
    public static let dbheader       = 0
    public static let dbheaderheight = CGFloat(0)
    public static let level1height = CGFloat(120)

    public static let level1       = 1
    public static let level2       = 2
    public static let level3       = 3
    
    public static let headerheight  = 30
}
