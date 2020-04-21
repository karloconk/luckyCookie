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

class MoonsViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK:- Outlets
    
    @IBOutlet weak var moonriseLbl: UILabel!
    @IBOutlet weak var sunriseLbl:  UILabel!
    @IBOutlet weak var textView:    UIView!
    @IBOutlet weak var moonImage:   UIImageView!
    
    @IBOutlet weak var actualMoon: UIImageView!
    // MARK:- Variables
    let moonPhaser      = SwiftySuncalc()
    var locationManager = CLLocationManager()
    
    let phases     = [  "LunaNueva",
                        "LunaCreciente",
                        "CuartoCreciente",
                        "GibosaCreciente",
                        "Lunallena",
                        "GibosaMenguante",
                        "CuartoMenguante",
                        "LunaMenguante"]
    let phasesmssg =
    ["LunaNueva":        "Momento de nuevos comienzos y desintoxicación",
     "LunaCreciente":    "Momento de sembrar proyectos nuevos y desarrollarse",
     "CuartoCreciente":  "Momento de superar dificultades y ser productivo",
     "GibosaCreciente":  "Momento de relacionarse e inspirarse",
     "Lunallena":        "Momento de creatividad, romance y resultados",
     "GibosaMenguante":  "Momento de resistir y mantener la calma",
     "CuartoMenguante":  "Momento de introspección",
     "LunaMenguante":    "Momento de conclusiones y nuevas preparaciones"]
    
    let phasesImg =
        ["LunaNueva":        MoonImages.LunaNueva,
         "LunaCreciente":    MoonImages.LunaCreciente,
         "CuartoCreciente":  MoonImages.CuartoCreciente,
         "GibosaCreciente":  MoonImages.GibosaCreciente,
         "Lunallena":        MoonImages.Lunallena,
         "GibosaMenguante":  MoonImages.GibosaMenguante,
         "CuartoMenguante":  MoonImages.CuartoMenguante,
         "LunaMenguante":    MoonImages.LunaMenguante]
    
    let phasesTitle =
        ["LunaNueva":        "Luna nueva",
         "LunaCreciente":    "Creciente",
         "CuartoCreciente":  "Cuarto creciente",
         "GibosaCreciente":  "Gibosa creciente",
         "Lunallena":        "Luna llena",
         "GibosaMenguante":  "Gibosa menguante",
         "CuartoMenguante":  "Cuarto menguante",
         "LunaMenguante":    "Menguante"]
    
    var sunrise =  ""
    var sunset  =  ""
    
    // MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        
        if     CLLocationManager.authorizationStatus() == .denied
            || CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        let currentLoc: CLLocation!
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse) {
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
        }
        let theMoonPhase = getMoonPhase()
        print(theMoonPhase)
        self.actualMoon.image = phasesImg[theMoonPhase]!
        let theTaitle = phasesTitle[theMoonPhase]!
        let theHeader = NSAttributedString(string:     (theTaitle + "\n\n"),
                                           attributes: TextusAttributes.bigHeader)
        let theText   = NSAttributedString(string:     phasesmssg[theMoonPhase]!,
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
