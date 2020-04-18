//
//  DashboardCompound.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 16/04/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.

import UIKit
import Foundation

public class DashboardCompound: UIView {
        
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment        = .center
        stackView.distribution     = .equalCentering
        stackView.backgroundColor  = Colors.blanco
        return stackView
    }()
    
    private lazy var rootView: UIView = {
        let aView = UIView()
        return aView
    }()

    public init(frame: CGRect, image: UIImage, vc: UIViewController, action: Selector) {
        super.init(frame: frame)
        let moneyInFrame = CGRect(x: 0, y: 0, width: frame.width - 48, height: frame.height - 24)
        rootView         = CenterCell(frame:     moneyInFrame,
                                      image:     image,
                                      imagesize: DashBoardValues.iHCookie,
                                      bg:        DashBoardValues.bGCookie)
        backgroundColor  = Colors.blanco
        addComponents()
        layoutComponents()
        let tapGestureRecognizer = UITapGestureRecognizer(target: vc, action: action)
        rootView.isUserInteractionEnabled = true
        rootView.addGestureRecognizer(tapGestureRecognizer)
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
            rootStackView.leadingAnchor.constraint(equalTo:  leadingAnchor,   constant: 24),
            rootStackView.topAnchor.constraint(equalTo:      topAnchor,       constant: 0),
            rootStackView.trailingAnchor.constraint(equalTo: trailingAnchor,  constant: 24),
            rootStackView.bottomAnchor.constraint(equalTo:   bottomAnchor,    constant: 0),
            ])
    }
    
}
