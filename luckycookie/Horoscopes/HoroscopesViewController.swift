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

    override func viewDidLoad() {
        super.viewDidLoad()
        //requestHoroscopes()
    }
    
    func requestHoroscopes() {
        let horoscopesUrl = URL(string: "https://api.adderou.cl/tyaas/")!
        let task = URLSession.shared.dataTask(with: horoscopesUrl) { (data, response, error) in
            if error == nil {
                if let _ = data {
                    let jsonData = String(decoding: data!, as: UTF8.self).data(using: .utf8)
                    self.horoscopes = try! JSONDecoder().decode(Datum.self, from: jsonData!)
                    print(self.horoscopes)
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
    
    func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short

        let strDate = dateFormatter.string(from: datePicker.date)
        //dateLabel.text = strDate
    }

}
