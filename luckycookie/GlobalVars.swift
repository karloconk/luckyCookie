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
    public static let charcoal = UIColor(red:0.24, green:0.24, blue:0.26, alpha:1.0)
    public static let blanco   = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
    public static let neutral  = UIColor(red:0.59, green:0.61, blue:0.63, alpha:1.0)
    public static let manatee  = UIColor(red:0.93, green:0.94, blue:0.96, alpha:1.0)
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

