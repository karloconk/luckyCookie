//
//  TwinCell3.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 15/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit
import Foundation
public class TwinCell3: UIView {
    
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
            
            
            self.rButton.layer.borderWidth = 1
            self.rButton.layer.borderColor = Colors.neutral.cgColor
            self.lButton.layer.borderWidth = 1
            self.lButton.layer.borderColor = Colors.neutral.cgColor
            
            let bgcolorR: UIColor? = nil
            let bgcolorL: UIColor? = nil
            
            self.lButton.backgroundColor = bgcolorL
            self.lButton.setImage(left, for: .normal)
            self.lButton.layer.cornerRadius = 5
            self.lButton.layer.masksToBounds = true
            
            self.rButton.backgroundColor = bgcolorR
            self.rButton.setImage(right, for: .normal)
            self.rButton.layer.cornerRadius = 5
            self.rButton.layer.masksToBounds = true
        }
    }

    func setupButtonConstraints(view: UIView, frame: CGRect, left: Bool, button: UIButton) {
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = left != true ? false : true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -88).isActive = left == true ? false : true
        button.heightAnchor.constraint(equalToConstant: frame.height - 24).isActive  = true
        button.widthAnchor.constraint(equalToConstant:  frame.width  - (88 * 2) ).isActive = true
    }
    
    func setupButtonConstraints(view: UIView, frame: CGRect, button: UIButton) {
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: self.frame.width/2 - ( frame.width  - (88 * 2))/2 ).isActive = true
        button.heightAnchor.constraint(equalToConstant: frame.height - 24).isActive  = true
        button.widthAnchor.constraint(equalToConstant:  frame.width  - (88 * 2) ).isActive = true
    }
    
    func setupButtonAction(viewController: UIViewController, action: Selector, button: UIButton) {
        button.addTarget(viewController, action: action, for: .touchUpInside)
    }

    override public init(frame: CGRect) { super.init(frame: frame) }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
