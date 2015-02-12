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
    }


}
