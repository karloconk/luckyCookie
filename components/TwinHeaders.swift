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
    
    public let frameHeight: CGFloat = CGFloat(DashboardSections.headerheight)
    public var frameWidth: Double   = 0.0
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
    
    private lazy var leftSideStackView: UIStackView = {
        let stackView          = UIStackView()
        stackView.axis         = .vertical
        stackView.distribution = .fill
        stackView.alignment    = .center
        return stackView
    }()
    
    private lazy var rightSideStackView: UIStackView = {
        let stackView          = UIStackView()
        stackView.axis         = .vertical
        stackView.distribution = .fill
        stackView.alignment    = .center
        return stackView
    }()
    
    public lazy var lLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    public lazy var rLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()

    public init(width: Double, left: String, right: String) {
        frameWidth = width
        let theFrame = CGRect(x: CGFloat(0),              y: CGFloat(0),
                              width: CGFloat(frameWidth), height: frameHeight)
        super.init(frame: theFrame)
        backgroundColor = backgroundColour
        lLabel = initLabel(text: left)
        rLabel = initLabel(text: right)
        addComponents()
        layoutComponents()

    }
    
    private func initLabel(text: String) -> UILabel {
        let alabel = UILabel(frame: CGRect(x: 0.0, y: 0.0,
                                       width: frameWidth, height: Double(frameHeight)))
        alabel.font             = Typo.h3
        alabel.textColor        = Colors.charcoal
        alabel.textAlignment    = .center
        alabel.backgroundColor  = Colors.blanco
        alabel.text             = text
        return alabel
    }

    private func addComponents() {
        leftSideStackView.addArrangedSubview(lLabel)
        rightSideStackView.addArrangedSubview(rLabel)
        rootStackView.addArrangedSubview(leftSideStackView)
        rootStackView.addArrangedSubview(rightSideStackView)
        addSubview(rootStackView)
    }

    private func layoutComponents() {

        NSLayoutConstraint.activate([
            lLabel.widthAnchor.constraint(equalToConstant: CGFloat(frameWidth/2)),
            rLabel.widthAnchor.constraint(equalToConstant: CGFloat(frameWidth/2)),
            rootStackView.leadingAnchor.constraint(equalTo:  leadingAnchor,   constant: 0),
            rootStackView.topAnchor.constraint(equalTo:      topAnchor,       constant: 0),
            rootStackView.trailingAnchor.constraint(equalTo: trailingAnchor,  constant: 0),
            rootStackView.bottomAnchor.constraint(equalTo:   bottomAnchor,    constant: 0),
            ])
    }

    override public init(frame: CGRect) { super.init(frame: frame) }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
