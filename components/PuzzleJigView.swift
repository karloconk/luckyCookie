//
//  PuzzleJigView.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 26/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import Foundation
import UIKit


public protocol JigPieceDelegate {
    func valueChanged(x: CGFloat, y: CGFloat, index: (Int, Int))
}

class PuzzleJigView: UIImageView {
    
    var dragStartPositionRelativeToCenter : CGPoint?
    public var delegate: JigPieceDelegate?
    public var index = (0,0)

    init(frame: CGRect, image: UIImage!, index: (Int, Int)) {
        super.init(image: image)
        
        self.isUserInteractionEnabled = true
        self.index = index
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan(nizer:))))
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handlePan(nizer: UIPanGestureRecognizer!) {
        if nizer.state == UIGestureRecognizer.State.began {
            let locationInView = nizer.location(in: superview)
            dragStartPositionRelativeToCenter = CGPoint(x: locationInView.x - center.x, y: locationInView.y - center.y)
            
            layer.shadowOffset = CGSize(width: 0, height: 20)
            layer.shadowOpacity = 0.3
            layer.shadowRadius = 6
            
            return
        }
        
        if nizer.state == UIGestureRecognizer.State.ended {
            dragStartPositionRelativeToCenter = nil
            
            layer.shadowOffset = CGSize(width: 0, height: 3)
            layer.shadowOpacity = 0.5
            layer.shadowRadius = 2
            
            self.delegate?.valueChanged(x: self.frame.minX, y: self.frame.minY,index: self.index)
            return
        }
        
        let locationInView = nizer.location(in: superview)
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseInOut, animations: {
            self.center = CGPoint(x: locationInView.x - self.dragStartPositionRelativeToCenter!.x,
                                  y: locationInView.y - self.dragStartPositionRelativeToCenter!.y)
        }, completion: {(Bool) in return })
    }
}
