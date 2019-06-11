//
//  ViewController.swift
//  BMI
//
//  Created by 永野誉也 on 2019/06/07.
//  Copyright © 2019 永野誉也. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var basalMetabolism: UILabel!
    @IBOutlet weak var calorie: UILabel!
    @IBOutlet weak var carbohydrate: UILabel!
    @IBOutlet weak var protein: UILabel!
    @IBOutlet weak var lipid: UILabel!
    @IBOutlet weak var overweight_degrees: UILabel!
    
    @IBAction func result(_ sender: UIButton) {
        let doubleH = Double(height.text!)
        let doubleW = Double(weight.text!)
        let intAge = Int(age.text!)
        bmi.text = calcBmi(doubleH!, doubleW!)
        let metabo = calcBasalMetabo(doubleH!, doubleW!, intAge!)
        let dairyCalorie = calcCalorie(metabo)
        basalMetabolism.text = metabo.description
        calorie.text = dairyCalorie.description
        carbohydrate.text = calcCarbohydrate(dairyCalorie)
        protein.text = calcProtein(doubleH!, doubleW!)
        lipid.text = calcLipid(dairyCalorie)

    }
    
    
    var sex:Int!
    @IBAction func male(_ sender: Any) {
        sex = 1
    }
    @IBAction func female(_ sender: Any) {
        sex = 2
    }
    private func calcBmi(_ hight: Double,_ weight: Double) -> String {
        
        let h = hight / 100
        let w = weight
        
        var result = w / ( h * h )
        
        result = floor(result*10) / 10
        
        return result.description
        
    }
    
    
    private func calcBasalMetabo(_ hight: Double,_ weight: Double,_ age: Int) -> Double{
        
        var x: Double!
        var y: Double!
        var z: Double!
        var k: Double!
        let doubleAge = Double(age.description)
        
        if sex == 1 {
            x = 66
            y = 13.7
            z = 5.0
            k = 6.8
            
        } else if sex == 2 {
            x = 665
            y = 9.6
            z = 1.7
            k = 7.0
        } else {
            x = 1
            y = 1
            z = 1
            k = 1
        }
        
        let w = (y * weight)
        let h = (z * hight)
        let a = (k * doubleAge!)
        
        let result = x + w + h - a
        
        return result
        
    }
    
    private func calcCalorie(_ metabo: Double) -> Double {
        
        var result = metabo * 1.5
        
        result = floor(result*10) / 10
        
        return result
    }
    
    private func calcCarbohydrate(_ calorie: Double) -> String {
        
        let x = 50 * calorie
        
        var result = x / 400
        
        result = floor(result*10) / 10
        
        return result.description
    }
    
    private func calcProtein(_ hight: Double,_ weight: Double) -> String {
        
        return "50"
    }

    private func calcLipid(_ calorie: Double) -> String {
        
        let x = 20 * calorie
        
        var result = x / 900
        
        result = floor(result*10) / 10
        
        return result.description
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        func viewDidLoad() {
        super.viewDidLoad()
            self.height.keyboardType = UIKeyboardType.numberPad
            self.weight.keyboardType = UIKeyboardType.numberPad
            self.age.keyboardType = UIKeyboardType.numberPad
            sex = 0
            bmi.text = ""
            basalMetabolism.text = ""
            calorie.text = ""
            carbohydrate.text = ""
            protein.text = ""
            lipid.text = ""
            overweight_degrees.text = ""
            
        // Do any additional setup after loading the view.
     }
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

   }

}
