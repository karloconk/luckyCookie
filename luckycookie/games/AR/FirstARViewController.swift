//
//  FirstARViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 16/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit
import ARKit

class FirstARViewController: UIViewController, ARSCNViewDelegate{
    
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
    @IBOutlet weak var choseNum: UILabel!
    @IBOutlet weak var chosetext: UILabel!
    @IBOutlet weak var resulttextlbl: UILabel!
    @IBOutlet weak var resultnumlbl: UILabel!
    // MARK:- Variables
    
    let configuration = ARWorldTrackingConfiguration()
    let panelsWH      = 3
    let yOff          = 0.5
    var predictednum  = 0
    var printedRot    = false
    var winV: WinView? = nil
    let defaults = UserDefaults.standard

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
        self.createbackseparator()
        self.createPlanesSides(right: false)
        self.createPlanesSides(right: true)
        self.startup()
        self.instructionsView.layer.cornerRadius = 5
        self.instructionsView.layer.masksToBounds = true
        rollDiceButtonbottom.titleLabel?.font = Font.getbigFont(size: 22)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let _ = defaults.string(forKey: "numberGame") {
            print("Has Defaults")
        } else {
            self.goInstructions(title:  InstructionsStrings.aNumeroTitle, instructions: InstructionsStrings.aNumero)
        }
    }
    
    // MARK:- Functions
    
    
    func rollTheDice() {
        rollDiceButtonbottom.isHidden = true
        let dicenode: SCNNode? = SCNNode()
        dicenode?.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        
        let Materials : [SCNMaterial] = [SCNMaterial(),SCNMaterial(),SCNMaterial(),SCNMaterial(),SCNMaterial(),SCNMaterial()]
        Materials[0].diffuse.contents = UIImage(named: "Dice5.png")
        Materials[1].diffuse.contents = UIImage(named: "Dice2.png")
        Materials[2].diffuse.contents = UIImage(named: "Dice3.png")
        Materials[3].diffuse.contents = UIImage(named: "Dice4.png")
        Materials[4].diffuse.contents = UIImage(named: "Dice1.png")
        Materials[5].diffuse.contents = UIImage(named: "Dice6.png")
        dicenode?.geometry?.materials = Materials
        dicenode?.position = SCNVector3(0.0, 0.63, -0.8)
        let body = SCNPhysicsBody(type: .dynamic, shape: SCNPhysicsShape(node: dicenode!, options: [SCNPhysicsShape.Option.keepAsCompound: true]))
        dicenode?.physicsBody = body
        dicenode?.physicsBody?.allowsResting = true
        dicenode?.geometry?.name = "dice"
        self.arsceneview.scene.rootNode.addChildNode(dicenode!)
        let rotationAction = Rotation(time: 0.2)
        dicenode!.runAction(rotationAction)
    }
    
    func createbackseparator(){
        let pos   = SCNVector3(0.0, 0.0 + yOff, 0.0)
        let engel = SCNVector3(0, 0, 0)
        let color = Colors.manatee
        
        let bottomPlane = SCNNode(geometry: SCNPlane(width: CGFloat(panelsWH), height: CGFloat(panelsWH)))
        bottomPlane.geometry?.firstMaterial?.transparency = 0.0
        bottomPlane.geometry?.firstMaterial?.diffuse.contents = color
        bottomPlane.geometry?.firstMaterial?.isDoubleSided = true
        bottomPlane.position    = pos
        bottomPlane.eulerAngles = engel
        let staticBody          = SCNPhysicsBody.static()
        bottomPlane.physicsBody = staticBody
        bottomPlane.geometry?.name = "panel"
        self.arsceneview.scene.rootNode.addChildNode(bottomPlane)
    }
    
    func createPlaneBottomBack(bottom: Bool){
        let vall = 1.0
        let pos   = bottom ? SCNVector3(0.0, -(vall) + yOff, 0.0) : SCNVector3(0.0, 0.0 + yOff, -(vall))
        let engel = bottom ? SCNVector3(90.degreesToRadians, 0, 0) : SCNVector3(0, 0, 0)
        let color = bottom ? Colors.lightblue : Colors.manatee
        let boooom = bottom ? "bottom" : "panel"
        let bottomPlane = SCNNode(geometry: SCNPlane(width: CGFloat(panelsWH), height: CGFloat(panelsWH)))
        bottomPlane.geometry?.firstMaterial?.transparency = 0.0
        bottomPlane.geometry?.firstMaterial?.diffuse.contents = color
        bottomPlane.geometry?.firstMaterial?.isDoubleSided = true
        bottomPlane.position    = pos
        bottomPlane.eulerAngles = engel
        let staticBody          = SCNPhysicsBody.static()
        bottomPlane.physicsBody = staticBody
        bottomPlane.geometry?.name = boooom
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
        sidepanel.geometry?.name = "panel"
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
        self.choseNum.text = ""
        self.choseNum.font = Font.getbigFont(size: 80)
        self.choseNum.isHidden = true
        self.chosetext.font = Font.getbigFont(size: 17)
        self.chosetext.isHidden = true
        
        self.resultnumlbl.text = ""
        self.resultnumlbl.font = Font.getbigFont(size: 80)
        self.resultnumlbl.isHidden = true
        self.resulttextlbl.font = Font.getbigFont(size: 17)
        self.resulttextlbl.isHidden = true

        self.backtop.isHidden = true
        self.rollDiceButtonbottom.isHidden = true
        self.backtop.isUserInteractionEnabled = false
        self.rollDiceButtonbottom.isUserInteractionEnabled = false
    }
    
    func endup() {
        self.instructionsView.isUserInteractionEnabled = false
        self.instructionsView.isHidden = true
        self.backtop.isHidden = false
        self.choseNum.isHidden = false
        self.choseNum.text = "\(predictednum)"
        self.chosetext.isHidden = false
        self.resultnumlbl.isHidden = false
        self.resulttextlbl.isHidden = false
        self.backtop.isUserInteractionEnabled = true
        self.rollDiceButtonbottom.isUserInteractionEnabled = true
        self.rollDiceButtonbottom.isHidden = false

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
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        for object in self.arsceneview.scene.rootNode.childNodes {
            if object.geometry?.name != nil && object.geometry?.name != "panel" && object.geometry?.name != "bottom" {
                if let obody = object.physicsBody {
                    if obody.isResting && !printedRot {
                        let endup = boxUpIndex(node: object)
                        DispatchQueue.main.async {
                            self.resultnumlbl.text = "\(endup)"
                            self.winfunc(lose: !(endup == self.predictednum))
                        }
                        printedRot = true
                        return
                    }
                }
            }
        }
    }
    
    func winfunc(lose: Bool) {
        if !lose {
            self.choseNum.textColor  = .green
            self.chosetext.textColor = .green
            self.resultnumlbl.textColor  = .green
            self.resulttextlbl.textColor = .green
        } else {
            self.choseNum.textColor  = .systemRed
            self.chosetext.textColor = .systemRed
            self.resultnumlbl.textColor  = .systemRed
            self.resulttextlbl.textColor = .systemRed
        }
        let maWidth    = 400
        let maHeight   = 270
        let longWidth  = self.view.frame.width/2
        let longHeight = self.view.frame.height/2
        var winview = WinView()
        if let winwin = winV {
            winV?.isHidden = false
            winview = winwin
            winview.setwin(win: !lose)
        } else {
            winview = WinView(frame: CGRect(x: Int(longWidth) - maWidth/2,
                                                y: Int(longHeight) - maHeight/2 + 30,
                                                width: maWidth, height: maHeight),
                                  titler: "¿Qué quieres hacer ahora?", viewController: self,
                                  actionL:  #selector(ledft),
                                  actionM: #selector(restartSess),
                                  actionR: #selector(rigtht),
                                  win: !lose)
            winV = winview
        }
        winview.alpha = 0.0
        view.addSubview(winview)
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveLinear, animations: {
            winview.alpha = 1.0
            winview.transform = CGAffineTransform(translationX: 0, y: -30)
        }, completion: {(Bool) in print("")})
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
    
    @objc func restartSess() {
        self.restartSession()
        self.configuration.planeDetection = .horizontal
        self.arsceneview.session.run(configuration)
        self.arsceneview.delegate = self
        self.arsceneview.autoenablesDefaultLighting = true
        self.createPlaneBottomBack(bottom: true)
        self.createPlaneBottomBack(bottom: false)
        self.createbackseparator()
        self.createPlanesSides(right: false)
        self.createPlanesSides(right: true)
        self.startup()
        self.winV!.isHidden = true
        self.instructionsView.isUserInteractionEnabled = true
        self.instructionsView.isHidden = false
        self.printedRot = false
        self.rollDiceButtonbottom.isHidden = false
        self.choseNum.textColor  = Colors.charcoal
        self.chosetext.textColor = Colors.charcoal
        self.resultnumlbl.textColor  = Colors.charcoal
        self.resulttextlbl.textColor = Colors.charcoal
    }
    
    func restartSession() {
        self.arsceneview.session.pause()
        self.arsceneview.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.arsceneview.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
}

func +(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}

func boxUpIndex(node: SCNNode) -> Int {
    let rotation: SCNVector4    = node.presentation.rotation
    var invRotation: SCNVector4 = rotation
    invRotation.w = -invRotation.w
    
    let up: SCNVector3 = SCNVector3(0, 1, 0)
    
    let transform: SCNMatrix4 = SCNMatrix4MakeRotation(invRotation.w, invRotation.x, invRotation.y, invRotation.z)
    let glkTransform: GLKMatrix4 = SCNMatrix4ToGLKMatrix4(transform)
    let glkUp: GLKVector3        = SCNVector3ToGLKVector3(up)
    let rotatedUp: GLKVector3    = GLKMatrix4MultiplyVector3(glkTransform, glkUp)
    
    let boxNormals: [GLKVector3] = [GLKVector3(v: ( 0, 0, 1)),
                                    GLKVector3(v: ( 1, 0, 0)),
                                    GLKVector3(v: ( 0, 0,-1)),
                                    GLKVector3(v: (-1, 0, 0)),
                                    GLKVector3(v: ( 0, 1, 0)),
                                    GLKVector3(v: ( 0,-1, 0))]
    
    var bestIndex: Int = 0
    var maxDot: Float  = -1
    
    for i in 0..<6 {
        let dot: Float = GLKVector3DotProduct(boxNormals[i], rotatedUp)
        if dot > maxDot {
            maxDot    = dot
            bestIndex = i
        }
    }
    
    switch bestIndex {
    case 0:
        bestIndex = 5
    case 1:
        bestIndex = 2
    case 2:
        bestIndex = 3
    case 3:
        bestIndex = 4
    case 4:
        bestIndex = 1
    case 5:
        bestIndex = 6
    default:
        return bestIndex
    }
    
    return bestIndex
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180}
}
