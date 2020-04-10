//
//  ViewController.swift
//  Egg Timer
//
//  Created by Nikola on 04/04/2020.
//  Copyright © 2020 Nikola Krstevski. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, CAAnimationDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var circularBarView: UIView!
    var player: AVAudioPlayer!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //From Bryan viewDidLoad START
        view.backgroundColor = .systemYellow
        setupCircularPath()
        basicAnimation.delegate = self
        circularBarView.addSubview(labelLayer)
        labelLayer.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        labelLayer.center = circularBarView.center
        //From Bryan viewDidLoad END
    }
    
    @IBAction func selectedButton(_ sender: UIButton) {
        
        if sender.tag == 0 {
            titleLabel.text = "Soft Egg's coming Up!"
//            view.backgroundColor = #colorLiteral(red: 1, green: 0.5942648841, blue: 0.1329012256, alpha: 1)
            setProgressWithAnimation(duration: 2.0)
        } else if sender.tag == 1 {
            titleLabel.text = "Medium boiled  Egg  is on it's way!"
//            view.backgroundColor = #colorLiteral(red: 1, green: 0.8433766195, blue: 0.416538976, alpha: 1)
            setProgressWithAnimation(duration: 3.0)
        } else {
            titleLabel.text = "Hard as a Rock egg is chosen!"
//            view.backgroundColor = #colorLiteral(red: 1, green: 0.9605268091, blue: 0.7551984568, alpha: 1)
            setProgressWithAnimation(duration: 4.0)
        }
        
    }
    //From Bryan functions START
    
    func setupCircularPath() {
        shapeLayer.frame = circularBarView.bounds
        labelLayer.center = circularBarView.center
        //Convert circularBarsView's center from it's superview's coordinate system to it's coordinate system(next line only)
        let centerForСircularView = circularBarView?.superview?.convert(circularBarView.center, to: circularBarView) ?? CGPoint.zero
        let radius: CGFloat = 100
        let circularPath = UIBezierPath(arcCenter: centerForСircularView, radius: radius, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        //track layer setup
        let trackLayer = CAShapeLayer()
        trackLayer.frame = circularBarView.bounds
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.systemGray.cgColor
        trackLayer.lineWidth = 15
        trackLayer.fillColor = UIColor.clear.cgColor
        circularBarView.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.systemPurple.cgColor
        shapeLayer.lineWidth = 15
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeStart = 0
        circularBarView.layer.addSublayer(shapeLayer)
        
     
    }
    
    func setProgressWithAnimation(duration: Double) {
       
        basicAnimation.fromValue = 0
        basicAnimation.toValue = 1
        basicAnimation.duration = duration
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")

    }
    //From Bryan functions END
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        titleLabel.text = "Done!"
        
        let url = Bundle.main.url(forResource: "service_bell", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.numberOfLoops = 2
        player.play()
//
        
    }

}







