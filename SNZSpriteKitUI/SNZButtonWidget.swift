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

public class SNZButtonWidget : SNZWidget {

    public var caption: String = "Untitled"
    public var color: UIColor = UIColor.blackColor()
    public var backgroundColor: UIColor = UIColor.whiteColor()
    public var cornerRadius:CGFloat = 4
    
    public override init(parentNode: SKNode) {
        super.init(parentNode: parentNode)
        
        self.size = CGSizeMake(200, 48)
    }
    
    public override func show() {
        let buttonRect = CGRectMake(0, 0, self.size.width, self.size.height)
        let buttonSprite = SKShapeNode(rect: buttonRect, cornerRadius: self.cornerRadius)
        buttonSprite.fillColor = self.backgroundColor
        buttonSprite.position = self.position
    
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
        
        self.bind("focus",{
            self.sprite?.setScale(1.2)
        });
        
        self.bind("blur",{
            self.sprite?.setScale(1.0)
        });
        
        super.show()
    }    

}