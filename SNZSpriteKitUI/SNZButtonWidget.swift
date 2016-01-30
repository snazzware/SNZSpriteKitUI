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
    public var labelSprite: SKLabelNode?
    
    public override init(parentNode: SKNode) {
        super.init(parentNode: parentNode)
        
        self.size = CGSizeMake(200, 48)
    }
    
    public override func show() {
        let buttonRect = CGRectMake(0, 0, self.size.width, self.size.height)
        let buttonSprite = SKShapeNode(rect: buttonRect, cornerRadius: self.cornerRadius)
        buttonSprite.fillColor = self.backgroundColor
        buttonSprite.position = self.position
    
        self.labelSprite = SKLabelNode(fontNamed: "Avenir-Black")
        self.labelSprite!.text = self.caption
        self.labelSprite!.fontColor = self.color
        self.labelSprite!.fontSize = 20
        self.labelSprite!.horizontalAlignmentMode = .Center
        self.labelSprite!.verticalAlignmentMode = .Center
        self.labelSprite!.position = CGPointMake(((self.size.width) / 2), ((self.size.height) / 2))

        self.labelSprite!.ignoreTouches = true
        
        buttonSprite.addChild(self.labelSprite!)
        
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