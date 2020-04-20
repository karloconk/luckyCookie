//
//  TwinCell.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 16/04/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit
import Foundation
public class TwinCell: UIView {
    
    public var buttonSelected       = 0
    public let frameHeight: CGFloat = DashboardSections.level1height
    private let backgroundColour    = Colors.blanco
    
    public lazy var lButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    public lazy var rButton: UIButton = {
        let button = UIButton()
        return button
    }()

    public init(viewController: UIViewController, left: UIImage, right: UIImage, leftAction: Selector, rightAction: Selector) {
        let theFrame = CGRect(x: viewController.view.frame.minX, y: 0, width: viewController.view.frame.width, height: frameHeight)
        super.init(frame: theFrame)
        backgroundColor = backgroundColour
        
        let lframe = CGRect(x: theFrame.maxX - theFrame.width/2, y: theFrame.minY, width: theFrame.width/2 - 0.5, height: theFrame.height)
        let rframe = CGRect(x: theFrame.width/2, y: theFrame.minY, width: theFrame.width/2  - 0.5, height: theFrame.height)
        
        setupButtons(left: left, right: right)
        setupButtonConstraints(view: self, frame: lframe, left: true,  button: self.lButton)
        setupButtonConstraints(view: self, frame: rframe, left: false, button: self.rButton)
        setupButtonAction(viewController: viewController, action: leftAction, button: self.lButton)
        setupButtonAction(viewController: viewController, action: rightAction, button: self.rButton)
        
    }
    
    func setupButtons(left: UIImage, right: UIImage) {
        DispatchQueue.main.async {
            
            var bgcolorL = Colours.basicBackground
            if left == DashboardImages.dashBoardColores {
                bgcolorL = Colors.blanco
                self.lButton.layer.borderWidth = 1
                self.lButton.layer.borderColor = Colors.neutral.cgColor
            }
            
            if left == DashboardImages.dashBoardBola {
                bgcolorL = Colors.violet
            }
            
            var bgcolorR = Colours.basicBackground
            if right == DashboardImages.dashBoardLuna {
                bgcolorR = Colors.moonshine
            }
            
            if right == DashboardImages.dashBoardNumeros {
                bgcolorR = Colors.moonshine
            }
            
            self.lButton.backgroundColor = bgcolorL
            self.lButton.setImage(left, for: .normal)
            self.lButton.layer.cornerRadius = 5;
            self.lButton.layer.masksToBounds = true;
            
            self.rButton.backgroundColor = bgcolorR
            self.rButton.setImage(right, for: .normal)
            self.rButton.layer.cornerRadius = 5;
            self.rButton.layer.masksToBounds = true;
        }
    }

    func setupButtonConstraints(view: UIView, frame: CGRect, left: Bool, button: UIButton) {
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = left != true ? false : true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = left == true ? false : true
        button.heightAnchor.constraint(equalToConstant: frame.height - 24).isActive  = true
        button.widthAnchor.constraint(equalToConstant:  frame.width  - 36 ).isActive = true
    }
    
    func setupButtonAction(viewController: UIViewController, action: Selector, button: UIButton) {
        button.addTarget(viewController, action: action, for: .touchUpInside)
    }

    override public init(frame: CGRect) { super.init(frame: frame) }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
