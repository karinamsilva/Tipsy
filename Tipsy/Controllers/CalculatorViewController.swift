//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var result = ResultsViewController()

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctbutton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    var tip = 0.10
    var numberOfPeople = 2
    var value = 0.0
    var total = 0.0
    @IBAction func tipChanged(_ sender: UIButton) {
       
            zeroPctButton.isSelected = false
            tenPctbutton.isSelected = false
            twentyPctButton.isSelected = false
        
           sender.isSelected = true
           guard let name = sender.currentTitle else {return }
           let buttonName = String(name.dropLast())
           guard let number = Double(buttonName) else {return}
           tip = number / 100

           guard let newValue = billTextField.text else { return }
           guard let values = Double(newValue) else { return }
           value = values
           billTextField.endEditing(true)
 
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
             total = (value + (value * tip) ) / Double(numberOfPeople)
            
        
    self.performSegue(withIdentifier: "goToResults", sender: self)
}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destination = segue.destination as! ResultsViewController
            
            destination.result = String(format: "%.2f", total)
            destination.tip = Int(tip * 100)
            destination.split = numberOfPeople
        }
}

}

