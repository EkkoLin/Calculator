//
//  ViewController.swift
//  Calculator
//
//  Created by Ekko Lin on 3/25/17.
//  Copyright © 2017 CodePath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userIsTyping: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle
        let textCurrentlyInDisplay = display.text!
        display.text = textCurrentlyInDisplay + digit!
        if userIsTyping {
            let textCurrentlyDisplay = display.text!
        } else {
            display!.text = digit
            userIsTyping = true
        }
    }
    
    // Initialize displayValue
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String()
        }
    }
    
    // Initialize CalculatorBrain
    private var brain: CalculatorBrain = CalculatorBrain()
    
    // Perform operation for math symbols
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsTyping {
            brain.setOperand(displayValue)
            userIsTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }
    
}

