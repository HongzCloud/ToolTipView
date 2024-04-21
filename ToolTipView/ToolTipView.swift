//
//  ToolTipView.swift
//  ToolTipView
//
//  Created by 오킹 on 2024/04/17.
//

import UIKit

class ToolTipView: UIView {
    
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
    
    private let trianleView: TriangleView = {
        var view = TriangleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override var backgroundColor: UIColor? {
          get {
              return super.backgroundColor
          }
          set {
              paddingLabel.backgroundColor = newValue
              trianleView.backgroundColor = .clear
              trianleView.color = newValue ?? .white
          }
      }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.addSubview(containerView)
        containerView.addSubview(paddingLabel)
        containerView.addSubview(trianleView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            paddingLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            paddingLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            paddingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            paddingLabel.bottomAnchor.constraint(equalTo: trianleView.topAnchor),
            
            trianleView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            trianleView.widthAnchor.constraint(equalToConstant: 20),
            trianleView.heightAnchor.constraint(equalToConstant: 20),
            trianleView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
