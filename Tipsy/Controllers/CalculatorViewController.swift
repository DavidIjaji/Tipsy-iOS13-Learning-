//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButtton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    var splitNumberSelected:Int?
    var tipValue:Float?
    var result:Float?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButtton.isSelected = false
        sender.isSelected = true
        tipValue = percentToDecimal(percent: sender.titleLabel?.text ?? "0.0")
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        splitNumberSelected = Int(sender.value)
    }
    

    @IBAction func calculatePressed(_ sender: UIButton) {
        print(billTextField.text ?? "")
        print(splitNumberSelected ?? "")
        if(billTextField.text != nil && billTextField.text != nil && tipValue != nil){
            calculateResult(splitNumber: splitNumberSelected!, totalBill: Float(billTextField.text!)!, tip: tipValue!)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        
        
    }
    
    func percentToDecimal(percent:String) -> Float {
        var str = percent
        str.removeLast(1)
        return (Float(str) ?? 0)/Float(100)
    }
    
    func calculateResult(splitNumber:Int, totalBill:Float,tip:Float) ->Void {
        let total = totalBill * (1 + tip)
        result = total/Float(splitNumber)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult"){
            let resultVC = segue.destination as! ResultsViewController
            if(tipValue != nil && splitNumberSelected != nil && result != nil){
                resultVC.result = result
                resultVC.tip = Int(tipValue!*100)
                resultVC.people =  splitNumberSelected
            }
            
        }
    }
    

}

