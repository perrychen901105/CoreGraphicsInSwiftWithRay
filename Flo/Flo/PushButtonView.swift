///Users/Perry/Project/MyProject/CoreGraphicsInSwiftWithRay/Flo/Flo.xcodeproj
//  PushButtonView.swift
//  Flo
//
//  Created by chenzhipeng on 15/2/12.
//  Copyright (c) 2015年 chenzhipeng. All rights reserved.
//

import UIKit

@IBDesignable

class PushButtonView: UIButton {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        var path = UIBezierPath(ovalInRect: rect)
        UIColor.blueColor().setFill()
        path.fill()
        
        // set up the width and height variables
        // for the horizontal stroke
        let plusHeight: CGFloat = 3.0
        let plusWidth:  CGFloat = 45.0
        
        // create the path
        var plusPath = UIBezierPath()
        
        // set the path's line width to the height of the stroke
        plusPath.lineWidth = plusHeight
        
        // move the initial point of the path
        // to the start of the horizontal stroke
        plusPath.moveToPoint(CGPoint(x: bounds.width/2 - plusWidth/2 + 0.5, y: bounds.height/2 + 0.5))
        
        // add a point to the path at the end of the stroke
        plusPath.addLineToPoint(CGPoint(x: bounds.width/2 + plusWidth/2 + 0.5, y: bounds.height/2 + 0.5))
        
        // vertical line
        // move to the start of the vertical stroke
        plusPath.moveToPoint(CGPoint(x: bounds.width/2 + 0.5, y: bounds.height/2 - plusWidth/2 + 0.5))
        
        // add the end point to the vertical stroke
        plusPath.addLineToPoint(CGPoint(x: bounds.width/2 + 0.5, y: bounds.height/2 + plusWidth/2 + 0.5))
        
        // set the stroke color
        UIColor.whiteColor().setStroke()
        
        // draw the stroke
        plusPath.stroke()
    }


}
