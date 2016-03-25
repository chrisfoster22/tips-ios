//
//  ViewController.swift
//  tips
//
//  Created by Foster, Christopher S. (CONT) on 3/17/16.
//  Copyright (c) 2016 Foster, Christopher S. (CONT). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var splitValueLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var waysLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipPercentLabel.text = "18"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        splitValueLabel.text = "$0.00"
        messageLabel.text = "How much was your meal?"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: UISlider) {
        
        let tipPercentage = Double(round(1 * tipSlider.value) / 1) / 100
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        
        tipPercentLabel.text = String(Int(tipPercentage * 100))
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        if Float(tipPercentage) < 0.15 {
            messageLabel.text = "What happened?!"
        } else if Float(tipPercentage) > 0.19 && Float(tipPercentage) < 0.25 {
            messageLabel.text = "Wow, great tip!"
        } else if Float(tipPercentage) > 0.24 {
            messageLabel.text = "You are a very generous person!"
        }
        
        func onSliderChange(sender: UISlider) {
            let currentValue = Int(splitSlider.value)
            splitLabel.text = "\(currentValue)"
            let split = NSString(string: splitLabel.text!).doubleValue
            let splitValue = total / split
            splitValueLabel.text = String(format: "$%.2f", splitValue)
            
            waysLabel.text = (split > 1 ? "ways" : "way")
        }
        
        onSliderChange(splitSlider)
        
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }
    
}
    


