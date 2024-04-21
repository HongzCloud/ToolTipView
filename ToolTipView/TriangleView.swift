//
//  TriangleView.swift
//  ToolTipView
//
//  Created by 오킹 on 2024/04/17.
//

import UIKit

class TriangleView: UIView {
    
    var color: UIColor = .white
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width / 2, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.close()
        
        color.set()
        path.fill()
    }
}
