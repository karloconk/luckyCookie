//
//  TwinHeaders.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 17/04/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit
import Foundation

public class TwinHeaders: UIView {
    
    public let frameHeight: CGFloat = 24
    private let backgroundColour    = Colors.blanco
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment        = .center
        stackView.distribution     = .equalCentering
        stackView.axis             = .horizontal
        stackView.backgroundColor  = Colors.blanco
        return stackView
    }()
    
    public lazy var lLabel: UILabel = {
        let button = UILabel()
        button.font             = Typo.h3
        button.textColor        = Colors.charcoal
        button.textAlignment    = .center
        return button
    }()
    
    public lazy var rLabel: UILabel = {
        let button = UILabel()
        button.font             = Typo.h3
        button.textColor        = Colors.charcoal
        button.textAlignment    = .center
        return button
    }()

    public init(view: UIView, left: String, right: String) {
        let theFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: frameHeight)
        super.init(frame: theFrame)
        backgroundColor = backgroundColour
        addComponents()
        layoutComponents()
    }

    private func addComponents() {
        rootStackView.addSubview(lLabel)
        rootStackView.addSubview(rLabel)
        addSubview(rootStackView)
    }

    private func layoutComponents() {

        NSLayoutConstraint.activate([
            rootStackView.leadingAnchor.constraint(equalTo:  leadingAnchor,   constant: 0),
            rootStackView.topAnchor.constraint(equalTo:      topAnchor,       constant: 0),
            rootStackView.trailingAnchor.constraint(equalTo: trailingAnchor,  constant: 0),
            rootStackView.bottomAnchor.constraint(equalTo:   bottomAnchor,    constant: 0),
            ])
    }

    override public init(frame: CGRect) { super.init(frame: frame) }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
