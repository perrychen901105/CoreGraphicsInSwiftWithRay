//
//  GraphView.swift
//  Flo
//
//  Created by chenzhipeng on 15/2/14.
//  Copyright (c) 2015年 chenzhipeng. All rights reserved.
//

import UIKit

@IBDesignable class GraphView: UIView {

    // 1 - the properties for the gradient
    @IBInspectable var startColor: UIColor = UIColor.redColor()
    @IBInspectable var endColor: UIColor = UIColor.greenColor()
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        // 2 - get the current context
        /**
        *  CG drawing functions need to know the context in which they will draw, so you use the UIKit method UIGraphicsGetCurrentContext() to obtain the current context. That's the one that drawRect(_:) draws into
        */
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.CGColor, endColor.CGColor]
        
        // 3 - set up the color space
        /**
        *  All contexts have a color space. This could be CMYK or grayscale, but here you're using the RGB color space.
        */
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        // 4 - set up the color stops
        let colorLocations:[CGFloat] = [0.0, 1.0]
        
        // 5 - create the gradient
        let gradient = CGGradientCreateWithColors(colorSpace,
            colors,
            colorLocations)
        
        // 6 - draw the gradient
        var startPoint = CGPoint.zeroPoint
        var endPoint = CGPoint(x: 0, y: self.bounds.height)
        CGContextDrawLinearGradient(context,
            gradient,
            startPoint,
            endPoint,
            0)
    }


}
