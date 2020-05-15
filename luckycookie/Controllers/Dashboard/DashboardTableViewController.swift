//
//  DashboardTableViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 16/04/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class DashboardTableViewController: UITableViewController {
    
    var buttonBack: UIButton     = UIButton(type: UIButton.ButtonType.custom)
    var spinner                  = UIActivityIndicatorView()
    let numberOfRows             = 5
    let defaults                 = UserDefaults.standard
    var colorsAvailable          = false
    var numbersAvailable         = false
    var todaysdate               = ""
    var numbersfornumbers: [Int] = []
    var colourforcolour          = ""
    
    
    // MARK:- View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        getTodaysDate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = false
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
    
    func getTodaysDate() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        todaysdate = formatter.string(from: date)
        
        let mycolour = Tools.retieve(entityName: EntityNames.colour) as! [Colour]
        if mycolour.count == 1 {
            colorsAvailable = todaysdate == mycolour[0].date! ? false : true
            if !colorsAvailable {
                self.colourforcolour = mycolour[0].colour!
            }
        } else {
            colorsAvailable = true
        }
        
        let mynums = Tools.retieve(entityName: EntityNames.numbers) as! [Numbers]
        if mynums.count == 1 {
            numbersAvailable = todaysdate == mynums[0].date! ? false : true
            if !numbersAvailable {
                self.numbersfornumbers = [Int(mynums[0].n1), Int(mynums[0].n2), Int(mynums[0].n3) ]
            }
        } else {
            numbersAvailable = true
        }
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
    
    // MARK:- Routing
    
    func routeToGalleta() {
        let goToGalleta = UIStoryboard.goToGalleta()
        goToGalleta.modalPresentationStyle = .fullScreen
        self.navigationController?.present(goToGalleta, animated: true, completion: {})
    }
    
    func routeToHoroscopes() {
        let goToHoroscopes = UIStoryboard.goToHoroscopes()
        goToHoroscopes.modalPresentationStyle = .fullScreen
        self.navigationController?.present(goToHoroscopes, animated: true, completion: {})
    }
    
    func routeToGames() {
        let goToGames = UIStoryboard.gotoGames()
        goToGames.modalPresentationStyle = .fullScreen
        self.navigationController?.present(goToGames, animated: true, completion: {})
    }
    
    func routeToColours() {
        let goToColours = UIStoryboard.goToColours()
        goToColours.modalPresentationStyle = .fullScreen
        if colourforcolour != "" {
            goToColours.oldcolour = colourforcolour
        }
        self.navigationController?.present(goToColours, animated: true, completion: {})
    }
    
    func routeToBolaOcho() {
        let goToBolaOcho = UIStoryboard.goToBolaocho()
        goToBolaOcho.modalPresentationStyle = .fullScreen
        self.navigationController?.present(goToBolaOcho, animated: true, completion: {})
    }
    
    func routeToMoons() {
        let goToMoons = UIStoryboard.goToMoons()
        goToMoons.modalPresentationStyle = .fullScreen
        self.navigationController?.present(goToMoons, animated: true, completion: {})
    }
    
    func routeToNumbers() {
        let goToNumbers = UIStoryboard.goToNumbers()
        goToNumbers.modalPresentationStyle = .fullScreen
        if numbersfornumbers.count > 1 {
            goToNumbers.oldnumbers = numbersfornumbers
        }
        self.navigationController?.present(goToNumbers, animated: true, completion: {})
    }
    
    //MARK:- @objc Functions
    
    @objc func luckyClick() {
        routeToGalleta()
    }
    
    @objc func horoscopeClick() {
        routeToGames()
    }
    
    @objc func leftLV1() {
        routeToBolaOcho()
    }
    
    @objc func rightLV1() {
        routeToMoons()
    }
    
    @objc func leftLV2() {
        routeToColours()
    }
    
    @objc func rightLV2() {
        routeToNumbers()
    }
    
    //MARK:- Actions
    @IBAction func clickback(_ sender: Any, forEvent event: UIEvent) {
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
        let tablewidth      = tableView.frame.width
        if indexPath.section == DashboardSections.dbheader {
            let smallview = UIView(frame: CGRect(x:      0,   y: 0,
                                                 width:  tableView.frame.width,
                                                 height: DashboardSections.dbheaderheight))
            smallview.backgroundColor = Colors.blanco
            cell.addSubview(smallview)
            
        } else if indexPath.section == DashboardSections.luckycookie {
            cell.addSubview(DashboardCompound(frame:  CGRect(x: 0, y: 0, width: Int(tablewidth),
                                                             height: Int(DashboardSections.luckycookieheight)),
                                              image:  Imagenes.basicClosed!,
                                              vc:     self,
                                              action: #selector(luckyClick)))
            
        } else if indexPath.section == DashboardSections.horoscopes {
            cell.addSubview(DashboardCompound(frame:
                CGRect(x: 0, y: 0, width: Int(tablewidth),
                       height: Int(DashboardSections.horoscopesHeight)),
                                              image:  Imagenes.badClosed!, vc: self, action: #selector(horoscopeClick)))
            
        } else if indexPath.section == DashboardSections.level1 {
            cell.addSubview(TwinCell(viewController: self,
                                     left:  DashboardImages.dashBoardBola!,
                                     right: DashboardImages.dashBoardLuna!,
                                     leftAction:  #selector(leftLV1),
                                     rightAction: #selector(rightLV1)))
        } else if indexPath.section == DashboardSections.level2 {
            cell.addSubview(TwinCell(viewController: self,
                                     left:  DashboardImages.dashBoardColores!,
                                     right: DashboardImages.dashBoardNumeros!,
                                     leftAction:  #selector(leftLV2),
                                     rightAction: #selector(rightLV2)))
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == DashboardSections.dbheader {
            return DashboardSections.dbheaderheight
        } else if indexPath.section == DashboardSections.luckycookie
            || indexPath.section == DashboardSections.horoscopes {
            return DashboardSections.luckycookieheight
        } else if indexPath.section == DashboardSections.level1 {
            return DashboardSections.level1height
        } else {
            return DashboardSections.level1height
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tablewidth = tableView.frame.width
        let smallview  = UIView(frame: CGRect(x:      0,   y: 0,
                                              width:  Int(tablewidth),
                                              height: DashboardSections.headerheight))
        smallview.backgroundColor = Colors.blanco
        
        if section == DashboardSections.dbheader {
            let littlestview  = UIView(frame: CGRect(x:      0,   y: 0,
                                                     width:  Int(tablewidth),
                                                     height: DashboardSections.headerheight - 16))
            littlestview.backgroundColor = Colors.blanco
            return littlestview
        } else if section == DashboardSections.luckycookie {
            smallview.addSubview(getHeaderBig(tablewidth: tablewidth,
                                              titlee: DashboardSections.luckycookietitle))
        } else if section == DashboardSections.horoscopes {
            smallview.addSubview(getHeaderBig(tablewidth: tablewidth,
                                              titlee: DashboardSections.horoscopestitle))
        } else if section == DashboardSections.level1 {
            smallview.addSubview(TwinHeaders(width: Double(tablewidth), left: "Bola mágica", right: "Luna"))
        } else if section == DashboardSections.level2 {
            smallview.addSubview(TwinHeaders(width: Double(tablewidth), left: "Color de hoy", right: "Números de hoy"))
        }
        return smallview
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == DashboardSections.dbheader {
            return CGFloat(DashboardSections.headerheight - 16)
        }
        return CGFloat(DashboardSections.headerheight)
    }
    
}

// MARK: - enum

enum DashboardSections {
    public static let dbheader       = 0
    public static let dbheaderheight = CGFloat(0)
    
    public static let horoscopes       = 4
    public static let horoscopesHeight = CGFloat(210)
    public static let horoscopestitle  = "KKs"
    
    public static let luckycookie       = 1
    public static let luckycookieheight = CGFloat(210)
    public static let luckycookietitle  = "Galleta de la suerte"
    
    public static let level1       = 2
    public static let level1height = CGFloat(140)
    
    public static let level2       = 3
    public static let level2height = CGFloat(140)
    
    public static let headerheight  = 30
    
}
