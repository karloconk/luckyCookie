//
//  FindersGameViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 19/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit
import ARKit
import Each


class FindersGameViewController: UIViewController {
    
    //MARK:- Outlets
    
    @IBOutlet weak var arscene: ARSCNView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    
    //MARK:- Variables
    
    fileprivate var timer     = Each(1).seconds
    public var countdown      = 10
    fileprivate var iswon     = false
    private let configuration = ARWorldTrackingConfiguration()
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timerLabel.text = "\(countdown)"
//        self.arscene.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        self.arscene.session.run(configuration)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(handleTap))
        self.arscene.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK:- Functions
    
    func setTimer() {
        self.timer.perform { () -> NextStep in
            self.countdown -= 1
            self.timerLabel.text = String(self.countdown)
            if self.countdown == 0 {
                DispatchQueue.main.async {
                    self.timerLabel.text = "0"
                    self.winfunc(lose: true)
                }
                return .stop
            }
            if self.iswon {
                return .stop
            }
            return .continue
        }
    }
    
    func stopTimer() {
        self.iswon = true
    }
    
    func addBalls(){
        let eightballScene = SCNScene(named: "models.scnassets/8ball.scn")
        let eightballNode  = eightballScene?.rootNode.childNode(withName: "8ball", recursively: false)
        eightballNode?.position = SCNVector3(randomNumbers(firstNum: -1, secondNum: 1),randomNumbers(firstNum: -0.5, secondNum: 0.5),randomNumbers(firstNum: -1, secondNum: 1))
        self.arscene.scene.rootNode.addChildNode(eightballNode!)
    }
    
    func animateNode(node: SCNNode) {
        let spin = CABasicAnimation(keyPath: "position")
        spin.fromValue = node.presentation.position
        spin.toValue = SCNVector3(node.presentation.position.x - 0.04 ,node.presentation.position.y - 0.0 ,node.presentation.position.z - 0.04)
        spin.duration = 0.06
        spin.autoreverses = true
        spin.repeatCount = 3
        node.addAnimation(spin, forKey: "position")
    }
    
    func winfunc(lose: Bool) {
        self.timerLabel.textColor = !lose ? .green : .systemRed
        
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
    
    
    //MARK:- @objc Functions
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let sceneViewTappedOn = sender.view as! SCNView
        let touchCoordinates  = sender.location(in: sceneViewTappedOn)
        let hitTest = sceneViewTappedOn.hitTest(touchCoordinates)
        if !(hitTest.isEmpty) {
            if countdown > 0 {
                let results = hitTest.first!
                let node = results.node
                if node.animationKeys.isEmpty {
                    SCNTransaction.begin()
                    self.animateNode(node: node)
                    SCNTransaction.completionBlock = {
                        DispatchQueue.main.async {
                            self.stopTimer()
                            self.winfunc(lose: false)
                        }
                    }
                    SCNTransaction.commit()
                }
            }
        }
    }
    
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
    
    
    //MARK:- Actions
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func playGameBtn(_ sender: Any) {
        self.setTimer()
        self.addBalls()
        self.playBtn.isHidden = true
    }
}

func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
    return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
}
