//
//  JigSawsViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 26/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit
import Foundation
import PuzzleMaker

class JigSawsViewController: UIViewController, JigPieceDelegate {
    
    // MARK:- Variables

    public var numrows = 3
    var dragStartPositionRelativeToCenter : CGPoint?
    var originalPos: [[CGPoint]] = []
    var modifiedPos: [[CGPoint]] = []
    var originalViews: [[UIImageView]]   = []
    var modifiedViews: [[PuzzleJigView]] = []
    var theimage = UIImage(named: "image")!
    
    // MARK:- LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let maimage = self.theimage.resize(targetSize: CGSize(width: 650, height: 320))
        self.setupPuzzle(imagen: maimage )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK:- Functions

    
    func setupPuzzle(imagen: UIImage) {
        let theWidth  = imagen.size.width
        let theHeight = imagen.size.height

        let containingView = UIView(frame: CGRect(x: CGFloat(self.view.center.x - CGFloat(theWidth/2)), y: 56, width: theWidth, height: theHeight))
        containingView.layer.borderWidth = 1
        containingView.layer.borderColor = UIColor.gray.cgColor
        containingView.layer.cornerRadius = 5

        let puzzleMaker = PuzzleMaker(image: imagen, numRows: self.numrows, numColumns: self.numrows)
        puzzleMaker.generatePuzzles { throwableClosure in
            do {
                let puzzleElements = try throwableClosure()
                for row in 0 ..< self.numrows {
                    var modifiedint: [CGPoint] = []
                    var originalint: [CGPoint] = []
                    var modi : [PuzzleJigView] = []
                    var orig : [UIImageView] = []
                    for column in 0 ..< self.numrows{
                        guard let puzzleElement = puzzleElements[row][column] else { continue }
                        let position = puzzleElement.position
                        let image = puzzleElement.image
                        let imgView = PuzzleJigView(frame: CGRect(x: position.x, y: position.y, width: image.size.width, height: image.size.height), image:  image, index: (row, column))
                        imgView.delegate = self
                        
                        let imim = UIImageView(frame: CGRect(x: position.x, y: position.y, width: image.size.width, height: image.size.height))
                        imim.image = image
                        imim.alpha = 0.1
                        
                        containingView.addSubview(imim)
                        containingView.addSubview(imgView)
                        imgView.transform = CGAffineTransform(translationX: CGFloat.random(in: -image.size.width/2...(image.size.width/2 + 50)), y: CGFloat.random(in: -image.size.height/2...(theHeight - image.size.height/2)))
                        
                        modifiedint.append(CGPoint(x: imgView.frame.minX, y: imgView.frame.minY))
                        originalint.append(CGPoint(x: (imim).frame.minX, y: (imim).frame.minY))
                        modi.append(imgView)
                        orig.append(imim)
                    }
                    self.originalPos.append(originalint)
                    self.modifiedPos.append(modifiedint)
                    self.originalViews.append(orig)
                    self.modifiedViews.append(modi)
                }
                self.view.addSubview(containingView)
            } catch {
                print("kacham")
            }
        }
    }
    
    func winfunc(lose: Bool) {
        let maWidth    = 400
        let maHeight   = 270
        let longWidth  = self.view.frame.width/2
        let longHeight = self.view.frame.height/2
        let winview = WinView(frame: CGRect(x: Int(longWidth) - maWidth/2,
                                            y: Int(longHeight) - maHeight/2 + 30,
                                            width: maWidth, height: maHeight),
                              titler: "¿Qué quieres hacer ahora?", viewController: self,
                              actionL:  #selector(ledft),
                              actionM:  #selector(redo),
                              actionR:  #selector(rigtht),
                              win: !lose)
        winview.alpha = 0.0
        view.addSubview(winview)
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveLinear, animations: {
            winview.alpha = 1.0
            winview.transform = CGAffineTransform(translationX: 0, y: -30)
        }, completion: {(Bool) in print("")})
    }
    
    func valueChanged(x: CGFloat, y: CGFloat, index: (Int, Int)) {
        modifiedPos[index.0][index.1] = CGPoint(x: x, y: y)
        for row in 0...(originalPos.count - 1) {
            for column in 0...(originalPos[row].count - 1) {
                if !originalPos[row][column].isSimilar(otherPoint: modifiedPos[row][column]) {
                    return
                }
            }
        }
        
        for row in modifiedViews {
            for view in row {
                view.isHidden = true
            }
        }
        UIView.animate(withDuration: 1.0, delay: 0.3, options: .curveEaseInOut, animations: {
            for row in self.originalViews {
                for view in row {
                    view.alpha = 1.0
                }
            }
        }, completion: {(Bool) in  self.winfunc(lose: false)})
    }
    
    // MARK:- @objc Functions

    
    @objc func ledft() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func redo() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rigtht() {
        MyGVariables.istoLucks = true
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK:- Actions
    
    @IBAction func tapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension CGPoint {
    
    func isSimilar(otherPoint: CGPoint) -> Bool {
        var similar = false
        if abs(self.x - otherPoint.x) < 15 && abs(self.y - otherPoint.y) < 15 {
            similar = true
        }
        return similar
    }
}

extension UIImage {
  func resizeImage(targetSize: CGSize) -> UIImage {
    let size = self.size
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    self.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage!
  }
}
