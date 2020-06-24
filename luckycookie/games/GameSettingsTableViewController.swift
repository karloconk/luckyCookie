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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        setUpView()
        Tools.addGestureLeft(viewController: self, action: #selector(backTapped))
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
    
    func setupIcon() {
        let button: UIButton = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = Colors.charcoal
        button.frame     = CGRect(x: 0, y: 0, width: 34, height: 28)
        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        let barButton    = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
        var titulo = ""
        switch currentGame {
        case GameSettingsDashboardSections.memorias:
            titulo = "Memorias"
        case GameSettingsDashboardSections.ochoball:
            titulo = "Bola mágica"
        case GameSettingsDashboardSections.colours:
            titulo = "Colores"
        case GameSettingsDashboardSections.jigsaw:
            titulo = "Rompecabezas"
        default:
            titulo = "Memorias"
        }
        self.navigationItem.title = titulo
    }
    
    func getCellForRow(row: Int) -> UIView {
        var imageleft: UIImage?  = UIImage()
        var imageright: UIImage? = UIImage()
        var selLeft: Selector  = #selector(leftActionlvl1)
        var selRight: Selector = #selector(rightActionlvl1)
        var nameleft  = ""
        var nameright = ""
        let conficg   = UIImage.SymbolConfiguration(pointSize: 64, weight: .regular)
        var iconColour = Colours.basicBackground
        
        switch row {
        case 1:
            if currentGame == GameSettingsDashboardSections.memorias {
                nameleft  =  "2.circle.fill"
                nameright =  "3.circle.fill"
                iconColour = Colours.basicBackground
            } else if currentGame == GameSettingsDashboardSections.ochoball {
                nameleft  =  "05.circle.fill"
                nameright =  "10.circle.fill"
                iconColour = Colors.charcoal
            } else if currentGame == GameSettingsDashboardSections.colours {
                nameleft  =  "square.split.2x1"
                nameright =  "square.split.2x2"
                iconColour = Colors.tweety
            } else if currentGame == GameSettingsDashboardSections.jigsaw {
                nameleft  =  "rectangle.fill"
                nameright =  "rectangle.grid.2x2.fill"
                iconColour = Colors.moonshine
            }
        case 2:
            if currentGame == GameSettingsDashboardSections.memorias {
                nameleft  =  "4.circle.fill"
                iconColour = Colours.basicBackground
            } else if currentGame == GameSettingsDashboardSections.ochoball {
                nameleft  =  "15.circle.fill"
                nameright =  "20.circle.fill"
                iconColour = Colors.charcoal
            } else if currentGame == GameSettingsDashboardSections.colours {
                nameleft  =  "table"
                nameright =  "rectangle.split.3x3"
                iconColour = Colors.tweety
            } else if currentGame == GameSettingsDashboardSections.jigsaw {
                nameleft  =  "rectangle.grid.3x2.fill"
                nameright =  "square.grid.4x3.fill"
                iconColour = Colors.moonshine
            }
            selLeft  = #selector(leftActionlvl2)
            selRight = #selector(rightActionlvl2)
        default:
            imageleft  = UIImage()
            imageright = nil
        }
        imageleft  = nameleft != "" ? UIImage(systemName: nameleft, withConfiguration: conficg)!.withTintColor(iconColour, renderingMode: .alwaysOriginal) : UIImage()
        imageright = nameright != "" ?  UIImage(systemName: nameright, withConfiguration: conficg)!.withTintColor(iconColour, renderingMode: .alwaysOriginal) : nil

        let theview = TwinCell3(viewController: self,
                                left:        imageleft!,
                                right:       imageright,
                                leftAction:  selLeft,
                                rightAction: selRight)
        return theview
    }
    
    func getheaders(row: Int, tablewidth: CGFloat) -> UIView {
        
        var imageleft  = ""
        var imageright = ""
        
        switch row {
        case 1:
            if currentGame == GameSettingsDashboardSections.memorias {
                imageleft  = "Selecciona 2"
                imageright = "Selecciona 3"
            } else if currentGame == GameSettingsDashboardSections.ochoball {
                imageleft  = "5 segundos"
                imageright = "10 segundos"
            } else if currentGame == GameSettingsDashboardSections.colours {
                imageleft  = "2 rounds"
                imageright = "4 rounds"
            } else if currentGame == GameSettingsDashboardSections.jigsaw {
                imageleft  = "\(2 * 2) piezas"
                imageright = "\(3 * 3) piezas"
            }
            
        case 2:
            if currentGame == GameSettingsDashboardSections.memorias {
                imageleft  = "Selecciona 4"
                imageright = ""
            } else if currentGame == GameSettingsDashboardSections.ochoball {
                imageleft  = "15 segundos"
                imageright = "20 segundos"
            } else if currentGame == GameSettingsDashboardSections.colours {
                imageleft  = "8 rounds"
                imageright = "16 rounds"
            } else if currentGame == GameSettingsDashboardSections.jigsaw {
                imageleft  = "\(4 * 4) piezas"
                imageright = "\(5 * 5) piezas"
            }
        default:
            imageleft  = ""
            imageright = ""
        }
        if imageright == "" {
            let theView = getHeaderBig(tablewidth: tablewidth, titlee:  imageleft)
            return theView
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
    
    func routeTo8Ball(seconds: Int) {
        let goTo8Ball = UIStoryboard.gotoFindersScene()
        goTo8Ball.modalPresentationStyle = .fullScreen
        goTo8Ball.countdown = seconds
        self.navigationController?.pushViewController(goTo8Ball, animated: true)
    }
    
    func routeToColors(rounds: Int) {
        let goTo8Ball = UIStoryboard.gotoColoursFade()
        goTo8Ball.modalPresentationStyle = .fullScreen
        goTo8Ball.rounds = rounds
        self.navigationController?.pushViewController(goTo8Ball, animated: true)
    }
    
    func routeToJigsaw(pieces: Int) {
        let goTo8Ball = UIStoryboard.gotoJigsaws()
        goTo8Ball.modalPresentationStyle = .fullScreen
        goTo8Ball.numrows = pieces
        self.navigationController?.pushViewController(goTo8Ball, animated: true)
    }
    
    //MARK:- @objc Functions
    
    @objc func leftActionlvl1() {
        if currentGame == GameSettingsDashboardSections.memorias {
            routeToMemoria(matches: 2)
        } else if currentGame == GameSettingsDashboardSections.ochoball{
            routeTo8Ball(seconds: 5)
        } else if currentGame == GameSettingsDashboardSections.colours{
            routeToColors(rounds: 2)
        } else if currentGame == GameSettingsDashboardSections.jigsaw{
            routeToJigsaw(pieces: 2)
        }
    }
    
    @objc func rightActionlvl1() {
        if currentGame == GameSettingsDashboardSections.memorias {
            routeToMemoria(matches: 3)
        } else if currentGame == GameSettingsDashboardSections.ochoball{
            routeTo8Ball(seconds: 10)
        } else if currentGame == GameSettingsDashboardSections.colours{
            routeToColors(rounds: 4)
        } else if currentGame == GameSettingsDashboardSections.jigsaw{
            routeToJigsaw(pieces: 3)
        }
    }
    
    @objc func leftActionlvl2() {
        if currentGame == GameSettingsDashboardSections.memorias {
            routeToMemoria(matches: 4)
        } else if currentGame == GameSettingsDashboardSections.ochoball{
            routeTo8Ball(seconds: 15)
        } else if currentGame == GameSettingsDashboardSections.colours{
            routeToColors(rounds: 8)
        } else if currentGame == GameSettingsDashboardSections.jigsaw{
            routeToJigsaw(pieces: 4)
        }
    }
    
    @objc func rightActionlvl2() {
        if      currentGame == GameSettingsDashboardSections.memorias { }
        else if currentGame == GameSettingsDashboardSections.ochoball {
            routeTo8Ball(seconds: 20)
        } else if currentGame == GameSettingsDashboardSections.colours{
            routeToColors(rounds: 16)
        } else if currentGame == GameSettingsDashboardSections.jigsaw{
            routeToJigsaw(pieces: 5)
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
    
    public static let headerheight = 48
    
    public static let memorias = "memorias"
    public static let ochoball = "8ball"
    public static let colours  = "colours"
    public static let jigsaw   = "jigsaw"
    
}

