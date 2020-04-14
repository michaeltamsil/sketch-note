//
//  CanvasView.swift
//  Sketch Note
//
//  Created by michael tamsil on 13/04/20.
//  Copyright © 2020 michael tamsil. All rights reserved.
//

import UIKit

class CanvasView: UIView {

    let normalWidth:CGFloat! = 5;
    let biggerWidth:CGFloat! = 10;
    
    var lineColor:UIColor! = UIColor.white;
    lazy var lineWidth:CGFloat! = normalWidth;
    var path:UIBezierPath!
    var touchPoint:CGPoint!
    var startingPoint:CGPoint!
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        self.layer.borderWidth = 2;
        self.layer.borderColor = lineColor.cgColor;
    }

    override func layoutSubviews() {
        self.clipsToBounds = true
        self.isMultipleTouchEnabled = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startingPoint = touch?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        touchPoint = touch?.location(in: self)
        
        path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: touchPoint)
        startingPoint = touchPoint
        
        drawShapeLayer()
    }
    
    func drawShapeLayer() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
    
    func clearCanvas(){
        if path != nil {
            path.removeAllPoints()
        }
        self.layer.sublayers = nil
        self.setNeedsDisplay()
        self.changeToBlack()
    }
    
    func changeToBlack(){
        lineColor = UIColor.black
        lineWidth = normalWidth
    }
    
    func changeToGrey(){
        lineColor = UIColor.gray
        lineWidth = normalWidth
    }
    func changeToErase(){
        lineColor = UIColor.white
        lineWidth = biggerWidth
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in layer.render(in: rendererContext.cgContext)}
    }

}
