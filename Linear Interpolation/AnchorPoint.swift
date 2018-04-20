//
//  AnchorPoint.swift
//  Linear Interpolation
//
//  Created by Emrah Usar on 1/28/18.
//  Copyright © 2018 Universal Systems Applications and Resources. All rights reserved.
//

import Cocoa

class AnchorPoint: NSView {

    var point: NSPoint!
    var clickGestureRecognizer: NSClickGestureRecognizer!
    var initialLocation: NSPoint!
    
    private var trackingArea: NSTrackingArea?
    
    private var currentContext: CGContext?
//    {
//        get {
//            if #available(OSX 10.10, *) {
//                return NSGraphicsContext.current?.cgContext
//            } else if let contextPointer  = NSGraphicsContext.current?.graphicsPort {
//                let context = Unmanaged.fromOpaque(OpaquePointer(contextPointer)).takeUnretainedValue()
//                return context
//            }
//        }
//    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        clickGestureRecognizer = NSClickGestureRecognizer()
        wantsLayer = true
        layer?.cornerRadius = self.frame.size.height / 2
        layer?.backgroundColor = NSColor.red.cgColor
    }
    
    override func mouseEntered(with event: NSEvent) {
        self.layer?.backgroundColor = NSColor.gray.cgColor
    }
    
    override func mouseExited(with event: NSEvent) {
        self.layer?.backgroundColor = NSColor.red.cgColor
    }
    
    override func mouseDown(with event: NSEvent) {
        initialLocation = event.locationInWindow
    }
    
    override func mouseDragged(with event: NSEvent) {
        super.mouseDragged(with: event)
        let originalLocation = self.initialLocation
        let currentLocation = event.locationInWindow
//        print("Original Location: \(originalLocation)")
//        print("Current Location: \(currentLocation)")
//        print("")
        var newLocation =  NSPoint.zero
        let screenFrame = NSScreen.main?.frame
        let windowFrame = self.frame
        
        newLocation.x = currentLocation.x //- initialLocation.x
        newLocation.y = currentLocation.y //- initialLocation.y
        
        self.setFrameOrigin(newLocation)
    }
    
    override func rightMouseDown(with event: NSEvent) {
        removeFromSuperview()
    }
    
    
    override func updateTrackingAreas() {
        super.updateTrackingAreas()
        if let trackingArea = self.trackingArea {
            self.removeTrackingArea(trackingArea)
        }
        
//        let options = NSTrackingArea.Options = [.mouseEnteredAndExited, .activeAlways]
        let trackingArea = NSTrackingArea(rect: self.bounds, options: [NSTrackingArea.Options.mouseEnteredAndExited, .activeAlways], owner: self, userInfo: nil)
        self.addTrackingArea(trackingArea)
        
    }
    
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        fatalError("Can't initialize")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        let bezier = NSBezierPath(rect: (self.superview?.frame)!)
        bezier.move(to: NSPoint(x: 10, y: 10))
        bezier.line(to: NSPoint(x: 50, y: 50))
        NSColor.darkGray.set()
        bezier.stroke()
    }
}
