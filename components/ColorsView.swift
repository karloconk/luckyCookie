//
//  ColorsView.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 22/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import Foundation
import UIKit

public protocol ColorsViewDelegate {
    func valueChanged(win: Bool)
}

public class ColorsView: UIView {
    
    var rou = 0
    public var cStep: CGFloat   = 0.2
    var viewsC: [UIView] = []
    var taps: [UIGestureRecognizer] = []
    var okView = UIView()
    var selected = false
    public var delegate: ColorsViewDelegate?
    
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment        = .center
        stackView.axis             = .horizontal
        stackView.distribution     = .fillEqually
        stackView.spacing          = 0
        stackView.backgroundColor  = nil
        return stackView
    }()
    
    public lazy var v1: UIView = {
        let imageView = UIView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = nil
        return imageView
    }()
    
    public lazy var v2: UIView = {
        let imageView = UIView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = nil
        return imageView
    }()
    
    public lazy var v3: UIView = {
        let imageView = UIView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = nil
        return imageView
    }()
    
    public lazy var v4: UIView = {
        let imageView = UIView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = nil
        return imageView
    }()
    
    public lazy var v5: UIView = {
        let imageView = UIView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = nil
        return imageView
    }()
    
    public lazy var v6: UIView = {
        let imageView = UIView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = nil
        return imageView
    }()
    
    public lazy var v7: UIView = {
        let imageView = UIView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = nil
        return imageView
    }()
    
    public lazy var v8: UIView = {
        let imageView = UIView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = nil
        return imageView
    }()
    
    public init(frame: CGRect, atY: CGFloat) {
        let theframe = CGRect(x: frame.minX, y: atY, width: frame.width, height: frame.height + 50)
        super.init(frame: theframe)
        backgroundColor    = nil
        self.generateTaps()
        self.addtoarr()
        self.configComponents()
        self.addComponents()
        self.layoutComponents()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func addtoarr() {
        viewsC.append(v1)
        viewsC.append(v2)
        viewsC.append(v3)
        viewsC.append(v4)
        viewsC.append(v5)
        viewsC.append(v6)
        viewsC.append(v7)
        viewsC.append(v8)
    }
    
    func configComponents() {
        let goodTap = UITapGestureRecognizer(target: self, action: #selector(handleTapOK))
        
        let ere = CGFloat.randomF()
        let ge  = CGFloat.randomF()
        let be  = CGFloat.randomF()
        let colorRan = UIColor(red: ere, green: ge, blue: be, alpha: 1.0)
        
        let modere   = ere + cStep <= 1 ? ere + cStep : ere - cStep
        let modge    = ge  + cStep <= 1 ? ge  + cStep : ge  - cStep
        let modbe    = be  + cStep <= 1 ? be  + cStep : be  - cStep
        let difcolor = UIColor(red: modere, green: modge, blue: modbe, alpha: 1.0)
        var randomcolours = Array(repeating: false, count: 8)
        randomcolours[Int.random(in: 0...7)] = true
        
        for i in 0...7 {
            let acolour  = randomcolours[i] ? difcolor : colorRan
            viewsC[i].backgroundColor = acolour
            let agesture = randomcolours[i] ? goodTap : taps[i]
            
            viewsC[i].gestureRecognizers?.forEach(viewsC[i].removeGestureRecognizer)
            
            viewsC[i].addGestureRecognizer(agesture)
            viewsC[i].layer.borderWidth = 0.25
            if viewsC[i].backgroundColor ==  Colors.manatee {
                viewsC[i].layer.borderColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
            } else {
                viewsC[i].layer.borderColor = Colors.manatee.cgColor
            }
            
            if randomcolours[i] {
                okView = viewsC[i]
            }
        }
    }
    
    public func resete() {
        if rou < 7 {
            self.cStep  = cStep / 2
            rou += 1
        }
        self.okView = UIView()
        self.selected = false
        self.configComponents()
        for view in viewsC {
            view.transform = CGAffineTransform(translationX: 0, y: 0)
        }
    }
    
    private func generateTaps() {
        var selec: Selector = #selector(handleTap1)
        for i in 0...7 {
            switch i {
            case 0:
                selec = #selector(handleTap1)
            case 1:
                selec = #selector(handleTap2)
            case 2:
                selec = #selector(handleTap3)
            case 3:
                selec = #selector(handleTap4)
            case 4:
                selec = #selector(handleTap5)
            case 5:
                selec = #selector(handleTap6)
            case 6:
                selec = #selector(handleTap7)
            case 7:
                selec = #selector(handleTap8)
            default:
                selec = #selector(handleTap1)
            }
            let tap = UITapGestureRecognizer(target: self,
                                             action: selec)
            taps.append(tap)
        }
    }
    
    private func addComponents() {
        for i in 0...7 {
            rootStackView.addArrangedSubview(viewsC[i])
        }
        addSubview(rootStackView)
    }
    
    func animateViewLose(view: UIView) {
        if !selected {
            UIView.animate(withDuration: 0.25, delay: 0.0, options: .autoreverse, animations: {
                view.transform = CGAffineTransform(translationX: 0, y: 8)
            }, completion: {(Bool) in
                UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseOut, animations: {
                    view.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: {(Bool) in
                    self.delegate?.valueChanged(win: false)
                })
            })
            selected = true
        }
    }
    
    func animateViewWin() {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut, animations: {
            self.okView.transform = CGAffineTransform(translationX: 0, y: 8)
        }, completion: {(Bool) in
            UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseOut, animations: {
                self.okView.transform = CGAffineTransform(translationX: 0, y: -24)
            }, completion: {(Bool) in                     self.delegate?.valueChanged(win: true)
            })
        })
    }
    
    @objc func handleTap1() {
        animateViewLose(view: v1)
    }
    
    @objc func handleTap2() {
        animateViewLose(view: v2)
    }
    
    @objc func handleTap3() {
        animateViewLose(view: v3)
    }
    
    @objc func handleTap4() {
        animateViewLose(view: v4)
    }
    
    @objc func handleTap5() {
        animateViewLose(view: v5)
    }
    
    @objc func handleTap6() {
        animateViewLose(view: v6)
    }
    
    @objc func handleTap7() {
        animateViewLose(view: v7)
    }
    
    @objc func handleTap8() {
        animateViewLose(view: v8)
    }
    
    @objc func handleTapOK() {
        if !selected {
            animateViewWin()
            selected = true
        }
    }
    
    private func layoutComponents() {
        let frameocho = frame.width/8
        
        NSLayoutConstraint.activate([
            v1.widthAnchor.constraint(equalToConstant: frameocho),
            v1.heightAnchor.constraint(equalToConstant: frame.height),
            v2.widthAnchor.constraint(equalToConstant: frameocho),
            v2.heightAnchor.constraint(equalToConstant: frame.height),
            v3.widthAnchor.constraint(equalToConstant: frameocho),
            v3.heightAnchor.constraint(equalToConstant: frame.height),
            v4.widthAnchor.constraint(equalToConstant: frameocho),
            v4.heightAnchor.constraint(equalToConstant: frame.height),
            v5.widthAnchor.constraint(equalToConstant: frameocho),
            v5.heightAnchor.constraint(equalToConstant: frame.height),
            v6.widthAnchor.constraint(equalToConstant: frameocho),
            v6.heightAnchor.constraint(equalToConstant: frame.height),
            v7.widthAnchor.constraint(equalToConstant: frameocho),
            v7.heightAnchor.constraint(equalToConstant: frame.height),
            v8.widthAnchor.constraint(equalToConstant: frameocho),
            v8.heightAnchor.constraint(equalToConstant: frame.height),
            rootStackView.leadingAnchor.constraint(equalTo:  leadingAnchor,   constant: 0),
            rootStackView.trailingAnchor.constraint(equalTo: trailingAnchor,  constant: 0),
            rootStackView.topAnchor.constraint(equalTo:      topAnchor,       constant: 0),
            rootStackView.bottomAnchor.constraint(equalTo:   bottomAnchor,    constant: 0),
        ])
    }
    
}

extension CGFloat {
    static func randomF() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
