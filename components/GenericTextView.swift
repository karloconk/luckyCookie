//
//  GenericTextView.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 18/04/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit
import Foundation

public class GenericTextView: UIView {
    
    public  var frameHeight: CGFloat = 0.0
    public  var frameWidth:  CGFloat = 0.0
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment    = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var theTextView: UITextView = {
        let tView                = UITextView()
        tView.backgroundColor    = nil
        tView.isEditable         = false
        tView.textContainerInset = UIEdgeInsets.zero
        tView.isScrollEnabled    = false
        tView.textContainer.lineFragmentPadding = 0
        tView.textAlignment = .center
        return tView
    }()

    public init(view: UIView, text: NSAttributedString, height: Double) {
        self.frameHeight = CGFloat(height)
        self.frameWidth  = view.frame.width

        let theFrame = CGRect(x:     view.frame.minX,  y: CGFloat(0),
                              width: view.frame.width, height: frameHeight)
        super.init(frame: theFrame)
        backgroundColor = nil
        theTextView.attributedText  = text
        theTextView.textAlignment   = .center
        addComponents()
        layoutComponents()
    }
    
    override public init(frame: CGRect) { super.init(frame: frame) }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func addComponents() {
        rootStackView.addArrangedSubview(theTextView)
        addSubview(rootStackView)
    }

    private func layoutComponents() {
        NSLayoutConstraint.activate([
            theTextView.widthAnchor.constraint(equalToConstant:  frameWidth  - 16),
            theTextView.heightAnchor.constraint(equalToConstant: frameHeight - 32),
            rootStackView.leadingAnchor.constraint(equalTo:  leadingAnchor,  constant:  16),
            rootStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            rootStackView.topAnchor.constraint(equalTo:      topAnchor,      constant:  0),
            rootStackView.bottomAnchor.constraint(equalTo:   bottomAnchor,   constant:  0),
        ])
    }
}
