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

    let numberOfRows = 2

    // MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        setUpView()
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
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 28)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    //MARK:- @objc Functions
    
    @objc func routeToGameSettings() {
        let gotoGameSettings = UIStoryboard.goToGameSettings()
        gotoGameSettings.currentGame = GameSettingsDashboardSections.memorias
        self.navigationController?.pushViewController(gotoGameSettings, animated: true)
    }
    
    @objc func routeToAR1() {
        let gotoAR1 = UIStoryboard.gotofirstARscene()
        self.navigationController?.pushViewController(gotoAR1, animated: true)
    }
    
    //MARK:- Actions

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
                                     left:  DashboardImages.dashBoardBola!,
                                     right: DashboardImages.dashBoardLuna!,
                                     leftAction:  #selector(routeToGameSettings),
                                     rightAction: #selector(routeToAR1)))
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
        } else if section == GameDashboardSections.level1 {
            smallview.addSubview(TwinHeaders(width: Double(tablewidth), left: "Memoria", right: "AR"))
        } else if section == GameDashboardSections.level2 {
            smallview.addSubview(TwinHeaders(width: Double(tablewidth), left: " ", right: " "))
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
    
    public static let level1       = 1
    public static let level1height = CGFloat(140)
    
    public static let level2       = 2
    public static let level2height = CGFloat(140)
    
    public static let headerheight  = 30
    
}
