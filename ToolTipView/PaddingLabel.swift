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

    // PaddingLabel 텍스트의 크기 설정
    override func drawText(in rect: CGRect) {
        let padding = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: padding))
    }
    
    // PaddingLabel의 본질적인 크기 설정
    override var intrinsicContentSize: CGSize {
        let padding = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        var contentSize = super.intrinsicContentSize
        contentSize.width += padding.left + padding.right
        contentSize.height += padding.top + padding.bottom
        
        return contentSize
    }

    
//    // PaddingLabel의 bounds가 바뀔 때 마다 preferredMaxLayoutWidth를 변경해주기 위함
//    override var bounds: CGRect {
//        didSet {
//            let padding = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
//            // 멀티 라인 라벨에서 다음 줄로 넘어갈 때 권장되는 최대 너비(포인트)
//            preferredMaxLayoutWidth = bounds.width - (padding.left + padding.right)
//        }
//    }
}
