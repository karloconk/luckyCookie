//
//  StoryBoardsBasics.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 18/04/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import Foundation
import UIKit

fileprivate enum Storyboards{
    public static let main  = "Main"
    public static let games = "Games"
}

fileprivate extension UIStoryboard {
    
    static func load(from storyboard: String, identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
    
    static func load(identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
}

extension UIStoryboard {

    class func goToGalleta() -> FirstViewController {
        return load(identifier: "GalletaDeLaFortuna") as! FirstViewController
    }
    
    class func goToHoroscopes() -> HoroscopesViewController {
        return load(identifier: "horoscopos") as! HoroscopesViewController
    }
    
    class func goToColours() -> ColoursViewController {
        return load(identifier: "coloresmn") as! ColoursViewController
    }
    
    class func goToBolaocho() -> bolaOchoViewController {
        return load(identifier: "bolaocho") as! bolaOchoViewController
    }
    
    class func goToNumbers() -> NumbersViewController {
        return load(identifier: "numeros") as! NumbersViewController
    }
    
    class func goToMoons() -> MoonsViewController {
        return load(identifier: "lunas") as! MoonsViewController
    }
    
    class func gotoGames() -> GamesViewController {
        return load(from: Storyboards.games, identifier: "gamesnavcontroller") as! GamesViewController
    }
    
    class func gotoLucks() -> LucksNavsViewController {
        return load(from: Storyboards.main, identifier: "luckDashboard") as! LucksNavsViewController
    }
    
    class func gotomainhub() -> MainHubViewController {
        return load(from: Storyboards.main, identifier: "mainhub") as! MainHubViewController
    }
    
    class func goToGameSettings() -> GameSettingsTableViewController {
        return load(from: Storyboards.games, identifier: "horacio") as! GameSettingsTableViewController
    }
    
    class func gotoMemoria() -> CookieCollectionViewController {
        return load(from: Storyboards.games, identifier: "cookiesGame") as! CookieCollectionViewController
    }
    
    class func gotofirstARscene() -> FirstARViewController {
        return load(from: Storyboards.games, identifier: "firstARscene") as! FirstARViewController
    }
    
    class func gotoFindersScene() -> FindersGameViewController {
        return load(from: Storyboards.games, identifier: "finders") as! FindersGameViewController
    }
    
}

struct MyGVariables {
    static var istoGames = false
    static var istoLucks = false
}
