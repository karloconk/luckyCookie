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
    @IBOutlet weak var backbutton: UIButton!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var luckyButton: UIButton!
    @IBOutlet weak var popImage: UIImageView!
    @IBOutlet weak var topSeparator: UIImageView!
    @IBOutlet weak var bottomSeparataror: UIImageView!
    @IBOutlet weak var luckyLabel: UILabel!
    @IBOutlet weak var luckyImage: UIImageView!
    @IBOutlet weak var fondo: UIView!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var suerteTitle: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var kachamLogo: UIImageView!
    
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
    var modelName = UIDevice.modelName
    var littleiphone = false

    let lucks =
        ["Estandar":["Estos números significan algo hoy:","Viste de \( GlobalVars.colores.randomElement()!.description) y tendrás un buen día","Come frutas y verduras","El tiempo lo arregla todo","Conseguiras boletos para ese evento que quieres","La suerte cambia, mantente fuerte","Tu pasión y empeño serán recompensados pronto","Revisa y ordena tus prioridades","Todos tus sueños están al alcance de tus manos","La venganza es un platillo frio","Quizas llegue un nuevo iphone a tu vida","Hoy tu suerte con los animales es buena","Para gustos, colores","No sé si apostar sea la mejor idea","La comida te va a saber genial","Conocerás gente interesante","El dinero es importante pero no lo es todo","Si tu sientes que te pica la colita...","Busca la felicidad en las cosas cotidianas","Relajate un momento, te lo mereces","Te mereces ese aumento","Tu puedes con todo","Huir de tu pasado lo acerca más","Es momento de comenzar ese proyecto que te asusta","Sigue aprendiendo y seguirás creciendo","Procupa tomar un respiro antes de continuar","Toma agua","Sé y deja ser","Que ninguno de tus gustos sea \"culposo\""],
         "Mala Suerte":["Evita estos números hoy:","Si vistes de \( GlobalVars.colores.randomElement()!.description) puede que no te vaya bien hoy","Pisarás popó de perro","Traes comida entre los dientes","Se te está olvidando algo","¿Apagaste la estufa?","Ten cuidado con las escaleras","Te saldra un grano en la nariz","Tu ex te buscará","Gastarás todos tus datos por error","No habrá papel en el baño","Cuidado con la popó de pájaro hoy","El trafico estara feo","Cuidado con las alergias","Se te olvidara tu celular en algun lado","No te olvides de revisar ambos lados de la calle","Alguien no te quiere","Hoy sera duro","Eres un farzante","Hueles feo","Te saldra un grano en la nariz. Toma tus precausiones.","Uno de tus audífonos dejará de funcionar.","Tienes menos dinero del que crees en la cartera","Estrellarás la pantalla de tu celular","Tu pantalón favorito de romperá pronto","A tu crush le gusta otrx","Un calcetín rojo se esconde entre la ropa blanca","Carga banditas adhesivas contigo hoy","Tu alarma no sonará hoy"],
         "Amor":["Estos números son señal de un amor próximo:","Si ves el color \( GlobalVars.colores.randomElement()!.description) es una senal","Alguien te besará","Recibirás muchos abrazos","El amor te encontrará","Verás algo muy adorable","Usa ropa rosa y algo bello te pasará","Hay mucho amor en tu futuro","Los chocolates con forma de corazón no engordan","Tu crush te correspondrá","Evita declaraciones públicas hoy","El verdadero amor está en tus amistades","Alguien te quiere","Hay muchos peces en el mar","Eres bellx, no lo olvides","Algunos amores son pasajeros","Algunos amores son para siempre","No estoy diciendo que nadie te dara un anillo...","Hoy conoceras a alguien","Recuerda que los amarres afectan a ambas partes","No le des agua de calzón, por favor","Aprecia a los que están mientras siguen contigo","Un amor sano es mejor que uno de película","Deja ir a quien no te hace feliz","Mejora tu comunicación y mejorará tu relación","No te enamores de un músico","Escribe con pluma rosa y tu suerte cambiará","Ámate como amas a otros","Recuerda que toda relación es recíproca"],
         "Dinero":["Estos números son señal de dinero:","Si ves el color \( GlobalVars.colores.randomElement()!.description) es una senal","Revisa pantalones viejos y encontrarás dinero.","Quizas es buen momento para invertir","Esas compras en linea no se van a hacer solas","Compra la opcion mas cara, durara mas","a veces es mejor guardartelo que gastarlo","No necesitas ese par de zapatos nuevo","Necesitas ese par de zapatos nuevo","Viene fortuna a ti","Cuida tus gastos","Vienen tiempos dificiles","se te cayo ese billete de 20?","Eso que quieres va a bajar de precio","Ese vuelo esta a punto de despegar","El dinero no lo es todo","Si ves una oportunidad tomala","Necesitas esperar","Tu fortuna te espera en un pantalón viejo","Los secretos se guardan, el dinero no","Gasta sin mal gastar","La verdadera riqueza no es monetaria","Invierte inteligente, pero sin miedo","Trabaja con pasión y el dinero llegará solo","El verdadero valor no se ve en el precio","Deja ir el dinero que no necesitas","Las pérdidas de hoy serán recompensadas mañana","El dinero huye de aquellos que lo persiguen","Será un buen día para destruir el capitalismo opresor"]]
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kachamLogo.isHidden = true
        shareButton.alpha   = 0.0
        shareButton.isUserInteractionEnabled = false
        setColours()
        setImages()
        self.fondo.alpha        = 0.0
        self.topSeparator.alpha = 1.0
        setProximamente()
        setLittleIphone()
        Tools.addGestureDown(viewController: self, action: #selector(dismissme))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        GlobalVars.currentBolita = self.index!
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        shareButton.alpha   = 0.0
        shareButton.isUserInteractionEnabled = false
        if self.currentTitle != "Proximamente" {
            resetTurbo()
        }
    }
    
    //MARK:- Functions
    
    func setLittleIphone() {
        self.modelName = self.modelName.replacingOccurrences(of: "Simulator ", with: "")
        print(modelName)

        if  modelName == "iPhone 4"
         || modelName == "iPhone 4s"
         || modelName == "iPhone 5"
         || modelName == "iPhone 5c"
         || modelName == "iPhone 5s"
         || modelName == "iPhone 6"
         || modelName == "iPhone 6s"
         || modelName == "iPhone 7"
         || modelName == "iPhone SE"
         || modelName == "iPhone 8"  {
            self.bottomSeparataror.isHidden = true
            littleiphone = true
        }
    }
    
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
        self.view.isUserInteractionEnabled = false
        self.bottomLabel.text  = "Toca de nuevo"
        self.bottomLabel.alpha = 0.0
        UIView.animate(withDuration: 0.8, delay: 0.25, options: .curveLinear, animations: {
            self.fondo.alpha = 1.0
            self.bottomLabel.alpha = 1.0
            self.shareButton.alpha = 1.0
        }, completion: {(Bool) in self.view.isUserInteractionEnabled = true
            self.shareButton.isUserInteractionEnabled = true
        })
        self.touched = true
    }
    
    func chooseMessage() {
        let randomNum = Int.random(in: 0...(lucks[self.currentTitle]!.count - 1))
        let luck = lucks[self.currentTitle]![randomNum]
        luckyLabel.text = randomNum == 0 ? luck + randomNums()  : luck
    }
    
    func reset() {
        kachamLogo.isHidden = true
        shareButton.alpha   = 0.0
        shareButton.isUserInteractionEnabled = false
        self.fondo.alpha = 0.0
        self.popImage.isHidden = true
        self.mainImage.image   = self.galletaImagecerrada
        UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveLinear, animations: {
            self.topSeparator.alpha = 1.0
            self.suerteTitle.alpha = 1.0
        }, completion: nil)
        self.touched = false
        self.bottomLabel.text = "Toca la galleta"
    }
    
    func resetTurbo() {
        self.fondo.alpha = 0.0
        self.popImage.isHidden = true
        self.mainImage.image   = self.galletaImagecerrada
        self.topSeparator.alpha = 1.0
        self.touched = false
        self.suerteTitle.alpha = 1.0
        self.bottomLabel.text = "Toca la galleta"
    }
    
    func randomNums() -> String {
        return "\n\(Int.random(in: 1...99)), \(Int.random(in: 1...99)) y \(Int.random(in: 1...99))"
    }
    
    func setProximamente() {
        if self.currentTitle == "Proximamente" {
            fondoView.backgroundColor = Colours.badLuck
            // mainImage.image = darkimage
            luckyButton.isEnabled      = false
            popImage.isHidden          = true
            topSeparator.isHidden      = true
            bottomSeparataror.isHidden = true
            luckyLabel.isHidden        = true
            luckyImage.isHidden        = true
            self.suerteTitle.isHidden  = true
            bottomLabel.text = "Espera más próximamente..."
        }
    }
    
    func setColours() {
        switch self.currentTitle {
        case "Estandar":
            self.shareButton.tintColor = Colours.basicTap
            self.backbutton.tintColor  = Colours.basicTap
            self.bottomLabel.textColor = Colours.basicTap
            self.view.backgroundColor  = Colours.basicBackground
            self.luckyLabel.textColor  = Colours.basicLuck
            self.suerteTitle.textColor = Colours.basicTap
            self.suerteTitle.text      = "Galleta de la Fortuna"
        case "Mala Suerte":
            self.shareButton.tintColor = Colours.badTap
            self.backbutton.tintColor  = Colours.badTap
            self.bottomLabel.textColor = Colours.badTap
            self.view.backgroundColor  = Colours.badBackground
            self.luckyLabel.textColor  = Colours.badLuck
            self.suerteTitle.textColor = Colours.badTap
            self.suerteTitle.text      = "Galleta de la Miseria"
        case "Amor":
            self.shareButton.tintColor = Colours.loveTap
            self.backbutton.tintColor  = Colours.loveTap
            self.bottomLabel.textColor = Colours.loveTap
            self.view.backgroundColor  = Colours.loveBackground
            self.luckyLabel.textColor  = Colours.loveLuck
            self.suerteTitle.textColor = Colours.loveTap
            self.suerteTitle.text      = "Galleta del Amor"
        case "Dinero":
            self.shareButton.tintColor = Colours.moneyTap
            self.backbutton.tintColor  = Colours.moneyTap
            self.bottomLabel.textColor = Colours.moneyTap
            self.view.backgroundColor  = Colours.moneyBackground
            self.luckyLabel.textColor  = Colours.moneyLuck
            self.suerteTitle.textColor = Colours.moneyTap
            self.suerteTitle.text      = "Galleta del Dinero"
        default:
            self.shareButton.tintColor = Colours.basicTap
            self.backbutton.tintColor  = Colours.basicTap
            self.bottomLabel.textColor = Colours.basicTap
            self.view.backgroundColor  = Colours.basicBackground
            self.luckyLabel.textColor  = Colours.basicLuck
            self.suerteTitle.textColor = Colours.basicTap
            self.suerteTitle.text      = "Galleta de la Fortuna"
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
            self.kachamLogo.image    = UIImage(named: "KachamLogo_Blanco")!
        case "Amor":
            self.galletaImagecerrada = Imagenes.loveClosed!
            self.galletaImageabierta = Imagenes.loveOpen!
            self.popgalletaImage     = Imagenes.lovePop!
            self.separadorTopImage   = Imagenes.loveTop!
            self.luckbgImage         = Imagenes.loveLuck!
        case "Dinero":
            self.galletaImagecerrada = Imagenes.moneyClosed!
            self.galletaImageabierta = Imagenes.moneyOpen!
            self.popgalletaImage     = Imagenes.moneyPop!
            self.separadorTopImage   = Imagenes.moneyTop!
            self.luckbgImage         = Imagenes.moneyLuck!
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
    
    //MARK:- Actions
    
    @IBAction func buttonTapped(_ sender: Any) {
        if touched {
            reset()
        } else {
            popCookie()
            hideTopSeparator()
            showMessage()
            self.suerteTitle.alpha = 0.0
        }
    }
    
    @IBAction func backbuttonTapped(_ sender: Any) {
        dismissme()
    }
    
    @objc func dismissme() {
        self.dismiss(animated: true, completion: {})
    }
    
    @IBAction func shareme(_ sender: Any) {
        self.kachamLogo.isHidden  = littleiphone
        self.bottomLabel.isHidden = true
        Tools.shareStuff(viewController: self,
                         backbtn:        self.backbutton,
                         shareButton:    self.shareButton)
        self.kachamLogo.isHidden  = true
        self.bottomLabel.isHidden = false
    }
    
}
