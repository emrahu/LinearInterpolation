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

    @IBOutlet weak var viewPointContainer: ViewContainer!
    var labelNumberOfPoints: NSTextField!
    
    var points = [AnchorPoint]()
    
    var clickGesture: NSClickGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        viewPointContainer.layer?.backgroundColor = NSColor.white.cgColor
        clickGesture = NSClickGestureRecognizer(target: self, action: #selector(_didClick))
        view.addGestureRecognizer(clickGesture)
        
        labelNumberOfPoints = NSTextField(labelWithString: "Points: \(points.count)")
        labelNumberOfPoints.textColor = NSColor.black
        labelNumberOfPoints.font = NSFont.systemFont(ofSize: 17.0, weight: NSFont.Weight.medium)
        viewPointContainer.addSubview(labelNumberOfPoints)
        
        labelNumberOfPoints.translatesAutoresizingMaskIntoConstraints = false
        labelNumberOfPoints.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        labelNumberOfPoints.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
    }

    @objc private func _didClick(sender: NSClickGestureRecognizer){

        
        let location = sender.location(in: viewPointContainer)
        let anchorPoint = AnchorPoint(frame: NSRect(x: location.x, y: location.y, width: 10, height: 10))
        viewPointContainer.addSubview(anchorPoint)
        points.append(anchorPoint)
        labelNumberOfPoints.stringValue = "Points: \(points.count)"
        viewPointContainer.points = points
        viewPointContainer.display()
        
        
        // Quadratic polynomial
        //(1-t)^2A + 2(1-t)tB + t^2C
        
    }
    func addCurve(){
        print("adding curve")
        
    }
}

