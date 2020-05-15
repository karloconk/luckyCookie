//
//  GameSettingsTableViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 15/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class GameSettingsTableViewController: UITableViewController {
        
    let numberOfRows = 3
    public var currentGame  = ""
    var level1On = true
    var level2On = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = true
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
            let button: UIButton = UIButton(type: .custom)
            button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            button.tintColor = Colors.charcoal
            button.frame     = CGRect(x: 0, y: 0, width: 24, height: 28)
            button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
            let barButton    = UIBarButtonItem(customView: button)
            self.navigationItem.leftBarButtonItem = barButton
            self.navigationItem.title =  "Tipo de Juego"
        }
    
    func getCellForRow(row: Int) -> UIView {
        var imageleft  = UIImage()
        var imageright = UIImage()

        switch row {
        case 1:
            if currentGame == "memorias" {
                imageleft  = UIImage(systemName: "sun.min")!
                imageright = UIImage(systemName: "sun.dust")!
            }
        case 2:
            if currentGame == "memorias" {
                imageleft  = UIImage(systemName: "sun.haze")!
                imageright = UIImage()
            }
        default:
            imageleft  = UIImage(systemName: "sun.min")!
            imageright = UIImage(systemName: "sun.dust")!
        }
        let theview = TwinCell3(viewController: self,
                                left:  imageleft,
                                right: imageright,
                                leftAction:  #selector(leftActionlvl1),
                                rightAction: #selector(rightActionlvl1))
        return theview
    }
    
    func getheaders(row: Int, tablewidth: CGFloat) -> UIView {
        
        var imageleft  = ""
        var imageright = ""

        switch row {
        case 1:
            if currentGame == "memorias" {
                imageleft  = "Selecciona 2"
                imageright = "Selecciona 3"
            }
        case 2:
            if currentGame == "memorias" {
                imageleft  = "Selecciona 4"
                imageright = ""
            }
        default:
            imageleft  = ""
            imageright = ""
        }
         let theView = TwinHeaders(width: Double(tablewidth),
                                   left: imageleft, right: imageright)
        return theView
    }

    //MARK:- Routing
    
    func routeToMemoria(matches: Int) {
        let goToMemoria = UIStoryboard.gotoMemoria()
        goToMemoria.modalPresentationStyle = .fullScreen
        goToMemoria.allowedTouches = matches
        self.navigationController?.pushViewController(goToMemoria, animated: true)
    }
    
    //MARK:- @objc Functions
    
    @objc func leftActionlvl1() {
        if currentGame == GameSettingsDashboardSections.memorias {
            routeToMemoria(matches: 2)
        }
    }
    
    @objc func rightActionlvl1() {
        if currentGame == GameSettingsDashboardSections.memorias {
            routeToMemoria(matches: 3)
        }
    }
    
    @objc func leftActionlvl2() {
        if currentGame == GameSettingsDashboardSections.memorias {
            routeToMemoria(matches: 4)
        }
    }
    
    @objc func rightActionlvl2() {
        if currentGame == GameSettingsDashboardSections.memorias {
    
        }
    }
    
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: true)
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
        } else {
            cell.addSubview(getCellForRow(row: indexPath.section ))
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == GameDashboardSections.dbheader {
            return GameDashboardSections.dbheaderheight
        } else {
            return GameDashboardSections.level1height
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
        } else {
            smallview.addSubview(getheaders(row: section, tablewidth: tablewidth))
        }
        return smallview
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == DashboardSections.dbheader {
            return 0
        }
        return CGFloat(DashboardSections.headerheight)
    }
    
}

// MARK: - enum

enum GameSettingsDashboardSections {
    public static let dbheader       = 0
    public static let dbheaderheight = CGFloat(48)
    
    public static let level1       = 1
    public static let level1height = CGFloat(120)
    
    public static let level2       = 2
    public static let level2height = CGFloat(120)
    
    public static let headerheight  = 48
    
    public static let memorias = "memorias"
}

