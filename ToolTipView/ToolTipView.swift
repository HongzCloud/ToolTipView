//
//  ToolTipView.swift
//  ToolTipView
//
//  Created by 오킹 on 2024/04/17.
//

import UIKit

class ToolTipView: UIView {
    
    enum TipPosition {
        case top
        case bottom
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
    
    var tipPosition: ToolTipView.TipPosition = .bottom {
        willSet(newVal){
            removeAutoLayout()
            
            if newVal == .top {
                layoutTopTip()
            } else {
                layoutBottomTip()
            }
            
            self.trianleView.tipPosition = newVal
        }
    }
    
    var tipLeftConstraint: CGFloat = 0 {
        didSet {
            removeAutoLayout()
            
            if tipPosition == .top {
                layoutTopTip()
            } else {
                layoutBottomTip()
            }
        }
    }
    
    override init(frame: CGRect) {
        self.trianleView = TriangleView(frame: frame, tipPosition: self.tipPosition)
        super.init(frame: frame)
        setup()
    }
    
    init(frame: CGRect, tipPosition: ToolTipView.TipPosition, tipLeftConstraint: CGFloat) {
        self.trianleView = TriangleView(frame: frame, tipPosition: self.tipPosition)
        self.tipPosition = tipPosition
        self.tipLeftConstraint = tipLeftConstraint
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        self.trianleView = TriangleView(frame: .zero, tipPosition: self.tipPosition)
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

//        let centerXConstraint = NSLayoutConstraint(item: trianleView, attribute: .trailing, relatedBy: .equal, toItem: containerView, attribute: .trailing, multiplier: 0.2, constant: 0)
//           centerXConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            trianleView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: tipLeftConstraint),
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
//        let centerXConstraint = NSLayoutConstraint(item: trianleView, attribute: .trailing, relatedBy: .equal, toItem: containerView, attribute: .trailing, multiplier: 0.2, constant: 0)
//           centerXConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            paddingLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            paddingLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            paddingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            paddingLabel.bottomAnchor.constraint(equalTo: trianleView.topAnchor),
            
            trianleView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: tipLeftConstraint),
            trianleView.widthAnchor.constraint(equalToConstant: 20),
            trianleView.heightAnchor.constraint(equalToConstant: 20),
            trianleView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    private func removeAutoLayout() {
        containerView.removeConstraints(containerView.constraints)
    }
}

