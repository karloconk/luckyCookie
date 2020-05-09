//
//  HoroscopesViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 01/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class HoroscopesViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var buttonselectDate: UIButton!
    var horoscopes: Datum? = nil
    let defaults    = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func requestHoroscopes() {
        let horoscopesUrl = URL(string: "")!
        let task = URLSession.shared.dataTask(with: horoscopesUrl) { (data, response, error) in
            if error == nil {
                if let _ = data {
                    let jsonData = String(decoding: data!, as: UTF8.self).data(using: .utf8)
                    self.horoscopes = try! JSONDecoder().decode(Datum.self, from: jsonData!)
                    //print(self.horoscopes)
                    //print(response as Any)
                }
            } else {
                print(error as Any)
            }
        }
        task.resume()
    }
    
    func saveDateH() {
        let date             = Date()
        let formatter        = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let todaysdate       = formatter.string(from: date)
        //self.horoscopes?.horoscopo
        Tools.saveHoroscope(horoscope: "", date: todaysdate)
    }
    
    @IBAction func selectedDateButton(_ sender: Any) {
        let formatter        = DateFormatter()
        formatter.dateFormat = "dd.MM"
        let todaysdate       = formatter.string(from: datePicker.date)
        let dateArr          = todaysdate.split(separator: ".")
        let zodiac = Tools.getZodiac(day:   Int(dateArr[0].description)!,
                                     month: Int(dateArr[1].description)!)
        defaults.set(zodiac, forKey: "zodiac")
    }
}
