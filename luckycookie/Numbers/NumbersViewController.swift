//
//  NumbersViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 18/04/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var toptext: UILabel!
    @IBOutlet weak var bottomText: UILabel!
    @IBOutlet weak var buttonNumbers: UIImageView!
    @IBOutlet weak var kalogo: UIImageView!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    let theRows     = 200
    var pickerData: [[Int]] = []
    var shown       = false
    var clicked     = false
    var oldnumbers: [Int]  = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toptext.textColor    = Colors.upperNum
        bottomText.textColor = Colors.lowerNum
        kalogo.alpha = 0.0
        backBtn.tintColor = Colors.charcoal
        shareBtn.tintColor = Colors.charcoal
        shareBtn.isHidden = true
        shareBtn.isUserInteractionEnabled = false
        setupPicker()
        Tools.addGestureDown(viewController: self, action: #selector(dismissme))
    }
    
    func setupPicker() {
        self.pickerView.delegate   = self
        self.pickerView.dataSource = self
        if oldnumbers.count < 1 {
            pickerData = [makeArr(theRows),makeArr(theRows),makeArr(theRows)]
            for nu in 0..<3 {
                pickerData[nu][3] = 0
                self.pickerView.selectRow(3, inComponent: nu, animated: true)
            }
        } else {
            pickerData = [[oldnumbers[0]], [oldnumbers[1]], [oldnumbers[2]]]
            setupoldnumbers()
            shareBtn.isUserInteractionEnabled = true
            shareBtn.isHidden = false
        }
        self.pickerView.isUserInteractionEnabled = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[0].count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for i in [1, 2] {
            pickerView.subviews[i].isHidden = true
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerLabel = view as? UILabel;
        
        if (pickerLabel == nil)
        {
            pickerLabel = UILabel()
            
            pickerLabel?.font          = Font.getbigFont(size: 40)
            pickerLabel?.textColor     = Colors.charcoal
            pickerLabel?.textAlignment = NSTextAlignment.center
            pickerLabel?.text          = String(pickerData[component][row])
        }
        return pickerLabel!;
    }
    
    func setupoldnumbers() {
        clicked = true
        self.bottomText.isHidden    = true
        self.buttonNumbers.isHidden = true
        self.toptext.isHidden       = false
        self.toptext.text = "Tus números de hoy aún son:"
        for la in 0...2 {
            self.pickerView.selectRow(0, inComponent: la, animated: false)
        }
        self.kalogo.alpha = 1.0
        self.shown = true
    }
        
    func makeArr(_ n: Int) -> [Int] {
        return (0..<n).map { _ in .random(in: 1...100) }
    }
    
    func saveDateN() {
        let date             = Date()
        let formatter        = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let todaysdate       = formatter.string(from: date)
        Tools.saveNumbers(numbers: oldnumbers, date: todaysdate)
    }
    
    @objc func dismissme() {
        self.dismiss(animated: true, completion: {})

    }
    
    //MARK:- Actions
    
    @IBAction func backbuttonTapped(_ sender: Any) {
        dismissme()
    }
    
    @IBAction func selectNumbers(_ sender: Any) {
        if !clicked {
            self.oldnumbers.append(0)
            self.oldnumbers.append(0)
            self.oldnumbers.append(0)
            clicked = true
            self.bottomText.isHidden    = true
            self.buttonNumbers.isHidden = true
            self.toptext.isHidden       = true
            self.toptext.text = "Tus números de hoy son:"
            
            var toRow = 28
            self.pickerView.selectRow(toRow, inComponent: 0, animated: true)
            self.pickerView.selectRow(toRow, inComponent: 1, animated: true)
            self.pickerView.selectRow(toRow, inComponent: 2, animated: true)
            var seconds = 0.2
            for _ in 0...10 {
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    toRow += 20
                    if toRow < 80 {
                        self.pickerView.selectRow(toRow,  inComponent: 0, animated: true)
                        self.oldnumbers[0] = Int(self.pickerData[0][toRow])
                    }
                    if toRow < 140 {
                        self.pickerView.selectRow(toRow,  inComponent: 1, animated: true)
                        self.oldnumbers[1] = Int(self.pickerData[1][toRow])
                    } else if !self.shown {
                        UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveLinear, animations: {
                            self.kalogo.alpha = 1.0
                            self.shareBtn.isUserInteractionEnabled = true
                            self.shareBtn.isHidden = false
                        }, completion: { (Bool) -> Void in self.toptext.isHidden = false;             self.saveDateN() } )
                        self.shown = true
                    }
                    if toRow < 201{
                        self.pickerView.selectRow(toRow,  inComponent: 2, animated: true)
                        self.oldnumbers[2] = Int(self.pickerData[2][toRow])
                    }
                }
                seconds += 0.2
            }
        }
    }
    
    
    @IBAction func TouchShareBtn(_ sender: Any) {
        let oldtext = self.toptext.text!
        self.toptext.text = "Mis números de hoy son:"
        Tools.shareStuff(viewController: self,
                         backbtn: backBtn,
                         shareButton: shareBtn)
        self.toptext.text = oldtext
    }
}
