//
//  ViewController.swift
//  BMI_Ftm
//
//  Created by english on 2021-09-15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldCalculate: UIButton!
    
    @IBOutlet weak var textFieldHeight: UITextField!
    
    @IBOutlet weak var textFieldWeight: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
  
    @IBAction func txtWeightChanged(_ sender: Any) {
        lblResult.isHidden = true
    }
    
    @IBAction func txtHeightChanged(_ sender: Any) {
        lblResult.isHidden = true
    }
    
    @IBAction func btnCalculateClicked(_ sender: Any) {
        
        if !textFieldWeight.hasText || !textFieldHeight.hasText {
            Toast.ok(view: self, title: "Information", message: "Please enter your height and weight", handler: nil)
            return
        }
            
        if let height : String = textFieldHeight.text, let weight : String = textFieldWeight.text {
            if let heightInInt = Int(height), let weightInInt = Int(weight){
                
                if heightInInt > 250 || heightInInt < 80{
                    Toast.ok(view: self, title: "Review the height", message: "Please enter a height between 80 and 250", handler: nil)
                    textFieldHeight.text = ""
                    return;
                }
                if weightInInt > 300 || weightInInt < 30 {
                    Toast.ok(view: self, title: "Review the weight", message: "Please enter a weight between 30kg and 300kg", handler: nil)
                    textFieldWeight.text = ""
                    return
                }
                
                let heightInMeters = Double(heightInInt) / 100
                var bmi = Double(weightInInt) / (heightInMeters * heightInMeters)

                bmi = round(bmi * 10) / 10

                if (0..<18.5).contains(bmi) {
                    lblResult.text = "BMI classification = Underweight"
                    lblResult.backgroundColor = UIColor.systemBlue
                }else if (18.5...24.9).contains(bmi) {
                    lblResult.text = "BMI classification = Normal"
                    lblResult.backgroundColor = UIColor.systemGreen
                }else if (25...29.9).contains(bmi){
                    lblResult.text = "BMI classification = Overweight"
                    lblResult.backgroundColor = UIColor.systemYellow
                }else if (30...100).contains(bmi){
                    lblResult.text = "BMI classification = Obese"
                    lblResult.backgroundColor = UIColor.systemOrange
                }
                
                lblResult.isHidden = false
                textFieldHeight.text = ""
                textFieldWeight.text = ""
                
            } else {
                Toast.ok(view: self, title: "Information", message: "Please enter your height and weight as a number!", handler: nil)
                textFieldHeight.text = ""
                textFieldWeight.text = ""
                return
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.isHidden = true
        textFieldCalculate.layer.cornerRadius = 15
        
        textFieldHeight.layer.borderWidth = 1
        textFieldHeight.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        textFieldWeight.layer.borderWidth = 1
        textFieldHeight.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }

}

