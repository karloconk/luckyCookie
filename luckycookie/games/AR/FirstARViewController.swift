//
//  FirstARViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 16/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit
import ARKit

class FirstARViewController: UIViewController, ARSCNViewDelegate {

    // MARK:- Outlets

    @IBOutlet weak var arsceneview:       ARSCNView!
    @IBOutlet weak var instructionsView:  UIView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var onebutton:   UIButton!
    @IBOutlet weak var twobutton:   UIButton!
    @IBOutlet weak var threebutton: UIButton!
    @IBOutlet weak var fourbutton:  UIButton!
    @IBOutlet weak var fivebutton:  UIButton!
    @IBOutlet weak var sixbutton:   UIButton!
    @IBOutlet weak var backtop:     UIButton!
    @IBOutlet weak var rollDiceButtonbottom: UIButton!
    
    // MARK:- Variables

    let configuration = ARWorldTrackingConfiguration()
    let panelsWH      = 3
    let yOff          = 0.5
    var predictednum  = 0
    
    // MARK:- Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.arsceneview.debugOptions = [.showFeaturePoints, .showWorldOrigin]
        self.configuration.planeDetection = .horizontal
        self.arsceneview.session.run(configuration)
        self.arsceneview.delegate = self
        self.arsceneview.autoenablesDefaultLighting = true
        self.createPlaneBottomBack(bottom: true)
        self.createPlaneBottomBack(bottom: false)
        self.createPlanesSides(right: false)
        self.createPlanesSides(right: true)
        self.startup()
        self.instructionsView.layer.cornerRadius = 5;
        self.instructionsView.layer.masksToBounds = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK:- Functions

    
    func rollTheDice() {
        let diceScene = SCNScene(named: "models.scnassets/dice.scn")
        let dicenode = diceScene?.rootNode.childNode(withName: "Dice", recursively: false)
        dicenode?.position = SCNVector3(0.0, 0.6, -0.8)
        let body = SCNPhysicsBody(type: .dynamic, shape: SCNPhysicsShape(node: dicenode!, options: [SCNPhysicsShape.Option.keepAsCompound: true]))
        dicenode?.physicsBody = body
        self.arsceneview.scene.rootNode.addChildNode(dicenode!)
        let rotationAction = Rotation(time: 0.2)
        dicenode!.runAction(rotationAction)
    }

    func createPlaneBottomBack(bottom: Bool){
        let vall = 1.0
        let pos   = bottom ? SCNVector3(0.0, -(vall) + yOff, 0.0) : SCNVector3(0.0, 0.0 + yOff, -(vall))
        let engel = bottom ? SCNVector3(90.degreesToRadians, 0, 0) : SCNVector3(0, 0, 0)
        let color = bottom ? Colors.lightblue : Colors.manatee

        let bottomPlane = SCNNode(geometry: SCNPlane(width: CGFloat(panelsWH), height: CGFloat(panelsWH)))
        bottomPlane.geometry?.firstMaterial?.transparency = 0.0
        bottomPlane.geometry?.firstMaterial?.diffuse.contents = color
        bottomPlane.geometry?.firstMaterial?.isDoubleSided = true
        bottomPlane.position    = pos
        bottomPlane.eulerAngles = engel
        let staticBody          = SCNPhysicsBody.static()
        bottomPlane.physicsBody = staticBody
        self.arsceneview.scene.rootNode.addChildNode(bottomPlane)
    }
    
    func createPlanesSides(right: Bool){
        let vall = 0.5
        let pos = right ? vall : -(vall)
        let color = right ? Colors.moonshine : Colors.charcoal
        let sidepanel = SCNNode(geometry: SCNPlane(width: CGFloat(panelsWH), height: CGFloat(panelsWH)))
        sidepanel.geometry?.firstMaterial?.transparency = 0.0
        sidepanel.geometry?.firstMaterial?.diffuse.contents = color
        sidepanel.geometry?.firstMaterial?.isDoubleSided = true
        sidepanel.position = SCNVector3(pos, 0.0 + yOff, 0.0)
        sidepanel.eulerAngles = SCNVector3(0, 90.degreesToRadians, 0)
        let staticBody = SCNPhysicsBody.static()
        sidepanel.physicsBody = staticBody
        self.arsceneview.scene.rootNode.addChildNode(sidepanel)
    }
    
    func Rotation(time: TimeInterval) -> SCNAction {
        let degrees = Int.random(in: 0 ..< 360)
        let Rotation = SCNAction.rotateBy(x: CGFloat(degrees.degreesToRadians),
                                          y: CGFloat(degrees.degreesToRadians),
                                          z: CGFloat(degrees.degreesToRadians),
                                          duration: time)
        return Rotation
    }
    
    func startup() {
        self.backtop.isHidden = true
        self.rollDiceButtonbottom.isHidden = true
        self.backtop.isUserInteractionEnabled = false
        self.rollDiceButtonbottom.isUserInteractionEnabled = false
    }
    
    func endup() {
        self.instructionsView.isUserInteractionEnabled = false
        self.instructionsView.isHidden = true
        self.backtop.isHidden = false
        self.rollDiceButtonbottom.isHidden = false
        self.backtop.isUserInteractionEnabled = true
        self.rollDiceButtonbottom.isUserInteractionEnabled = true
    }
    
    // MARK:- Actions

    @IBAction func rollDice(_ sender: Any) {
        self.rollTheDice()
    }
    
    @IBAction func goback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func noquiero(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func unou(_ sender: Any) {
        self.predictednum = 1
        self.endup()
    }
    
    @IBAction func dous(_ sender: Any) {
        self.predictednum = 2
        self.endup()
    }
    
    @IBAction func threeu(_ sender: Any) {
        self.predictednum = 3
        self.endup()
    }
    
    @IBAction func fouru(_ sender: Any) {
        self.predictednum = 4
        self.endup()
    }
    
    @IBAction func fivu(_ sender: Any) {
        self.predictednum = 5
        self.endup()
    }
    
    @IBAction func sixu(_ sender: Any) {
        self.predictednum = 6
        self.endup()
    }
}

func +(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180}
}
