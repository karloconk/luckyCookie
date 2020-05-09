//
//  Tools.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 16/04/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit
import Photos
import CoreData
import Foundation

class Tools {
    
    private static var centeredSpinner: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    private static var  spinner : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 75, height: 20))
    
    class func addSpinner(viewController vc: UIViewController) -> UIActivityIndicatorView {
        let centeredSpinner: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        centeredSpinner.color  = Colors.charcoal
        centeredSpinner.center = vc.view.center
        centeredSpinner.startAnimating()
        vc.view.addSubview(centeredSpinner)
        return centeredSpinner
    }
    
    class func stopSpinner(spinner: UIActivityIndicatorView){
        spinner.stopAnimating()
        spinner.isHidden = true
    }
    
    class func sumAttributedStrings(_ first: NSAttributedString, _ second: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.append(first)
        result.append(second)
        return result
    }
    
    class func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {
        
        let cgimage = image.cgImage!
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        let contextSize: CGSize = contextImage.size
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)
        
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
        
        let imageRef: CGImage = cgimage.cropping(to: rect)!
        
        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        
        return image
    }
    
    class func saveColour(colour: String, date: String) {
        self.eliminateAllEntries(entity: EntityNames.colour)

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: EntityNames.colour,
                                                in: managedContext)!
        let luck = NSManagedObject(entity: entity, insertInto: managedContext)
        luck.setValue(colour, forKeyPath: "colour")
        luck.setValue(date,   forKeyPath: "date")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
    }
    
    class func saveNumbers(numbers: [Int], date: String) {
        self.eliminateAllEntries(entity: EntityNames.numbers)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: EntityNames.numbers,
                                                in: managedContext)!
        let luck = NSManagedObject(entity: entity, insertInto: managedContext)
        luck.setValue(numbers[0], forKeyPath: "n1")
        luck.setValue(numbers[1], forKeyPath: "n2")
        luck.setValue(numbers[2], forKeyPath: "n3")
        luck.setValue(date,   forKeyPath: "date")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
    }
    
    class func saveHoroscope(horoscope: String, date: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: EntityNames.luck,
                                                in: managedContext)!
        let luck = NSManagedObject(entity: entity, insertInto: managedContext)
        luck.setValue(horoscope, forKeyPath: "horoscope")
        luck.setValue(date,      forKeyPath: "date")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
    }
    
    class func eliminateAllEntries(entity: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try managedContext.execute(deleteRequest)
        } catch _ as NSError { }
    }
    
    class func retieve(entityName: String) -> [NSManagedObject]? {
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
      let managedContext = appDelegate.persistentContainer.viewContext
      let fetchRequest   = NSFetchRequest<NSManagedObject>(entityName: entityName)
        
      do {
        let resultobj = try managedContext.fetch(fetchRequest)
        return resultobj
      } catch let error as NSError {
        print("Could not fetch. \(error)")
      }
        return []
    }
    
    class func addGestureDown(viewController: UIViewController, action: Selector) {
        let swipeDown       = UISwipeGestureRecognizer(target: viewController, action: action)
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        viewController.view.addGestureRecognizer(swipeDown)
    }
    
    class func shareStuff(viewController: UIViewController, backbtn: UIButton?, shareButton: UIButton? ) {
        if let _ = backbtn {
            backbtn!.isHidden = true
        }
        if let _ = shareButton {
            shareButton!.isHidden = true
        }

        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({ _ in })
        }
        let bounds = UIScreen.main.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        viewController.view.drawHierarchy(in: bounds, afterScreenUpdates: true)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let image = img {
            let vc = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            vc.excludedActivityTypes = [
                UIActivity.ActivityType.assignToContact,
                UIActivity.ActivityType.print,
                UIActivity.ActivityType.addToReadingList,
                UIActivity.ActivityType.openInIBooks,
                UIActivity.ActivityType(rawValue: "com.apple.reminders.RemindersEditorExtension")]
            viewController.present(vc, animated: true)
            if let _ = backbtn {
                backbtn!.isHidden = false
            }
            if let _ = shareButton {
                shareButton!.isHidden = false
            }
        }
    }
    
    class func getZodiac(day: Int, month: Int) -> String {
        var astralSign = ""
        switch month {
        case 12:
            astralSign = day < 22 ? Zodiac.sagitario : Zodiac.capricornio
        case 1:
            astralSign = day < 20 ? Zodiac.capricornio : Zodiac.acuario
        case 2:
            astralSign = day < 19 ? Zodiac.acuario : Zodiac.piscis
        case 3:
            astralSign = day < 21 ? Zodiac.piscis : Zodiac.aries
        case 4:
            astralSign = day < 20 ? Zodiac.aries : Zodiac.tauro
        case 5:
            astralSign = day < 21 ? Zodiac.tauro : Zodiac.geminis
        case 6:
            astralSign = day < 21 ? Zodiac.geminis : Zodiac.cancer
        case 7:
            astralSign = day < 23 ? Zodiac.cancer : Zodiac.leo
        case 8:
            astralSign = day < 23 ? Zodiac.leo : Zodiac.virgo
        case 9:
            astralSign = day < 23 ? Zodiac.virgo : Zodiac.libra
        case 10:
            astralSign = day < 23 ? Zodiac.libra : Zodiac.scorpio
        case 11:
            astralSign = day < 22 ? Zodiac.scorpio : Zodiac.sagitario
        default:
            return astralSign
        }
        return astralSign
    }
}
