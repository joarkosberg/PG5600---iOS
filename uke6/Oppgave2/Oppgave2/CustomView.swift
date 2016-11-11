//
//  CustomView.swift
//  Oppgave2
//
//  Created by Admin  on 11/11/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    override func didMoveToWindow() {
        self.layer.borderColor = UIColor.yellow.cgColor
        self.layer.borderWidth = 2.0
    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x: 10, y: 10))
        arrowPath.addLine(to: CGPoint(x: 15, y: 5))
        arrowPath.addLine(to: CGPoint(x: 95, y: 80)) // CENTER
        arrowPath.addLine(to: CGPoint(x: 175, y: 5))
        arrowPath.addLine(to: CGPoint(x: 180, y: 10))
        arrowPath.addLine(to: CGPoint(x: 95, y: 80)) // CENTER
        arrowPath.addLine(to: CGPoint(x: 180, y: 155))
        arrowPath.addLine(to: CGPoint(x: 175, y: 160))
        arrowPath.addLine(to: CGPoint(x: 95, y: 80)) // CENTER
        arrowPath.addLine(to: CGPoint(x: 15, y: 160))
        arrowPath.addLine(to: CGPoint(x: 10, y: 155))
        arrowPath.addLine(to: CGPoint(x: 95, y: 80)) // CENTER
        arrowPath.addLine(to: CGPoint(x: 10, y: 10))
        arrowPath.close()
        UIColor.black.setFill()
        arrowPath.fill()
    }
}
