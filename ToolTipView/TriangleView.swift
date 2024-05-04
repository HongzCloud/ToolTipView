//
//  TriangleView.swift
//  ToolTipView
//
//  Created by 오킹 on 2024/04/17.
//

import UIKit

final class TriangleView: UIView {
    
    var color: UIColor = .white
    
    var tipYPosition: TipYPosition = .bottom {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOpaque = false
    }
    
    init(frame: CGRect, tipYPosition: TipYPosition = .bottom) {
        self.tipYPosition = tipYPosition
        super.init(frame: frame)
        self.isOpaque = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        if tipYPosition == .top {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width / 2, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.close()
            
            color.set()
            path.fill()
        } else {
            
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width / 2, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.close()
            
            color.set()
            path.fill()
        }
        
    }
    
}
