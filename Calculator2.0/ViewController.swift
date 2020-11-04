//
//  ViewController.swift
//  Calculator2.0
//
//  Created by Filipp Krupnov on 10/16/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping{
            let textCurrentlyInDisplay = display!.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            userIsInTheMiddleOfTyping = true
            display.text = digit
        }
    }
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var idea = CalcWork()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            idea.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            idea.performOperation(mathematicalSymbol)
        }
        if let result = idea.result {
            displayValue = result
        }
    }
    
    @IBAction func returnToZero(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        display.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let calcView = CalcView()
        view.addSubview(calcView)
        let calcViewConstraints = [
            calcView.topAnchor.constraint(equalTo: view.topAnchor),
            calcView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            calcView.leftAnchor.constraint(equalTo: view.leftAnchor),
            calcView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        NSLayoutConstraint.activate(calcViewConstraints)
        
    }


}
