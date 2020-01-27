//
//  SettingsViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Edward O'Neill on 1/27/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsTitle: UILabel!
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeStepper: UIStepper!
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    var currnetSize: CGFloat = 0
    var delegate: TextFontSizeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func changedWithSlider(_ sender: UISlider) {
        currnetSize = CGFloat(sender.value)
        fontSizeStepper.value = Double(sender.value)
        fontSizeLabel.text = String(format: "Font Size: %.1f", sender.value)
        delegate?.updateFontSize(size: currnetSize)
    }
    
    @IBAction func changedWithStepper(_ sender: UIStepper) {
        currnetSize = CGFloat(sender.value)
        fontSizeSlider.value = Float(sender.value)
        fontSizeLabel.text = String(format: "Font Size: %.1f", sender.value)
        delegate?.updateFontSize(size: currnetSize)
    }
    

}


