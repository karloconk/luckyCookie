//
//  HoroscopesModels.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 01/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import Foundation

struct Datum: Codable {
    let titulo: String
    let horoscopo: [String: Horoscopo]
    let fuente: String
    let autor: String
}

struct Horoscopo: Codable {
    let nombre, fechaSigno, amor, salud: String
    let dinero, color, numero: String
}
