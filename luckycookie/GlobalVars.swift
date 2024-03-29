//
//  GlobalVars.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 17/02/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import Foundation
import UIKit

enum EntityNames {
    public static let luck    = "Luck"
    public static let numbers = "Numbers"
    public static let colour  = "Colour"
}

struct GlobalVars {
    static var currentBolita: Int = 0
    static let colores = ["amarillo","ámbar","añil","azul","azul claro","azul eléctrico","azul marino","beige","bermellón","blanco","blanco marfil","café","caoba","caqui","carmesí","castaño","celeste","cereza","champán","cian","cobre","color terracota","coral","crema","fucsia","granate","gris","hueso","lavanda","lila","magenta","marrón","chocolate","morado","naranja","negro","ocre","dorado","pardo","plata","púrpura","rojo","rojo carmín","rojo óxido","rosa","salmón ","turquesa","verde","verde botella ","verde esmeralda","verde lima","verde manzana","verde musgo","verde oliva","verde pistache","verdeagua","violeta","vino"]
}

public enum Colors {
    public static let charcoal  = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
    public static let blanco    = UIColor(red:1.00,  green:1.00,  blue:1.00,  alpha:1.0)
    public static let neutral   = UIColor(red: 0.50, green: 0.50, blue: 0.50, alpha: 1.00)
    public static let manatee   = UIColor(red:0.93,  green:0.94,  blue:0.96,  alpha:1.0)
    public static let violet    = UIColor(red: 0.73, green: 0.58, blue: 0.87, alpha: 1.00)
    public static let moonshine = UIColor(red: 0.00, green: 0.00, blue: 0.20, alpha: 1.00)
    public static let upperNum  = UIColor(red: 0.40, green: 0.18, blue: 0.57, alpha: 1.00)
    public static let lowerNum  = UIColor(red: 0.58, green: 0.15, blue: 0.56, alpha: 1.00)
    public static let lightblue = UIColor(red: 0.77, green: 0.87, blue: 0.96, alpha: 1.00)
    public static let tweety    = UIColor(red: 1.00, green: 0.92, blue: 0.00, alpha: 1.00)
}

public enum SpaceUnits {
    public static let zero    = CGFloat(0)
    public static let quarter = CGFloat(8/4)
    public static let half    = CGFloat(8/2)
    public static let one     = CGFloat(8)
    public static let two     = CGFloat(16)
    public static let three   = CGFloat(24)
    public static let four    = CGFloat(32)
    public static let five    = CGFloat(8*5)
    public static let ten     = CGFloat(8*10)
}

enum DashBoardValues {
    public static let bGCookie = Colours.basicBackground
    public static let iHCookie = 100.0
}


enum TextusAttributes {
    public static let bigBlack = Font.getAttributes(lineSpacing:   6.0,
                                                    fontColour:    Colors.charcoal,
                                                    typo:          Font.getbigFont(size: 20),
                                                    isUnderlined:  false)
    public static let bigWhite = Font.getAttributes(lineSpacing:   6.0,
                                                    fontColour:    Colors.blanco,
                                                    typo:          Font.getbigFont(size: 20),
                                                    isUnderlined:  false)
    public static let bigHeader = Font.getAttributes(lineSpacing:  6.0,
                                                     fontColour:   Colors.blanco,
                                                     typo:         Font.getbigFont(size: 22),
                                                     isUnderlined: false)
    public static let normell = Font.getAttributes(lineSpacing:  12.0,
                                                   fontColour:   Colors.neutral,
                                                   typo:         Font.getbigFont(size: 24),
                                                   isUnderlined: false)
}

enum ColoursStrings {
    public static let rojo     = NSAttributedString(string: "Pasión, fuerza, peligro y atracción" , attributes: TextusAttributes.bigWhite)
    public static let rosa     = NSAttributedString(string: "Amabilidad, ternura, romance y dulzura" , attributes: TextusAttributes.bigWhite)
    public static let naranja  = NSAttributedString(string: "Diversión, sabor, sensualidad y exaltación" , attributes: TextusAttributes.bigWhite)
    public static let amarillo = NSAttributedString(string: "Optimismo, creatividad, energía y amistad" , attributes: TextusAttributes.bigWhite)
    public static let verde    = NSAttributedString(string: "Juventud, esperanza, frescura y naturaleza" , attributes: TextusAttributes.bigWhite)
    public static let azul     = NSAttributedString(string: "Tranquilidad, nobleza, inteligencia y seguridad" , attributes: TextusAttributes.bigWhite)
    public static let marron   = NSAttributedString(string: "Fuerza, seriedad, dignidad y comodidad" , attributes: TextusAttributes.bigWhite)
    public static let morado   = NSAttributedString(string: "Elegancia, poder, nobleza y magia" , attributes: TextusAttributes.bigWhite)
    public static let negro    = NSAttributedString(string: "Misterio, sobriedad, formalidad y objetividad" , attributes: TextusAttributes.bigWhite)
    public static let blanco   = NSAttributedString(string: "Pureza, inocencia, paz y limpieza", attributes: TextusAttributes.bigBlack)
}

public enum ColoursColors {
    public static let rojo     = UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.00)
    public static let rosa     = UIColor(red: 0.92, green: 0.38, blue: 0.52, alpha: 1.00)
    public static let naranja  = UIColor(red: 1.00, green: 0.40, blue: 0.00, alpha: 1.00)
    public static let amarillo = UIColor(red: 1.00, green: 0.80, blue: 0.00, alpha: 1.00)
    public static let verde    = UIColor(red: 0.00, green: 0.60, blue: 0.20, alpha: 1.00)
    public static let azul     = UIColor(red: 0.00, green: 0.60, blue: 0.80, alpha: 1.00)
    public static let marron   = UIColor(red: 0.40, green: 0.20, blue: 0.00, alpha: 1.00)
    public static let morado   = UIColor(red: 0.40, green: 0.00, blue: 0.60, alpha: 1.00)
    public static let negro    = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
    public static let blanco   = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
}

enum Zodiac {
    public static let capricornio = "capricornio"
    public static let acuario     = "acuario"
    public static let piscis      = "piscis"
    public static let aries       = "aries"
    public static let tauro       = "tauro"
    public static let geminis     = "geminis"
    public static let cancer      = "cancer"
    public static let leo         = "leo"
    public static let virgo       = "virgo"
    public static let libra       = "libra"
    public static let scorpio     = "scorpio"
    public static let sagitario   = "sagitario"
}


enum InstructionsStrings {
    public static let memoriaTitle = "Memoria"
    public static let memoria = NSAttributedString(string: "Toca las galletas para encontrar\n pares, triadas o cuartetos.\nGanarás si encuentras todos." , attributes: TextusAttributes.normell)
    
    public static let aNumeroTitle = "Adivina Número"
    public static let aNumero = NSAttributedString(string: "Adivina que número saldrá cuando\ntires el dado. Presiona y el botón y\n si sale el mismo número, ganarás." , attributes: TextusAttributes.normell)
    
    public static let a8ballTitle = "Donde está"
    public static let a8ball = NSAttributedString(string: "Encuentra la bola mágica alrededor\n de ti, tócala y ganarás." , attributes: TextusAttributes.normell)
    
    public static let colourTitle = "Color distinto"
    public static let colour = NSAttributedString(string: "Toca la barra de color\n distinto todos los rounds\ny ganarás." , attributes: TextusAttributes.normell)
    
    public static let jigSawTitle = "Rompecabezas"
    public static let jigSaw = NSAttributedString(string: "Arma el rompecabezas\ny ganarás." , attributes: TextusAttributes.normell)
}
