//
//  CustomView.swift
//  Oppgave1
//
//  Created by Admin  on 11/9/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import UIKit

class CustomView: UIView {

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let point = touch.location(in: self)
        print("Touch location: \(point)")
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x: 50, y: 0))
        arrowPath.addLine(to: CGPoint(x: 70, y: 25))
        arrowPath.addLine(to: CGPoint(x: 60, y: 25))
        arrowPath.addLine(to: CGPoint(x: 60, y: 75))
        arrowPath.addLine(to: CGPoint(x: 40, y: 75))
        arrowPath.addLine(to: CGPoint(x: 40, y: 25))
        arrowPath.addLine(to: CGPoint(x: 30, y: 25))
        arrowPath.addLine(to: CGPoint(x: 50, y: 0))
        arrowPath.close()
        UIColor.green.setFill()
        arrowPath.fill()
    }
}
