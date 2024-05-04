//
//  ToolTipView.swift
//  ToolTipView
//
//  Created by 오킹 on 2024/04/17.
//

import UIKit

enum TipYPosition {
    case top
    case bottom
}

enum TipXPosition {
    case left(constant: CGFloat)
    case right(constant: CGFloat)
    case center
}

class ToolTipView: UIView {
    
    var paddingLabel: PaddingLabel = {
        let view = PaddingLabel()
        view.text = "안녕하세요?"
        view.numberOfLines = 0
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var trianleView: TriangleView = {
        var view = TriangleView(frame: .zero, tipYPosition: .bottom)
        return view
    }()

    override var backgroundColor: UIColor? {
          get {
              return paddingLabel.backgroundColor
          }
          set {
              paddingLabel.backgroundColor = newValue
              trianleView.color = newValue ?? .white
          }
      }
    
    var tipYPosition: TipYPosition = .bottom {
        didSet {
            
            updateAutoLayout()
            trianleView.tipYPosition = tipYPosition
        }
    }
    
    var tipXPosition: TipXPosition = .center {
        didSet {
            updateAutoLayout()
        }
    }
    
    override init(frame: CGRect) {
        self.trianleView = TriangleView(frame: frame, tipYPosition: self.tipYPosition)
        super.init(frame: frame)
        setup()
    }
 
    required init?(coder: NSCoder) {
        self.trianleView = TriangleView(frame: .zero, tipYPosition: self.tipYPosition)
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.trianleView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(paddingLabel)
        self.addSubview(trianleView)
        
        updateAutoLayout()
    }
    
    private func layoutTopTip() {

        switch tipXPosition {
        case .center:
            trianleView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            
        case .left(let constant):
            trianleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constant).isActive = true
            
        case .right(constant: let constant):
            trianleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: constant).isActive = true
        }
        
        NSLayoutConstraint.activate([
            trianleView.widthAnchor.constraint(equalToConstant: 20),
            trianleView.heightAnchor.constraint(equalToConstant: 20),
            trianleView.topAnchor.constraint(equalTo: self.topAnchor),
            
            paddingLabel.topAnchor.constraint(equalTo: trianleView.bottomAnchor),
            paddingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            paddingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            paddingLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func layoutBottomTip() {
        
        switch tipXPosition {
        case .center:
            trianleView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            
        case .left(let constant):
            trianleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constant).isActive = true
            
        case .right(constant: let constant):
            trianleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: constant).isActive = true
        }
        
        NSLayoutConstraint.activate([
            paddingLabel.topAnchor.constraint(equalTo: self.topAnchor),
            paddingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            paddingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            paddingLabel.bottomAnchor.constraint(equalTo: trianleView.topAnchor),
            
            trianleView.widthAnchor.constraint(equalToConstant: 20),
            trianleView.heightAnchor.constraint(equalToConstant: 20),
            trianleView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func removeAutoLayout() {
        self.removeConstraints(self.constraints)
    }
    
    private func updateAutoLayout() {
        removeAutoLayout()
        
        if tipYPosition == .top {
            layoutTopTip()
        } else {
            layoutBottomTip()
        }
    }
    
    func update(text: String) {
        paddingLabel.text = text
    }
}

