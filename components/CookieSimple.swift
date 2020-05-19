//
//  CookieSimple.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 12/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit
import Foundation

public protocol CookieSimpleDelegate {
    func valueChanged(row: Int, column: Int)
}

public class CookieSimple: UIView {
    
    public var isSelected = false
    private var row    = 0
    private var column = 0
    public var delegate: CookieSimpleDelegate?

    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment        = .center
        stackView.distribution     = .equalCentering
        stackView.backgroundColor  = nil
        return stackView
    }()
    
    private lazy var rootView: centerCookies = {
        let aView = centerCookies()
        return aView
    }()
    
    public init(frame: CGRect, image: UIImage, imageTapped: UIImage, vc: UIViewController, row: Int, column: Int, selected: Bool) {
        super.init(frame: frame)
        rootView         = centerCookies(width: frame.width, image: image, imageTapped: imageTapped)
        backgroundColor  = nil
        addComponents()
        layoutComponents()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        rootView.isUserInteractionEnabled = true
        rootView.addGestureRecognizer(tapGestureRecognizer)
        if selected {
            selectedImage()
        }
        self.row    = row
        self.column = column
    }
    
    @objc func tapped() {
        changeImage(image: UIImage(named: "basic_open")!)
    }
    
    func selectedImage() {
        self.rootView.bigCenter.image = UIImage(named: "basic_open")
        self.rootView.smallSide.alpha = 1.0
        self.rootView.bigCenter.alpha = 0.0
        isSelected = true
    }
    
    func changeImage(image: UIImage) {
        if !isSelected {
                self.rootView.bigCenter.image = image
            UIView.animate(withDuration: 0.5, delay: 0.25, options: .curveLinear, animations: {
                self.rootView.smallSide.alpha = 1.0
                self.rootView.bigCenter.alpha = 0.0
                self.rootView.bigCenter.transform = CGAffineTransform(translationX: 0, y: 30)
            }, completion: {(Bool) in
                self.isSelected = true
                self.delegate?.valueChanged(row: self.row, column: self.column)
            })
        }
    }
    
     public func reverseImage() {
        self.rootView.bigCenter.image = UIImage(named: "basic_closed")!
        UIView.animate(withDuration: 0.25, delay: 0.2, options: .curveLinear, animations: {
            self.rootView.smallSide.alpha = 0.0
            self.rootView.bigCenter.alpha = 1.0
            self.rootView.bigCenter.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: {(Bool) in
            self.isSelected = false
        })
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func addComponents() {
        rootStackView.addSubview(rootView)
        addSubview(rootStackView)
    }
    
    private func layoutComponents() {
        
        NSLayoutConstraint.activate([
            rootStackView.leadingAnchor.constraint(equalTo:  leadingAnchor,   constant: 0),
            rootStackView.topAnchor.constraint(equalTo:      topAnchor,       constant: 24),
            rootStackView.trailingAnchor.constraint(equalTo: trailingAnchor,  constant: 0),
            rootStackView.bottomAnchor.constraint(equalTo:   bottomAnchor,    constant: 0),
        ])
    }
    
}

