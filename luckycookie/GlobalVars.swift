//
//  GlobalVars.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 17/02/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import Foundation
import UIKit

struct GlobalVars {
    static var currentBolita: Int = 0
    static let colores = ["amarillo","ámbar","añil","azul","azul claro","azul eléctrico","azul marino","beige","bermellón","blanco","blanco marfil","café","caoba","caqui","carmesí","castaño","celeste","cereza","champán","cian","cobre","color terracota","coral","crema","fucsia","granate","gris","hueso","lavanda","lila","magenta","marrón","chocolate","morado","naranja","negro","ocre","dorado","pardo","plata","púrpura","rojo","rojo carmín","rojo óxido","rosa","salmón ","turquesa","verde","verde botella ","verde esmeralda","verde lima","verde manzana","verde musgo","verde oliva","verde pistache","verdeagua","violeta","vino"]
}

public enum Colors {
    public static let charcoal = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
    public static let blanco   = UIColor(red:1.00,  green:1.00,  blue:1.00,  alpha:1.0)
    public static let neutral  = UIColor(red: 0.50, green: 0.50, blue: 0.50, alpha: 1.00)
    public static let manatee  = UIColor(red:0.93,  green:0.94,  blue:0.96,  alpha:1.0)
    public static let violet   = UIColor(red: 0.73, green: 0.58, blue: 0.87, alpha: 1.00)
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
    public static let bigBlack = Font.getAttributes(lineSpacing:        6.0,
                                                    fontColour:         Colors.charcoal,
                                                         typo:          Font.getbigFont(size: 20),
                                                         isUnderlined:  false)
    public static let bigWhite = Font.getAttributes(lineSpacing:        6.0,
                                                    fontColour:         Colors.blanco,
                                                         typo:          Font.getbigFont(size: 20),
                                                         isUnderlined:  false)
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

