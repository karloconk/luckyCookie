//
//  CenterCell.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 16/04/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit
import Foundation

public class CenterCell: UIView {
    
    var selfbackground = Colours.basicBackground
    var imgwidthHeight = 180.0
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment    = .center
        stackView.distribution = .fill
        stackView.axis         = .horizontal
        stackView.spacing      = SpaceUnits.two
        return stackView
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView             = UIImageView()
        imageView.contentMode     = .scaleAspectFit
        return imageView
    }()

    public init(frame: CGRect, image: UIImage, imagesize: Double, bg backgroundColor: UIColor) {
        super.init(frame: frame)
        selfbackground       = backgroundColor
        self.backgroundColor = selfbackground
        self.imgwidthHeight  = imagesize
        addComponents()
        layoutComponents()
        avatarImageView.image = image.resize(targetSize: CGSize(width:  imgwidthHeight + 45,
                                                                height: imgwidthHeight))
        avatarImageView.backgroundColor = selfbackground

        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = true;
    }
    
    override public init(frame: CGRect) {super.init(frame: frame)}
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func addComponents() {
        rootStackView.addArrangedSubview(avatarImageView)
        addSubview(rootStackView)
    }

    private func layoutComponents() {
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant:  CGFloat(imgwidthHeight)),
            avatarImageView.heightAnchor.constraint(equalToConstant: CGFloat(imgwidthHeight)),
            rootStackView.leadingAnchor.constraint(equalTo:  leadingAnchor,  constant: 0),
            rootStackView.topAnchor.constraint(equalTo:      topAnchor,      constant: 0),
            rootStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            rootStackView.bottomAnchor.constraint(equalTo:   bottomAnchor,   constant: 0),
        ])
    }
    
}
