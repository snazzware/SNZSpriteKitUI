//
//  SNZSpriteKitUITheme.swift
//  SNZSpriteKitUI
//
//  Created by Josh McKee on 2/5/16.
//  Copyright © 2016 Josh McKee. All rights reserved.
//

import Foundation

public class SNZSpriteKitUIMargins {
    var left: CGFloat
    var right: CGFloat
    var top: CGFloat
    var bottom: CGFloat
    
    var horizontal: CGFloat {
        get {
            return self.left + self.right
        }
    }
    
    var vertical: CGFloat {
        get {
            return self.top + self.bottom
        }
    }
    
    init (_ top: CGFloat, _ right: CGFloat, _ bottom: CGFloat, _ left: CGFloat) {
        self.top = top
        self.right = right
        self.bottom = bottom
        self.left = left
    }
}

public class SNZSpriteKitUITheme {

    public static var instance = SNZSpriteKitUITheme()

    public var uiOuterMargins = SNZSpriteKitUIMargins(20,20,20,20)
    public var uiInnerMargins = SNZSpriteKitUIMargins(10,10,10,10)
    
    public var labelColor = UIColor.whiteColor()
    public var labelBackground = UIColor.clearColor()
    
    

}