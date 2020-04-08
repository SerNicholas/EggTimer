//
//  ViewController.swift
//  Egg Timer
//
//  Created by Nikola on 04/04/2020.
//  Copyright © 2020 Nikola Krstevski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    //From Bryan start properties
    let shapeLayer = CAShapeLayer()
    let labelLayer: UILabel = {
        let label = UILabel()
        label.text = "Start"
        label.font = UIFont(name: "Chalkduster", size: 25)
        label.textColor = .darkText
        return label
    }()
    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    //From Bryan end properties
    
    @IBOutlet weak var titleLabel: UILabel!
   
    @IBOutlet weak var circularBarView: UIView!
    var duration: TimeInterval!
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7]
    var totalTime = 0
    var secondsPast = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //From Bryan viewDidLoad START
        view.backgroundColor = .systemYellow
        trackLayerSetup()
        setupCircularBar()
        circularBarView.addSubview(labelLayer)
        labelLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        labelLayer.center = circularBarView.center
    
        
        //From Bryan viewDidLoad END
        
    }
    
  
    
    @IBAction func selectedButton(_ sender: UIButton) {
        
        animateCircle()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        //        switch hardness {
        //        case "Soft":
        //            titleLabel.text = "Soft Egg's coming Up!"
        //        case "Medium":
        //            titleLabel.text = "Medium boiled  Egg  is on it's way!"
        //        default:
        //            titleLabel.text = "Hard as a Rock egg is chosen!"
        //        }
        
        if hardness == "Soft" {
            titleLabel.text = "Soft Egg's coming Up!"
            view.backgroundColor = #colorLiteral(red: 1, green: 0.5942648841, blue: 0.1329012256, alpha: 1)
        } else if hardness == "Medium" {
            titleLabel.text = "Medium boiled  Egg  is on it's way!"
            view.backgroundColor = #colorLiteral(red: 1, green: 0.8433766195, blue: 0.416538976, alpha: 1)
        } else {
            titleLabel.text = "Hard as a Rock egg is chosen!"
            view.backgroundColor = #colorLiteral(red: 1, green: 0.9605268091, blue: 0.7551984568, alpha: 1)
        }
    }
    
    //From Bryan functions START
    
    func setupCircularBar() {
        shapeLayer.frame = circularBarView.bounds
          let centerForСircularView = circularBarView?.superview?.convert(circularBarView.center, to: circularBarView) ?? CGPoint.zero
        let radius: CGFloat = 100
        let circularPath = UIBezierPath(arcCenter: centerForСircularView, radius: radius, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
//        let circularPath = UIBezierPath(arcCenter: circularBarView.center, radius: 100, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.systemPurple.cgColor
        shapeLayer.lineWidth = 15
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        circularBarView.layer.addSublayer(shapeLayer)
        
    }
    
    func trackLayerSetup() {
    
        let trackLayer = CAShapeLayer()
        trackLayer.frame = circularBarView.bounds
        let radius: CGFloat = 100
        let centerForCircularView = circularBarView?.superview?.convert(circularBarView.center, to: circularBarView) ?? CGPoint.zero
        let circularPath = UIBezierPath(arcCenter: centerForCircularView, radius: radius, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.systemGray.cgColor
        trackLayer.lineWidth = 15
        trackLayer.fillColor = UIColor.clear.cgColor
        circularBarView.layer.addSublayer(trackLayer)
        
    }
    
    func beginCalculatingPercentage() {
        print("Attempting to count percentage")
        
    }
    
    func animateCircle() {
        
        basicAnimation.fromValue = 0
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
    
    @objc func handleTap() {
        print("Attempting to animate stroke")
        beginCalculatingPercentage()
        animateCircle()
        
    }
    
    //From Bryan functions END
    
}






