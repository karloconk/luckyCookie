//
//  DashboardTableViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 16/04/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class DashboardTableViewController: UITableViewController {
    
    var buttonBack: UIButton = UIButton(type: UIButton.ButtonType.custom)
    var spinner              = UIActivityIndicatorView()
    
    var numberOfRows = 3
    
    // MARK:- View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = true
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
        let imageV = UIImageView(image: logo)
        self.navigationItem.titleView = imageV
    }
    
    //MARK:- @objc Functions
    
    @objc func luckyClick() {
        print("luckyCookie")
    }
    
    @objc func leftLV1() {
        print("L1")
    }
    
    @objc func rightLV1() {
        print("R1")
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
            
        } else {
            cell.addSubview(TwinCell(viewController: self,
                                     left:  Imagenes.badClosed!,
                                     right: Imagenes.loveClosed!,
                                     leftAction:  #selector(leftLV1),
                                     rightAction: #selector(rightLV1)))
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == DashboardSections.dbheader {
            return DashboardSections.dbheaderheight
        } else if indexPath.section == DashboardSections.luckycookie {
            return DashboardSections.luckycookieheight
        } else {
            return DashboardSections.level1height
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if section == DashboardSections.dbheader {
            let header = view as! UITableViewHeaderFooterView
            header.textLabel?.text = ""
            header.contentView.backgroundColor = Colors.blanco

        } else if section == DashboardSections.luckycookie {
            let header = view as! UITableViewHeaderFooterView
            header.textLabel?.font             = Typo.h3
            header.textLabel?.textColor        = Colors.charcoal
            header.textLabel?.textAlignment    = .center
            header.contentView.backgroundColor = Colors.blanco
            header.contentView.contentMode     = .scaleAspectFit
            header.textLabel?.text = DashboardSections.luckycookietitle
        } else {
            let header = view as! UITableViewHeaderFooterView
            header.addSubview(TwinHeaders(view: header, left: "LeftGame", right: "RightGame"))
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(DashboardSections.headerheight)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

enum DashboardSections {
    public static let dbheader       = 0
    public static let dbheaderheight = CGFloat(10)
    
    public static let luckycookie       = 1
    public static let luckycookieheight = CGFloat(240)
    public static let luckycookietitle  = "Galleta de la suerte"
    
    public static let level1       = 2
    public static let level1height = CGFloat(140)
    
    public static let headerheight  = 30

}
