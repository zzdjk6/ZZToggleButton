//
//  SwiftViewController.swift
//  ZZToggleButton-Example
//
//  Created by 陈圣晗 on 15/12/26.
//  Copyright © 2015年 Shenghan Chen. All rights reserved.
//

import UIKit

class SwiftViewController: UIViewController {
    
    @IBOutlet weak var toggleButton: ZZToggleButton!
    @IBOutlet weak var stateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weak var weakBtn = self.toggleButton
        self.toggleButton.onToggle = { (isOn:Bool) in
            let strongBtn = weakBtn
            let stateString = isOn ? "State: ON" : "State: OFF"
            self.stateLabel.text = stateString
            print("\(strongBtn) \(stateString)")
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.toggleButton.toggle()
    }
}
