//
//  SNZScene.swift
//  SNZSpriteKitUI
//
//  Created by Josh McKee on 1/29/16.
//  Copyright © 2016 Josh McKee. All rights reserved.
//

import Foundation
import SpriteKit

public class SNZScene : SKScene {

    public var widgets = [SNZWidget]()
    public var focusedWidget: SNZWidget?
    
    public func addWidget(widget: SNZWidget) {
        self.widgets.append(widget)
        if (widget.parentNode == nil) {
            widget.parentNode = self
        }
    }
    
    public func initWidgets() {
        for widget in self.widgets {
            widget.show()
        }
    }
    
    public func getWidgets(named: String) -> [SNZWidget] {
        return self.widgets.filter({
            $0.name == named
        })
    }
    
    public func updateWidgets() {
        for widget in self.widgets {
            widget.anchor()
        }
    }
    
    public func widgetTouchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) -> Bool {
        var handled = false
        
        for touch in touches {
            let location = touch.locationInNode(self)
            var touchedNode = self.nodeAtPoint(location)
            
            // determine actual sprite we should consider touched
            while (touchedNode.ignoreTouches && touchedNode.parent != nil) {
                touchedNode = touchedNode.parent!
            }
            
            // see if the sprite belongs to any of our widgets
            for widget in self.widgets {
                if (widget.sprite != nil && widget.sprite == touchedNode) {
                    if (self.focusedWidget != nil) {
                        if (self.focusedWidget!.sprite != touchedNode) {
                            self.focusedWidget!.trigger("blur")
                            widget.trigger("focus")
                            self.focusedWidget = widget
                        }
                        
                        handled = true
                    } else {
                        widget.trigger("focus")
                        self.focusedWidget = widget
                        
                        handled = true
                    }
                }
            }
        }
        
        if (!handled) {
            if (self.focusedWidget != nil) {
                self.focusedWidget!.trigger("blur")
                self.focusedWidget = nil
            }
        }
        
        return handled
    }
    
    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.widgetTouchesBegan(touches, withEvent: event)
    }
    
    override public func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.widgetTouchesMoved(touches, withEvent: event)
    }
    
    public func widgetTouchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) -> Bool {
        return self.widgetTouchesBegan(touches, withEvent: event)
    }
    
    public func widgetTouchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) -> Bool {
        var handled = false
        
        if (self.focusedWidget != nil) {
            self.focusedWidget!.trigger("blur")
        
            for touch in touches {
                let location = touch.locationInNode(self)
                var touchedNode = self.nodeAtPoint(location)
                
                // determine actual sprite we should consider touched
                while (touchedNode.ignoreTouches && touchedNode.parent != nil) {
                    touchedNode = touchedNode.parent!
                }
                
                // is the sprite the same one we started touching in touchesBegan?
                if (self.focusedWidget!.sprite == touchedNode) {
                    self.focusedWidget!.trigger("tap")
                    
                    handled = true
                }
            }
            
            self.focusedWidget = nil
        }
        
        return handled
    }
    
    override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.widgetTouchesEnded(touches, withEvent: event)
    }
}