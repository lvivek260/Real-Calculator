//
//  ViewController.swift
//  BasicCalculator
//
//  Created by Admin on 23/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var EnterLbl: UILabel!
    var allowDot:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLbl.text = "0"
        EnterLbl.text = ""
    }
    
    @IBAction func allClearBtnClick(_ sender: UIButton) {
        resultLbl.text = ""
        EnterLbl.text = ""
        allowDot = true
    }
    @IBAction func oneCharRemove(_ sender: UIButton) {
        if(EnterLbl.text!.isEmpty){
            EnterLbl.text = ""
            allowDot = true
        }else{
            if(EnterLbl.text!.last == "."){
                allowDot = true
            }
            EnterLbl.text?.removeLast()
        }
    }
    
    @IBAction func percentage(_ sender: UIButton) {
        if(EnterLbl.text?.last != "*" && EnterLbl.text?.last != "/" && EnterLbl.text?.last != "+" && EnterLbl.text?.last != "-" && EnterLbl.text?.last != "%" && EnterLbl.text?.last != "."&&EnterLbl.text!.isEmpty==false){
            EnterLbl.text?.append("%")
            allowDot = true
        }else{}
    }
    
    
    @IBAction func division(_ sender: UIButton) {
        if(EnterLbl.text?.last != "*" && EnterLbl.text?.last != "/" && EnterLbl.text?.last != "+" && EnterLbl.text?.last != "-" && EnterLbl.text?.last != "%" && EnterLbl.text?.last != "."&&EnterLbl.text!.isEmpty==false){
            EnterLbl.text?.append("/")
            allowDot = true
        }else{}
    }
    
    @IBAction func multiplication(_ sender: UIButton) {
        if(EnterLbl.text?.last != "*" && EnterLbl.text?.last != "/" && EnterLbl.text?.last != "+" && EnterLbl.text?.last != "-" && EnterLbl.text?.last != "%" && EnterLbl.text?.last != "."&&EnterLbl.text!.isEmpty==false){
            EnterLbl.text?.append("*")
            allowDot = true
        }else{}
    }
    
    @IBAction func addition(_ sender: UIButton) {
        if(EnterLbl.text?.last != "*" && EnterLbl.text?.last != "/" && EnterLbl.text?.last != "+" && EnterLbl.text?.last != "-" && EnterLbl.text?.last != "%" && EnterLbl.text?.last != "."&&EnterLbl.text!.isEmpty==false){
            EnterLbl.text?.append("+")
            allowDot = true
        }else{}
    }
    
    @IBAction func subtraction(_ sender: UIButton) {
        if(EnterLbl.text?.last != "+" && EnterLbl.text?.last != "-"&&EnterLbl.text?.last != "%" && EnterLbl.text?.last != "."){
            EnterLbl.text?.append("-")
            allowDot = true
        }else{}
    }
    
    @IBAction func equelBtnClick(_ sender: UIButton) {
        if(EnterLbl.text == "0" || EnterLbl.text!.isEmpty){
            resultLbl.text = "0"
        }
        else{
            if(EnterLbl.text?.last == "%" || EnterLbl.text?.last == "+" || EnterLbl.text?.last == "-" || EnterLbl.text?.last == "/" || EnterLbl.text?.last == "." || EnterLbl.text?.last == "*"){
                EnterLbl.text?.removeLast()
            }
            let percentagechack = EnterLbl.text!.replacingOccurrences(of: "%", with: "*0.01*")
            let expression = NSExpression(format:percentagechack)
            let value = expression.expressionValue(with: nil, context: nil) as? Double
            if value?.truncatingRemainder(dividingBy: 1) == 0{
                resultLbl.text = String(format: "%.0f", value!)
            }else{
                var result = String(format: "%.4f", value!)
                if(result.last == "0"){
                    result = String(format: "%.3f", value!)
                    if(result.last == "0"){
                        result = String(format: "%.2f", value!)
                    }
                }
                resultLbl.text = result
            }
        }
    }
     @IBAction func dotBtn(_ sender: UIButton) {
         if(EnterLbl.text!.isEmpty){}
         else{
             if(EnterLbl.text?.last == "%" || EnterLbl.text?.last == "+" || EnterLbl.text?.last == "-" || EnterLbl.text?.last == "/" || EnterLbl.text?.last == "." || EnterLbl.text?.last == "*"){
             }
             else{
                 if(checkSpecialCharcter()){
                     EnterLbl.text?.append(contentsOf: ".")
                 }else{}
             }
         }
 }
    func  checkSpecialCharcter()->Bool{
        if(allowDot){
            allowDot = false
            return true
        }
        else{
            return false
        }
    }
        
    @IBAction  func zero(_ sender: UIButton) {
            EnterLbl.text?.append("0")
        }
        
        @IBAction func one(_ sender: UIButton) {
            EnterLbl.text?.append("1")
        }
        
        @IBAction func two(_ sender: UIButton) {
            EnterLbl.text?.append("2")
        }
        
        @IBAction  func three(_ sender: UIButton) {
            EnterLbl.text?.append("3")
        }
        
        @IBAction func four(_ sender: UIButton) {
            EnterLbl.text?.append("4")
        }
        
        @IBAction  func five(_ sender: UIButton) {
            EnterLbl.text?.append("5")
        }
        
        @IBAction  func six(_ sender: UIButton) {
            EnterLbl.text?.append("6")
        }
        
        @IBAction  func seven(_ sender: UIButton) {
            EnterLbl.text?.append("7")
        }
        
        @IBAction  func eight(_ sender: UIButton) {
            EnterLbl.text?.append("8")
        }
        
        @IBAction   func nine(_ sender: UIButton) {
            EnterLbl.text?.append("9")
        }
        
    }
    

