//
//  centerCookies.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 13/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit
import Foundation

/**
    View that holds an imageWith a subimage
*/
public class centerCookies: UIView {
    
    public  var widthHeight = CGFloat(0)
    private var smallHeight = CGFloat(48)
    
    public lazy var bigCenter: UIImageView = {
        let imageView = UIImageView(image: nil)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = nil
        return imageView
    }()
    
    public lazy var smallSide: UIImageView = {
        let imageView = UIImageView(image: nil)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = nil
        return imageView
    }()

    public init(width: CGFloat, image: UIImage, imageTapped: UIImage) {
        let theFrame = CGRect(x: CGFloat(0), y: CGFloat(0), width: width, height: width)
        super.init(frame: theFrame)
        widthHeight = width
        backgroundColor = nil
        let theFrame2 = CGRect(x: CGFloat(0), y: CGFloat(0), width: width, height: width-24)
        bigCenter = UIImageView(frame: theFrame2)
        bigCenter.image = image
        smallSide = UIImageView(frame: CGRect(x: bigCenter.frame.maxX/2 - smallHeight/2 ,
                                                 y: bigCenter.frame.minY,
                                                 width: smallHeight,      height: smallHeight))
        smallSide.image = imageTapped
        addComponents()
        layoutComponents()
        smallSide.alpha = 0.0
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addComponents() {
        addSubview(bigCenter)
        addSubview(smallSide)
    }

    private func layoutComponents() {
            NSLayoutConstraint.activate([
                smallSide.heightAnchor.constraint(equalToConstant: smallHeight),
                smallSide.widthAnchor.constraint(equalToConstant:  smallHeight),
                smallSide.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
                smallSide.topAnchor.constraint(equalTo: topAnchor,     constant: 0),
                bigCenter.heightAnchor.constraint(equalToConstant: widthHeight),
                bigCenter.widthAnchor.constraint(equalToConstant:  widthHeight),
                bigCenter.topAnchor.constraint(equalTo: topAnchor,           constant: 0),
                bigCenter.leadingAnchor.constraint(equalTo: leadingAnchor,   constant: 0),
                bigCenter.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
                bigCenter.bottomAnchor.constraint(equalTo: bottomAnchor,     constant: 24),
            ])
    }
    
}
