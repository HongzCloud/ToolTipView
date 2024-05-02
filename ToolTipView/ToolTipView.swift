//
//  ToolTipView.swift
//  ToolTipView
//
//  Created by 오킹 on 2024/04/17.
//

import UIKit

class ToolTipView: UIView {
    
    enum TipYPosition {
        case top
        case bottom
    }
    
    enum TipXPosition {
        case left(constant: CGFloat)
        case right(constant: CGFloat)
        case center
    }
    
    private let containerView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let paddingLabel: PaddingLabel = {
        let view = PaddingLabel()
        view.text = "안녕하세요?"
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var trianleView: TriangleView!

    override var backgroundColor: UIColor? {
          get {
              return paddingLabel.backgroundColor
          }
          set {
              paddingLabel.backgroundColor = newValue
              trianleView.color = newValue ?? .white
          }
      }
    
    var tipYPosition: ToolTipView.TipYPosition = .bottom {
        willSet(newVal){
            removeAutoLayout()
            
            if newVal == .top {
                layoutTopTip()
            } else {
                layoutBottomTip()
            }
            
            self.trianleView.tipYPosition = newVal
        }
    }
    
    var tipXPosition: ToolTipView.TipXPosition = .center {
        didSet {
            removeAutoLayout()
            
            if tipYPosition == .top {
                layoutTopTip()
            } else {
                layoutBottomTip()
            }
        }
    }
    
    override init(frame: CGRect) {
        self.trianleView = TriangleView(frame: frame, tipYPosition: self.tipYPosition)
        super.init(frame: frame)
        setup()
    }
    
    init(frame: CGRect, tipYPosition: TipYPosition, tipXPosition: TipXPosition) {
        self.trianleView = TriangleView(frame: frame, tipYPosition: self.tipYPosition)
        self.tipYPosition = tipYPosition
        self.tipXPosition = tipXPosition
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        self.trianleView = TriangleView(frame: .zero, tipYPosition: self.tipYPosition)
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.addSubview(containerView)
        self.trianleView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(paddingLabel)
        containerView.addSubview(trianleView)
        
        layoutTopTip()
    }
    
    private func layoutTopTip() {

        switch tipXPosition {
        case .center:
            trianleView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            
        case .left(let constant):
            trianleView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: constant).isActive = true
            
        case .right(constant: let constant):
            trianleView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: constant).isActive = true
        }
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            trianleView.widthAnchor.constraint(equalToConstant: 20),
            trianleView.heightAnchor.constraint(equalToConstant: 20),
            trianleView.topAnchor.constraint(equalTo: containerView.topAnchor),
            
            paddingLabel.topAnchor.constraint(equalTo: trianleView.bottomAnchor),
            paddingLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            paddingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            paddingLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    private func layoutBottomTip() {
        
        switch tipXPosition {
        case .center:
            trianleView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            
        case .left(let constant):
            trianleView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: constant).isActive = true
            
        case .right(constant: let constant):
            trianleView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: constant).isActive = true
        }
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            paddingLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            paddingLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            paddingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            paddingLabel.bottomAnchor.constraint(equalTo: trianleView.topAnchor),
            
            trianleView.widthAnchor.constraint(equalToConstant: 20),
            trianleView.heightAnchor.constraint(equalToConstant: 20),
            trianleView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    private func removeAutoLayout() {
        containerView.removeConstraints(containerView.constraints)
    }
}

