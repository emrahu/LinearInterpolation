//
//  ViewController.swift
//  Linear Interpolation
//
//  Created by Emrah Usar on 1/25/18.
//  Copyright © 2018 Universal Systems Applications and Resources. All rights reserved.
//

import Cocoa
import QuartzCore

class AddPointsViewController: NSViewController {

    @IBOutlet weak var viewPointContainer: NSView!
    var points = [AnchorPoint]() {
        didSet{
            if points.count > 2 {
                self.addCurve()
            }
        }
    }
    
    var clickGesture: NSClickGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
//        view.layer?.backgroundColor = NSColor.white.cgColor
        viewPointContainer.layer?.backgroundColor = NSColor.white.cgColor
        clickGesture = NSClickGestureRecognizer(target: self, action: #selector(_didClick))
        view.addGestureRecognizer(clickGesture)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    

    
    @objc private func _didClick(sender: NSClickGestureRecognizer){
        
        let location = sender.location(in: viewPointContainer)
        
        let anchorPoint = AnchorPoint(frame: NSRect(x: location.x, y: location.y, width: 10, height: 10))
        anchorPoint.wantsLayer = true
        anchorPoint.layer?.cornerRadius = anchorPoint.frame.size.height / 2
        anchorPoint.layer?.backgroundColor = NSColor.red.cgColor
        
        
        
        viewPointContainer.addSubview(anchorPoint)
        
        points.append(anchorPoint)
        
        // Quadratic polynomial
        //(1-t)^2A + 2(1-t)tB + t^2C
        
    }
//    @IBAction func _didClickReset(_ sender: NSButton) {
//        for view in viewContainer.subviews{
//            view.removeFromSuperview()
//        }
//    }
    
    func addCurve(){
        
        
        
    }
    
}

