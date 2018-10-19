//
//  Circle.swift
//  GoalUI
//
//  Created by MacBook on 19.10.2018.
//  Copyright © 2018 Bizz. All rights reserved.
//

import UIKit

class Circle: UIView {

    override func drawRect(rect: CGRect)
    {
    drawRingFittingInsideView()
    }
    
    internal func drawRingFittingInsideView()->()
{
    let halfSize:CGFloat = min( bounds.size.width/2, bounds.size.height/2)
    let desiredLineWidth:CGFloat = 1    // your desired value
    
    let circlePath = UIBezierPath(
    arcCenter: CGPoint(x:halfSize,y:halfSize),
    radius: CGFloat( halfSize - (desiredLineWidth/2) ),
    startAngle: CGFloat(0),
    endAngle:CGFloat(M_PI * 2),
    clockwise: true)
    
//    let shapeLayer = CAShapeLayer()
//    shapeLayer.path = circlePath.CGPath
//
//    shapeLayer.fillColor = UIColor.clearColor().CGColor
//    shapeLayer.strokeColor = UIColor.redColor().CGColor
//    shapeLayer.lineWidth = desiredLineWidth
//
//    layer.addSublayer(shapeLayer)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
