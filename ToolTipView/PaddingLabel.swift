//
//  PaddingLabel.swift
//  ToolTipView
//
//  Created by 오킹 on 2024/04/17.
//

import UIKit

@IBDesignable
final class PaddingLabel: UILabel {
    @IBInspectable var topInset: CGFloat = 8.0
    @IBInspectable var bottomInset: CGFloat = 8.0
    @IBInspectable var leftInset: CGFloat = 16.0
    @IBInspectable var rightInset: CGFloat = 16.0

    lazy private var padding: UIEdgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    

    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
        self.sizeToFit()
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right

        return contentSize
    }

    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - (padding.left + padding.right)
        }
    }
}
