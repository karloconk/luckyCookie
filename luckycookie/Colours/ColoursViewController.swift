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

    let colours = ["rojo","rosa",  "naranja","amarillo","verde",
                   "azul","marron","morado", "negro",   "blanco"]
    //MARK:- Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        obtentucolorlabel.textColor = Colors.charcoal
        tocabotonlbl.textColor      = Colors.neutral
        textView.isHidden           = true
    }
    
    //MARK:- Functions
    
    func chooseColour() {
        let randomNum = Int.random(in: 0...(colours.count - 1))
        let colour = colours[randomNum]
        setColour(colour: colour)
    }
    
    func setColour(colour: String) {
        textView.isHidden = false
        obtentucolorlabel.text = colour
        obtentucolorlabel.textColor = Colors.blanco

        switch colour {
        case "rojo"     :
            self.view.backgroundColor = ColoursColors.rojo
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.rojo,
                                                height: 100))
        case "rosa"     :
            self.view.backgroundColor = ColoursColors.rosa
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.rosa,
                                                height: 100))
        case "naranja"  :
            self.view.backgroundColor = ColoursColors.naranja
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.naranja,
                                                height: 100))
        case "amarillo" :
            self.view.backgroundColor = ColoursColors.amarillo
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.amarillo,
                                                height: 100))
        case "verde"    :
            self.view.backgroundColor = ColoursColors.verde
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.verde,
                                                height: 100))
        case "azul"     :
            self.view.backgroundColor = ColoursColors.azul
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.azul,
                                                height: 100))
        case "marron"   :
            self.view.backgroundColor = ColoursColors.marron
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.marron,
                                                height: 100))
        case "morado"   :
            self.view.backgroundColor = ColoursColors.morado
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.morado,
                                                height: 100))
        case "negro"    :
            self.view.backgroundColor = ColoursColors.negro
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.negro,
                                                height: 100))
        case "blanco"   :
            self.view.backgroundColor = ColoursColors.blanco
            textView.addSubview(GenericTextView(view: textView,
                                                text: ColoursStrings.blanco,
                                                height: 100))
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
    }
    
}
