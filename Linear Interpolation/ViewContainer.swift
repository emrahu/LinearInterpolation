//
//  ViewContainer.swift
//  Linear Interpolation
//
//  Created by Emrah Usar on 4/20/18.
//  Copyright © 2018 Universal Systems Applications and Resources. All rights reserved.
//

import Cocoa

class ViewContainer: NSView {

    var points = [AnchorPoint]()
    
    let path = NSBezierPath()
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        if points.count > 1 {
            let previousPoint = points.count - 2
            let previousPointFrame = CGPoint(x: NSMidX(points[previousPoint].frame), y: NSMidY(points[previousPoint].frame))
            let newPoint = CGPoint(x: NSMidX(points.last!.frame), y: NSMidY(points.last!.frame))
            
            path.lineWidth = 3.0
            path.lineCapStyle = .roundLineCapStyle
            path.move(to: previousPointFrame)
            path.line(to: newPoint)
            path.stroke()
        }
        
    }
}
