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
        toolTipView.tipPosition = .top
        toolTipView.backgroundColor = .black
    }
    
    @IBAction func updateTipPosition(_ sender: Any) {
        if toolTipView.tipPosition == .top {
            toolTipView.tipPosition = .bottom
        } else {
            toolTipView.tipPosition = .top
        }
        
        toolTipView.tipLeftConstraint += 10
    }
}
