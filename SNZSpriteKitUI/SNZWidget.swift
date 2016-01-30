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

public typealias SNZEventHandler = () -> ()

public class SNZWidget : UIResponder {

    public var parentNode: SKNode?
    public var sprite: SKNode?
    
    public var size: CGSize = CGSizeMake(500,200)
    public var position: CGPoint = CGPointMake(100,100)
    
    public var events = [String: [SNZEventHandler]]()
    
    public init(parentNode: SKNode) {
        self.parentNode = parentNode
    }
    
    public func bind(event: String, _ handler: ()->()) {
        if (self.events[event] == nil) {
            self.events[event] = [SNZEventHandler]()
        }
        self.events[event]!.append(handler)
    }
    
    public func trigger(event: String) {
        if (self.events[event] != nil) {
            for handler in self.events[event]! {
                handler()
            }
        }
    }
    
    public func show() {
        if (self.sprite != nil) {
            self.parentNode?.addChild(self.sprite!)
        }
    }
    
    public func hide() {
        if (self.sprite != nil) {
            self.sprite!.removeFromParent();
        }
    }
    
    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override public func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }

}