//
//  SNZDialog.swift
//  Delve
//
//  Created by Josh McKee on 11/13/15.
//  Copyright © 2015 Neil North. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class SNZLabelWidget : SNZWidget {

    var caption: String = "Untitled"
    var color: UIColor = UIColor.blackColor()
    var backgroundColor: UIColor = UIColor.whiteColor()
    
    override init(parentNode: SKNode) {
        super.init(parentNode: parentNode)
        
        self.size = CGSizeMake(200, 48)
    }
    
    override func show() {
        let buttonRect = CGRectMake(0, 0, self.size.width, self.size.height)
        let buttonSprite = SKShapeNode(rect: buttonRect)
        buttonSprite.fillColor = self.backgroundColor
        buttonSprite.position = CGPointMake(((self.parentNode?.frame.width)! / 2)*(-1) + self.position.x, ((self.parentNode?.frame.height)! / 2)*(-1) + self.position.y)
        buttonSprite.ignoreTouches = true
    
        let labelSprite = SKLabelNode(fontNamed: "Avenir-Black")
        labelSprite.text = self.caption
        labelSprite.fontColor = self.color
        labelSprite.fontSize = 20
        labelSprite.horizontalAlignmentMode = .Center
        labelSprite.verticalAlignmentMode = .Center
        labelSprite.position = CGPointMake(((self.size.width) / 2), ((self.size.height) / 2))
        labelSprite.ignoreTouches = true
        
        buttonSprite.addChild(labelSprite)
        
        self.sprite = buttonSprite
        
        super.show()
    }    

}