//
//  TwinCell2.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 14/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit
import Foundation
public class TwinCell2: UIView {
    
    public var buttonSelected       = 0
    public let frameHeight: CGFloat = GameDashboardSections.level1height
    private let backgroundColour    = Colors.blanco
    
    public lazy var lButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    public lazy var rButton: UIButton = {
        let button = UIButton()
        return button
    }()

    public init(viewController: UIViewController, left: UIImage, right: UIImage?, leftAction: Selector, rightAction: Selector?) {
        let theFrame = CGRect(x: viewController.view.frame.minX, y: 0, width: viewController.view.frame.width, height: frameHeight)
        super.init(frame: theFrame)
        backgroundColor = backgroundColour
        
        let lframe = CGRect(x: theFrame.maxX - theFrame.width/2, y: theFrame.minY, width: theFrame.width/2 - 0.5, height: theFrame.height)
        let rframe = CGRect(x: theFrame.width/2, y: theFrame.minY, width: theFrame.width/2  - 0.5, height: theFrame.height)
        setupButtons(left: left, right: right ?? UIImage())
        if let _ = right {
            setupButtonConstraints(view: self, frame: lframe, left: true,  button: self.lButton)
            setupButtonConstraints(view: self, frame: rframe, left: false, button: self.rButton)
        } else {
            setupButtonConstraints(view: self, frame: lframe,button: self.lButton)
        }
        setupButtonAction(viewController: viewController, action: leftAction, button: self.lButton)
        if let maaction = rightAction {
            setupButtonAction(viewController: viewController, action: maaction, button: self.rButton)
        }
    }
    
    func setupButtons(left: UIImage, right: UIImage) {
        DispatchQueue.main.async {
            let bgcolorL = Colors.blanco
            let bgcolorR = Colors.blanco
            self.rButton.layer.borderWidth = 2
            self.lButton.layer.borderWidth = 2
                        
            if left == DashboardImages.GdashBoardCookie {
                self.lButton.layer.borderColor = Colours.basicBackground.cgColor
            }
            if right == DashboardImages.GdashBoardColores {
                self.rButton.layer.borderColor = Colors.tweety.cgColor
            }
            if left == DashboardImages.GdashBoardBola {
                self.lButton.layer.borderColor = Colors.upperNum.cgColor
            }
            if left == DashboardImages.GdashBoardLuna {
                self.lButton.layer.borderColor = Colors.upperNum.cgColor
            }
            if right == DashboardImages.GdashBoardNumeros {
                self.rButton.layer.borderColor = Colors.upperNum.cgColor
            }
            
            let insets = UIEdgeInsets(top: 10, left: 110, bottom: 10, right: 110)
            
            self.lButton.backgroundColor = bgcolorL
            self.lButton.setImage(left, for: .normal)
            self.lButton.layer.cornerRadius  = 5
            self.lButton.layer.masksToBounds = true
            self.lButton.imageEdgeInsets     = insets
            
            self.rButton.backgroundColor = bgcolorR
            self.rButton.setImage(right, for: .normal)
            self.rButton.layer.cornerRadius  = 5
            self.rButton.layer.masksToBounds = true
            self.rButton.imageEdgeInsets     = insets
        }
    }

    func setupButtonConstraints(view: UIView, frame: CGRect, left: Bool, button: UIButton) {
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 56).isActive = left != true ? false : true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -56).isActive = left == true ? false : true
        button.heightAnchor.constraint(equalToConstant: frame.height - 24).isActive  = true
        button.widthAnchor.constraint(equalToConstant:  frame.width  - 112 ).isActive = true
    }
    
    func setupButtonConstraints(view: UIView, frame: CGRect, button: UIButton) {
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: self.frame.width/2 - (frame.width  - 112)/2 ).isActive = true
        button.heightAnchor.constraint(equalToConstant: frame.height - 24).isActive  = true
        button.widthAnchor.constraint(equalToConstant:  frame.width  - 112 ).isActive = true
    }
    
    func setupButtonAction(viewController: UIViewController, action: Selector, button: UIButton) {
        button.addTarget(viewController, action: action, for: .touchUpInside)
    }

    override public init(frame: CGRect) { super.init(frame: frame) }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
