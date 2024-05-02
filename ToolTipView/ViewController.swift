//
//  ViewController.swift
//  ToolTipView
//
//  Created by 오킹 on 2024/04/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toolTipView: ToolTipView!

    override func viewDidLoad() {
        super.viewDidLoad()
        toolTipView.tipYPosition = .top
        toolTipView.backgroundColor = .black
    }
    
    @IBAction func updateTipPosition(_ sender: Any) {
        if toolTipView.tipYPosition == .top {
            toolTipView.tipYPosition = .bottom
        } else {
            toolTipView.tipYPosition = .top
        }
    }
}
