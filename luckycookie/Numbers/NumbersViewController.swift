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
    
    let theRows     = 200
    let defaults    = UserDefaults.standard
    var pickerData: [[Int]] = []
    var shown = false
    var clicked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toptext.textColor    = Colors.upperNum
        bottomText.textColor = Colors.lowerNum
        kalogo.alpha = 0.0
        setupPicker()
    }
    
    func setupPicker() {
        self.pickerView.delegate   = self
        self.pickerView.dataSource = self
        pickerData = [makeArr(theRows),makeArr(theRows),makeArr(theRows)]
        self.pickerView.isUserInteractionEnabled = false
        for nu in 0..<3 {
            pickerData[nu][3] = 0
            self.pickerView.selectRow(3, inComponent: nu, animated: true)
        }
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
    
    func makeArr(_ n: Int) -> [Int] {
        return (0..<n).map { _ in .random(in: 1...100) }
    }
    
    func saveDate() {
        let date             = Date()
        let formatter        = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let todaysdate       = formatter.string(from: date)
        defaults.set(todaysdate, forKey: "numbersdate")
    }
    
    @IBAction func backbuttonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }
    
    @IBAction func selectNumbers(_ sender: Any) {
        if !clicked {
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
                    }
                    if toRow < 140 {
                        self.pickerView.selectRow(toRow,  inComponent: 1, animated: true)
                    } else if !self.shown {
                        UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveLinear, animations: {
                            self.kalogo.alpha = 1.0
                        }, completion: { (Bool) -> Void in self.toptext.isHidden = false } )
                        self.shown = true
                    }
                    self.pickerView.selectRow(toRow,  inComponent: 2, animated: true)
                }
                seconds += 0.2
            }
            saveDate()
        }
    }
}
