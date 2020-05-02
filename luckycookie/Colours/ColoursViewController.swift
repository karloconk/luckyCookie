//
//  ColoursViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 18/04/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class ColoursViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var obtentucolorlabel: UILabel!
    @IBOutlet weak var tocabotonlbl: UILabel!
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var colourButton: UIButton!
    @IBOutlet weak var colourImage: UIImageView!
    @IBOutlet weak var textView: UIView!
    
    @IBOutlet weak var bottomKacham: UIImageView!
    //MARK:- Variables
    
    let colours  = ["rojo","rosa",  "naranja","amarillo","verde",
                    "azul","marron","morado", "negro",   "blanco"]
    var oldcolour = ""
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obtentucolorlabel.textColor = Colors.charcoal
        tocabotonlbl.textColor      = Colors.neutral
        textView.isHidden           = true
        if oldcolour != "" {
            setupOldC()
        }
    }
    
    //MARK:- Functions
    
    func setupOldC() {
        tocabotonlbl.isHidden      = true
        colourButton.isHidden      = true
        colourImage.isHidden       = true
        setColour(colour: oldcolour)
    }
    
    func saveDate() {
        let date             = Date()
        let formatter        = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let todaysdate       = formatter.string(from: date)
        Tools.saveColour(colour: oldcolour, date: todaysdate)
    }
    
    func chooseColour() {
        let randomNum = Int.random(in: 0...(colours.count - 1))
        let colour = colours[randomNum]
        setColour(colour: colour)
    }
    
    func setColour(colour: String) {
        textView.isHidden = false
        obtentucolorlabel.text = colour
        obtentucolorlabel.textColor = Colors.blanco
        let thehait   = textView.frame.height
        self.oldcolour = colour
        switch colour {
        case "rojo"     :
            UIView.animate(withDuration: 1.0, delay: 0.0, options:[.repeat, .autoreverse], animations: {
                self.view.backgroundColor = ColoursColors.rojo
            }, completion:nil)
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.rojo,
                                                height: Double(thehait)))
        case "rosa"     :
            UIView.animate(withDuration: 1.0, delay: 0.0, options:[], animations: {
                self.view.backgroundColor = ColoursColors.rosa
            }, completion:nil)
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.rosa,
                                                height: Double(thehait)))
        case "naranja"  :
            UIView.animate(withDuration: 1.0, delay: 0.0, options:[], animations: {
                self.view.backgroundColor = ColoursColors.naranja
            }, completion:nil)
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.naranja,
                                                height: Double(thehait)))
        case "amarillo" :
            UIView.animate(withDuration: 1.0, delay: 0.0, options:[], animations: {
                self.view.backgroundColor = ColoursColors.amarillo
            }, completion:nil)
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.amarillo,
                                                height: Double(thehait)))
        case "verde"    :
            UIView.animate(withDuration: 1.0, delay: 0.0, options:[], animations: {
                self.view.backgroundColor = ColoursColors.verde
            }, completion:nil)
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.verde,
                                                height: Double(thehait)))
        case "azul"     :
            UIView.animate(withDuration: 1.0, delay: 0.0, options:[], animations: {
                self.view.backgroundColor = ColoursColors.azul
            }, completion:nil)
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.azul,
                                                height: Double(thehait)))
        case "marron"   :
            UIView.animate(withDuration: 1.0, delay: 0.0, options:[], animations: {
                self.view.backgroundColor = ColoursColors.marron
            }, completion:nil)
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.marron,
                                                height: Double(thehait)))
        case "morado"   :
            UIView.animate(withDuration: 1.0, delay: 0.0, options:[], animations: {
                self.view.backgroundColor = ColoursColors.morado
            }, completion:nil)
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.morado,
                                                height: Double(thehait)))
        case "negro"    :
            UIView.animate(withDuration: 1.0, delay: 0.0, options:[], animations: {
                self.view.backgroundColor = ColoursColors.negro
            }, completion:nil)
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.negro,
                                                height: Double(thehait)))
        case "blanco"   :
            self.view.backgroundColor = ColoursColors.negro
            UIView.animate(withDuration: 1.0, delay: 0.0, options:[], animations: {
                self.view.backgroundColor = ColoursColors.blanco
            }, completion:nil)
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.blanco,
                                                height: Double(thehait)))
            obtentucolorlabel.textColor = Colors.charcoal
            bottomKacham.image = UIImage(named: "KachamLogo_Black")
        default:
            break
        }
    }
    
    //MARK:- Actions
    
    @IBAction func backbuttonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }
    
    @IBAction func colourButtonTapped(_ sender: Any) {
        tocabotonlbl.isHidden      = true
        colourButton.isHidden      = true
        colourImage.isHidden       = true
        chooseColour()
        saveDate()
    }
    
}
