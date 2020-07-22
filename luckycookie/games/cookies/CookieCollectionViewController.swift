//
//  CookieCollectionViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 12/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

private let reuseIdentifierCC = "CookieGameCell"

class CookieCollectionViewController:  UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, CookieSimpleDelegate{
    
    // MARK:- Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelView: UILabel!
    
    // MARK:- Vars
    let contents              = 12
    public var allowedTouches = 2
    var touchedTimes          = 0 {
        willSet(newIndex) { }
        didSet {
            if touchedTimes >= allowedTouches {
                var selectedss:[UIImage] = []
                var baseImg = UIImage()
                
                for alement in 0...2 {
                    for aitem in 0...3 {
                        if selected[alement][aitem] == 2 {
                            print("row")
                            print(alement)
                            print("column")
                            print(aitem)
                            let element = icons[alement][aitem]
                            selectedss.append(element)
                            baseImg = element
                        }
                    }
                }
                //Evaluate if all 2 match
                for image in selectedss {
                    if image != baseImg {
                        allReverse()
                        return
                    }
                }
                // Change to ones
                allTo1()
                
                //Evaluate if all are 1
                for alement in 0...2 {
                    for aitem in 0...3 {
                        if selected[alement][aitem] != 1 {
                            return
                        }
                    }
                }
                // win
                winfunc()
            }
        }
    }
    
    private var selecteds: [UIImage] = [UIImage(named: "memorama_1")!,UIImage(named: "memorama_2")!,UIImage(named: "memorama_3")!,UIImage(named: "memorama_4")!,UIImage(named: "memorama_5")!,UIImage(named: "memorama_6")!]
    
    private var icons:    [[UIImage]] = [[],[],[]]
    private var selected: [[Int]] = [[],[],[]]
    private var cookies: [[CookieSimple]] = [[],[],[]]
    // 0-false, 1-true, 2-inGame
    
    // MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifierCC)
        self.generateName(num: allowedTouches)
        self.generateArray(pairnumber: allowedTouches)
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
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.goInstructions(title:  InstructionsStrings.memoriaTitle, instructions: InstructionsStrings.memoria)
    }
    
    // MARK:- Functions
    
    func generateName(num: Int) {
        switch num {
        case 2:
            self.labelView.text = "Pares"
        case 3:
            self.labelView.text = "Triadas"
        case 4:
            self.labelView.text = "Cuartetos"
        default:
            return
        }
    }
    
    func winfunc() {
        let maWidth    = 400
        let maHeight   = 270
        let longWidth  = self.view.frame.width/2
        let longHeight = self.view.frame.height/2
        let winview = WinView(frame: CGRect(x: Int(longWidth) - maWidth/2,
                                            y: Int(longHeight) - maHeight/2 + 30,
                                            width: maWidth, height: maHeight),
                              titler: "¿Qué quieres hacer ahora?", viewController: self,
                              actionL:  #selector(ledft), actionM: #selector(redo), actionR: #selector(rigtht),
                              win: true)
        winview.alpha = 0.0
        view.addSubview(winview)
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveLinear, animations: {
            winview.alpha = 1.0
            winview.transform = CGAffineTransform(translationX: 0, y: -30)
        }, completion: {(Bool) in print("")})
    }
    
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
    
    func generateArray(pairnumber: Int) {
        allowedTouches = pairnumber
        let numberoficons = contents/pairnumber
        var bigarr: [Int] = []
        
        for _ in 0..<pairnumber {
            let array = (0..<numberoficons).map { $0 }
            bigarr.append(contentsOf: array)
        }
        bigarr.shuffle()
        
        for eks in 0..<3 {
            let baseSelected = Array(repeating: 0, count: 4 )
            selected[eks] = baseSelected
            switch eks {
            case 0:
                icons[eks] = [selecteds[bigarr[0]],selecteds[bigarr[1]]
                    ,selecteds[bigarr[2]],selecteds[bigarr[3]]]
            case 1:
                icons[eks] = [selecteds[bigarr[4]],selecteds[bigarr[5]]
                    ,selecteds[bigarr[6]],selecteds[bigarr[7]]]
            case 2:
                icons[eks] = [selecteds[bigarr[8]],selecteds[bigarr[9]]
                    ,selecteds[bigarr[10]],selecteds[bigarr[11]]]
            default:
                return
            }
        }
    }
    
    func allTo1() {
        for alement in 0...2 {
            for aitem in 0...3 {
                if selected[alement][aitem] == 2 {
                    selected[alement][aitem] = 1
                }
            }
        }
        self.touchedTimes = 0
    }
    
    func allReverse() {
        for alement in 0...2 {
            for aitem in 0...3 {
                if selected[alement][aitem] == 2 {
                    selected[alement][aitem] = 0
                    cookies[alement][aitem].reverseImage()
                }
            }
        }
        self.touchedTimes = 0
    }
    
    @IBAction func goback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:- DelegateMethods
    
    func valueChanged(row: Int, column: Int) {
        selected[row][column] = 2
        touchedTimes += 1
    }
    
    // MARK:- UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return icons[0].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCC, for: indexPath)
        let afram = CGRect(x: 0, y: 0, width: 100, height: 100)
        //cell.frame = afram
        let row    = indexPath[0]
        let column = indexPath[1]
        let theImg = icons[row][column]
        let select = selected[row][column] == 0 ? false : true
        let cookie = CookieSimple(frame:       afram,
                                  image:       UIImage(named: "basic_closed")!,
                                  imageTapped: theImg,
                                  vc: self,    row: row, column: column,
                                  selected:    select)
        cookie.delegate = self
        cookies[row].append(cookie)
        cell.addSubview(cookie)
        return cell
    }
    
}
