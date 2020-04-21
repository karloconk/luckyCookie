//
//  MoonsViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 18/04/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit
import SwiftySuncalc
import CoreLocation

class MoonsViewController: UIViewController {
    
    // MARK:- Outlets
    
    @IBOutlet weak var moonriseLbl: UILabel!
    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var textView: UIView!
    
    // MARK:- Variables
    let moonPhaser      = SwiftySuncalc()
    var locationManager = CLLocationManager()
    
    let phases     = ["Luna nueva","Luna creciente",  "Primer cuarto","Luna menguante",
                      "Luna llena","Gibosa menguante","Último cuarto","Creciente menguante"]
    let phasesmssg =
    ["LunaNueva":        "Momento de nuevos comienzos y desintoxicación",
     "LunaCreciente":    "Momento de sembrar proyectos nuevos y desarrollarse",
     "CuartoCreciente":  "Momento de superar dificultades y ser productivo",
     "GibosaCreciente":  "Momento de relacionarse e inspirarse",
     "Lunallena":        "Momento de creatividad, romance y resultados",
     "GibosaMenguante":  "Momento de resistir y mantener la calma",
     "CuartoMenguante":  "Momento de introspección",
     "LunaMenguante":    "Momento de conclusiones y nuevas preparaciones"]
    
    var sunrise =  ""
    var sunset  =  ""
    
    // MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        let currentLoc: CLLocation!
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse) {
            currentLoc = locationManager.location
            let aJson = moonPhaser.getTimes(date: Date(), lat: currentLoc.coordinate.latitude, lng:  currentLoc.coordinate.longitude)
            if let sunriseDate = aJson["sunrise"] {
                print(sunriseDate)
                sunrise = castDate(date: sunriseDate)
            }
            if let sunsetDate = aJson["sunset"] {
                print(sunsetDate)
                sunset  = castDate(date: sunsetDate)
            }
            sunriseLbl.text  = sunrise
            moonriseLbl.text = sunset
            locationManager.stopUpdatingLocation()
        }
        let theMoonPhase = getMoonPhase()
        print(theMoonPhase)
        let theHeader = NSAttributedString(string:     (theMoonPhase + "\n\n"),
                                           attributes: TextusAttributes.bigHeader)
        let theText   = NSAttributedString(string:     phasesmssg["LunaNueva"]!,
                                           attributes: TextusAttributes.bigWhite)
        let thehait   = textView.frame.height
        textView.addSubview(GenericTextView(view: textView,
                                            text:   Tools.sumAttributedStrings(theHeader,
                                                                               theText),
                                            height: Double(thehait)))
    }
    
    // MARK:-Functions
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch(CLLocationManager.authorizationStatus()) {
        case .authorizedAlways, .authorizedWhenInUse:
            let currentLoc: CLLocation!
            locationManager.startUpdatingLocation()
            currentLoc = locationManager.location
            let aJson = moonPhaser.getTimes(date: Date(), lat: currentLoc.coordinate.latitude, lng:  currentLoc.coordinate.longitude)
            if let sunriseDate = aJson["sunrise"] {
                print(sunriseDate)
                sunrise = castDate(date: sunriseDate)
            }
            if let sunsetDate = aJson["sunset"] {
                print(sunsetDate)
                sunset  = castDate(date: sunsetDate)
            }
            sunriseLbl.text  = sunrise
            moonriseLbl.text = sunset
            locationManager.stopUpdatingLocation()
        case .denied, .notDetermined, .restricted:
            locationManager.stopUpdatingLocation()
        @unknown default:
            locationManager.stopUpdatingLocation()
        }
    }
    
    func getMoonPhase() -> String {
        let phasemeta = moonPhaser.getMoonIllumination(date: Date())["angle"]! * 100
        let phase     = Int( phasemeta )
        switch phase {
        case 0:
            return phases[0]
        case 1 ..< 25:
            return phases[1]
        case 25:
            return phases[2]
        case 26 ..< 50:
            return phases[3]
        case 50:
            return phases[4]
        case 51 ..< 75:
            return phases[5]
        case 75:
            return phases[6]
        default:
            return phases[7]
        }
    }
    
    
    func castDate(date: Date) -> String {
        let format = DateFormatter()
        format.timeZone = .current
        format.dateFormat = "HH:mm"
        let dateString = format.string(from: date)
        return dateString
    }
    
    //MARK:-Actions
    
    @IBAction func tapBack(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }
}
