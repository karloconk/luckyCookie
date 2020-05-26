//
//  WinView.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 14/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import Foundation
import UIKit

public class WinView: UIView {
    let ablack:UIColor = Colors.charcoal
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment        = .center
        stackView.axis             = .vertical
        stackView.distribution     = .equalCentering
        stackView.spacing = 16
        stackView.backgroundColor  = nil
        return stackView
    }()
    
    private lazy var bottomStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment        = .center
        stackView.axis             = .horizontal
        stackView.distribution     = .equalCentering
        stackView.backgroundColor  = nil
        stackView.spacing = 32
        return stackView
    }()

    private lazy var bLeftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment        = .center
        stackView.axis             = .vertical
        stackView.distribution     = .equalCentering
        stackView.spacing = 8
        stackView.backgroundColor  = nil
        return stackView
    }()
    
    private lazy var bMidStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment        = .center
        stackView.axis             = .vertical
        stackView.distribution     = .equalCentering
        stackView.spacing = 8
        stackView.backgroundColor  = nil
        return stackView
    }()
    
    private lazy var bRightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment        = .center
        stackView.axis             = .vertical
        stackView.distribution     = .equalCentering
        stackView.spacing = 8
        stackView.backgroundColor  = nil
        return stackView
    }()
    
    public lazy var lButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    public lazy var mButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    public lazy var lLabel: UIButton = {
        let lbl = UIButton()
        return lbl
    }()
    
    public lazy var rButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    public lazy var mLabel: UIButton = {
        let lbl = UIButton()
        return lbl
    }()
    
    public lazy var rLabel: UIButton = {
        let lbl = UIButton()
        return lbl
    }()
    
    public lazy var winimage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = nil
        return imageView
    }()
    
    public lazy var whatToDoLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    public init(frame: CGRect, titler: String,viewController: UIViewController, actionL: Selector, actionM: Selector, actionR: Selector, win: Bool) {
        super.init(frame: frame)
        backgroundColor    = Colors.manatee
        winimage.image     = win ? UIImage(named: "win") : UIImage(named: "lose")
        whatToDoLabel.text = titler
        lLabel.setTitle("Ir a juegos",  for: .normal)
        lLabel.setTitleColor(ablack,    for: .normal)
        mLabel.setTitle("Jugar otra vez",  for: .normal)
        mLabel.setTitleColor(ablack,    for: .normal)
        rLabel.setTitle("Ir a suertes", for: .normal)
        rLabel.setTitleColor(ablack,    for: .normal)

        setupButtons()
         setupButtonAction(viewController: viewController, action: actionL, button: self.lButton)
        setupButtonAction(viewController: viewController, action: actionR, button: self.rButton)
         setupButtonAction(viewController: viewController, action: actionL, button: self.lLabel)
        setupButtonAction(viewController: viewController, action: actionR, button: self.rLabel)
         setupButtonAction(viewController: viewController, action: actionM, button: self.mLabel)
        setupButtonAction(viewController: viewController, action: actionM, button: self.mButton)
        addComponents()
        layoutComponents()
        self.layer.cornerRadius  = 8
        self.layer.masksToBounds = true
        layer.shadowOffset  = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.5
        layer.shadowRadius  = 2
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func setwin(win: Bool) {
        winimage.image     = win ? UIImage(named: "win") : UIImage(named: "lose")
    }
    
    func setupButtons() {
        DispatchQueue.main.async {
            self.lButton.tintColor = self.ablack
            self.lButton.backgroundColor    = nil
            self.lButton.setImage(UIImage(systemName: "gamecontroller.fill"), for: .normal)
            self.mButton.tintColor = self.ablack
            self.mButton.backgroundColor    = nil
            self.mButton.setImage(UIImage(systemName: "gobackward"), for: .normal)
            self.rButton.tintColor = self.ablack
            self.rButton.backgroundColor    = nil
            self.rButton.setImage(UIImage(systemName: "wand.and.stars"), for: .normal)
        }
    }
    
    func setupButtonAction(viewController: UIViewController, action: Selector, button: UIButton) {
        button.addTarget(viewController, action: action, for: .touchUpInside)
    }
    
    private func addComponents() {
        rootStackView.addArrangedSubview(winimage)
        rootStackView.addArrangedSubview(whatToDoLabel)
        bLeftStackView.addArrangedSubview(lLabel)
        bLeftStackView.addArrangedSubview(lButton)
        bRightStackView.addArrangedSubview(rLabel)
        bRightStackView.addArrangedSubview(rButton)
        bMidStackView.addArrangedSubview(mLabel)
        bMidStackView.addArrangedSubview(mButton)
        bottomStackview.addArrangedSubview(bLeftStackView)
        bottomStackview.addArrangedSubview(bMidStackView)
        bottomStackview.addArrangedSubview(bRightStackView)
        rootStackView.addArrangedSubview(bottomStackview)
        addSubview(rootStackView)
    }
    
    private func layoutComponents() {
        NSLayoutConstraint.activate([
            winimage.widthAnchor.constraint(equalToConstant: CGFloat(220)),
            winimage.heightAnchor.constraint(equalToConstant: CGFloat(120)),
            bottomStackview.leadingAnchor.constraint(equalTo:  leadingAnchor,   constant: 16),
            bottomStackview.trailingAnchor.constraint(equalTo: trailingAnchor,  constant: -16),
            bottomStackview.bottomAnchor.constraint(equalTo:   bottomAnchor,    constant: -16),
            rootStackView.leadingAnchor.constraint(equalTo:  leadingAnchor,   constant: 0),
            rootStackView.trailingAnchor.constraint(equalTo: trailingAnchor,  constant: 0),
            rootStackView.topAnchor.constraint(equalTo:      topAnchor,       constant: 24),
            rootStackView.bottomAnchor.constraint(equalTo:   bottomAnchor,    constant: 0),
        ])
    }
    
}
