//
//  DataViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 04/02/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var fondoView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var luckyButton: UIButton!
    @IBOutlet weak var popImage: UIImageView!
    @IBOutlet weak var topSeparator: UIImageView!
    @IBOutlet weak var bottomSeparataror: UIImageView!
    @IBOutlet weak var luckyLabel: UILabel!
    @IBOutlet weak var luckyImage: UIImageView!
    @IBOutlet weak var fondo: UIView!
    @IBOutlet weak var bottomLabel: UILabel!
    
    //MARK:- Vars
    
    var galletaImagecerrada: UIImage = Imagenes.basicClosed!
    var galletaImageabierta: UIImage = Imagenes.basicOpen!
    var popgalletaImage:     UIImage = Imagenes.basicPop!
    var separadorTopImage:   UIImage = Imagenes.basicTop!
    var luckbgImage:         UIImage = Imagenes.basicLuck!
    var currentTitle: String = "Basic"
    var index: Int?
    let topSeparatorHideSecs = 0.25
    var touched = false
    let lucks = ["Estandar": ["Revisa pantalones viejos y encontrarás dinero.", "Come frutas y verduras y toma agua", "El tiempo lo arregla todo", "Conseguiras boletos para ese evento que quieres", "Viste de \(UIColor.random()) y tendrás un buen día", "Tus numeros de la suerte: 98,45,67,13,24", "La suerte cambia, mantente fuerte", "Tu pasión y empeño serán recompensados pronto", "Revisa y ordena tus prioridades", "Todos tus sueños están al alcance de tus manos"],
    "Mala Suerte": ["Pisarás popó de perro", "Traes comida entre los dientes", "Se te está olvidando algo", "¿Apagaste la estufa?", "Ten cuidado con las escaleras", "Tendrás un grano en la nariz", "Tu ex te buscará", "Gastarás todos tus datos por error", "No habrá papel en el baño", "Cuidado con la popó de pájaro hoy"],
    "Amor": ["Alguien te besará", "Recibirás muchos abrazos", "El amor te encontrará", "Verás algo muy adorable", "Usa ropa rosa y algo bello te pasará", "Hay mucho amor propio en tu futuro", "Los chocolates con forma de corazón no engordan", "Tu crush te correspondrá", "Evita declaraciones públicas hoy", "El verdadero amor está en tus amistades"],
    "Mistica": ["Usa cristales y conquistaras", "La luna te favorece hoy", "El sol no es tu amigo hoy", "cuidado con las criaturas misticas", "No todo lo que tiene cuernos es malo", "No toques oro hoy", "La noche te traera sorpresas", "Hoy es un buen dia para una pocion de amor", "Manana te visitara un espiritu viejo", "La dama de negro a veces es amiga"],
    "Mascotas": ["¿Que trae tu mascota en la boca?", "Tu mascota te usará como almohada hoy", "Hoy es buen dia para selfie con amiguitos peludos", "Tu mascota dejara una sorpresita en tu casa", "No hay mascota mas preciosa que la tuya ", "Probablemente tendras otra mascota pronto", "cuida a tu amiguito peludo puede estar muy triste"],
    "Escuela": ["El tema que estudiaste no vendrá en el examen", "Saldras bien en los exmenes", "La chavita de adelante te hablara ", "No hagas caso a las ninias de atras, son malas", "deberias comprar esa mochila que viste online", "tus lapices de colores estan preciosos", "Es momento de preparase pra la batalla"],
    "Deportes": ["Tu equipo favorito será campeón", "no compres muchos dips para el partido de hoy", "No te lastimaras hoy"],
    "Chelera":  [],
    "Rosca de reyes":  [],
    "Feminista":  [],
    "Primavera":  [],
    "Vacaciones":  [],
    "Pride":  [],
    "Mexa":  [],
    "Halloween":  [],
    "Compras":  [],
    "Christmas":  [],
    "New Year":  [],
    "Remix":  []]

    //MARK:- Actions
    
    @IBAction func buttonTapped(_ sender: Any) {
        if touched {
            reset()
        } else {
            popCookie()
            hideTopSeparator()
            showMessage()
        }
    }
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColours()
        setImages()
        self.fondo.alpha        = 0.0
        self.topSeparator.alpha = 1.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        GlobalVars.currentBolita = self.index!
    }
    
    //MARK:- Functions
                
    func setBackground(image: UIImage) {
        let backgroundColor = UIColor(patternImage: image)
        self.view.backgroundColor = backgroundColor
    }
    
    func hideTopSeparator() {
        UIView.animate(withDuration: 0.8, delay: 0.25, options: .curveLinear, animations: {
            self.topSeparator.alpha = 0.0
        }, completion: nil)
    }
    
    func popCookie() {
        self.mainImage.image   = self.galletaImageabierta
        self.popImage.isHidden = false
    }

    func showMessage() {
        chooseMessage()
        UIView.animate(withDuration: 0.8, delay: 0.25, options: .curveLinear, animations: {
            self.fondo.alpha = 1.0
        }, completion: nil)
        self.touched = true
        self.bottomLabel.text = "Tap the cookie to Retry"
    }
    
    func chooseMessage() {
        let luck = lucks[self.currentTitle]![Int.random(in: 0...(lucks[self.currentTitle]!.count - 1))]
        luckyLabel.text = luck
    }
    
    func reset() {
        self.fondo.alpha = 0.0
        self.popImage.isHidden = true
        self.mainImage.image   = self.galletaImagecerrada
        UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveLinear, animations: {
            self.topSeparator.alpha = 1.0
        }, completion: nil)
        self.touched = false
        self.bottomLabel.text = "Tap the cookie"
    }
    
    func setColours() {
        switch self.currentTitle {
        case "Estandar":
            self.bottomLabel.textColor = Colours.basicTap
            self.view.backgroundColor  = Colours.basicBackground
            self.luckyLabel.textColor  = Colours.basicLuck
        case "Mala Suerte":
            self.bottomLabel.textColor = Colours.badTap
            self.view.backgroundColor  = Colours.badBackground
            self.luckyLabel.textColor  = Colours.badLuck
        case "Amor":
            self.bottomLabel.textColor = Colours.loveTap
            self.view.backgroundColor  = Colours.loveBackground
            self.luckyLabel.textColor  = Colours.loveLuck
        default:
            self.bottomLabel.textColor = Colours.basicTap
            self.view.backgroundColor  = Colours.basicBackground
            self.luckyLabel.textColor  = Colours.basicLuck
        }
    }
    
    func setImages() {
        switch self.currentTitle {
        case "Estandar":
            self.galletaImagecerrada = Imagenes.basicClosed!
            self.galletaImageabierta = Imagenes.basicOpen!
            self.popgalletaImage     = Imagenes.basicPop!
            self.separadorTopImage   = Imagenes.basicTop!
            self.luckbgImage         = Imagenes.basicLuck!
        case "Mala Suerte":
            self.galletaImagecerrada = Imagenes.badClosed!
            self.galletaImageabierta = Imagenes.badOpen!
            self.popgalletaImage     = Imagenes.badPop!
            self.separadorTopImage   = Imagenes.badTop!
            self.luckbgImage         = Imagenes.badLuck!
        case "Amor":
            self.galletaImagecerrada = Imagenes.loveClosed!
            self.galletaImageabierta = Imagenes.loveOpen!
            self.popgalletaImage     = Imagenes.lovePop!
            self.separadorTopImage   = Imagenes.loveTop!
            self.luckbgImage         = Imagenes.loveLuck!
        default:
            self.galletaImagecerrada = Imagenes.basicClosed!
            self.galletaImageabierta = Imagenes.basicOpen!
            self.popgalletaImage     = Imagenes.basicPop!
            self.separadorTopImage   = Imagenes.basicTop!
            self.luckbgImage         = Imagenes.basicLuck!
        }

        self.mainImage.image         = self.galletaImagecerrada
        self.popImage.image          = self.popgalletaImage
        self.topSeparator.image      = self.separadorTopImage
        self.bottomSeparataror.image = self.separadorTopImage
        self.luckyImage.image        = self.luckbgImage
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
