//
//  GameInstructionsViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 22/07/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class GameInstructionsViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var textviewContainer: UIView!
    @IBOutlet weak var okok: UIButton!
    
    var titleS = ""
    var message: NSAttributedString = NSAttributedString()
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLbl.text = "Instrucciones de " + titleS
        self.titleLbl.font = Font.getbigFont(size: 33)
        self.okok.titleLabel?.font = Font.getbigFont(size: 28)

        let gview = GenericTextView(view: self.view, text: message, height: 186)
        self.textviewContainer.addSubview(gview)
        self.saveDefault(which: titleS)
    }
    
    func saveDefault(which: String) {
        switch which {
        case InstructionsStrings.a8ballTitle:
            defaults.set("OK", forKey: "8ballGame")
        case InstructionsStrings.aNumeroTitle:
            defaults.set("OK", forKey: "numberGame")
        case InstructionsStrings.colourTitle:
            defaults.set("OK", forKey: "colourGame")
        case InstructionsStrings.jigSawTitle:
            defaults.set("OK", forKey: "jigsawTitle")
        case InstructionsStrings.memoriaTitle:
            defaults.set("OK", forKey: "memoriaGame")
        default:
            return
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func okbutton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
