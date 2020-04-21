//
//  bolaOchoViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 18/04/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class bolaOchoViewController: UIViewController {

    // MARK:- Outlets
    
    @IBOutlet weak var topText: UILabel!
    @IBOutlet weak var responseText: UILabel!
    @IBOutlet weak var responseBG: UIImageView!
    @IBOutlet weak var bottomText: UILabel!
    @IBOutlet weak var bottomKacham: UIImageView!
    
    // MARK:- Variables
    
    var isResponse = false
    let answers = ["Parece que sí","Pregunta de nuevo","Mejor no decirte","No se puede predecir ","No creo","Es cierto","Así es","Muy probable","No","Parece que no","No suena bien","Suena bien","No lo se","Muy dudoso","Sin duda","Sí","Sí, seguro" ]

    // MARK:- Lifecycle
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            isResponse = true
            chooseAnswer()
            topText.text    = BolaOchoTexts.titleOn
            bottomText.text = BolaOchoTexts.bottomOn
            //UIView.animate(withDuration: 0.8, delay: 0.3, options: .curveLinear, animations: {
            //    self.bottomKacham.alpha = 1.0
            //}, completion: nil )
            UIView.animate(withDuration: 1.0, delay: 0.3, options: .curveLinear, animations: {
                self.responseText.alpha = 1.0
                self.responseBG.alpha = 1.0
            }, completion: nil )
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.responseText.alpha = 0.0
        self.responseBG.alpha   = 0.0
        self.bottomKacham.alpha = 0.0
    }

    // MARK:- Functions
    
    func chooseAnswer() {
        let randomNum = Int.random(in: 0...(answers.count - 1))
        let answer = answers[randomNum]
        self.responseText.text = answer
    }

    // MARK:- Actions
    
    @IBAction func tapBolaOcho(_ sender: Any) {
        if isResponse {
            self.responseText.alpha = 0.0
            self.responseBG.alpha   = 0.0
            self.bottomKacham.alpha = 0.0
            topText.text    = BolaOchoTexts.titleOff
            bottomText.text = BolaOchoTexts.bottomOff
            isResponse = false
        }
    }
    
    @IBAction func tapBack(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }
    
}
