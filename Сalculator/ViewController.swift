//
//  ViewController.swift
//  Сalculator
//
//  Created by  aleksandr on 4.10.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    var numberFromScreen: Int = 0
    var firstNum: Int = 0
    var opertion: Int = 0
    var mathSign: Bool = false
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        }
        else {
            result.text = result.text! + String (sender.tag)
        }
        numberFromScreen = Int(result.text!)!
    }
    
    @IBAction func buttonsSign(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = Int(result.text!)!
            
            if sender.tag == 11 { // деление
                result.text = "÷"
            }
            else if sender.tag == 12 { // умножение
                result.text = "x"
            }
            else if sender.tag == 13 { // вычитание
                result.text = "-"
            }
            else if sender.tag == 14 { // добавление
                result.text = "+"
            }
            opertion = sender.tag
            mathSign = true
        }
        else if sender.tag == 15 { // посчитать
            if opertion == 11 {
                result.text = String (firstNum / numberFromScreen)
            }
            else if opertion == 12 {
                result.text = String (firstNum * numberFromScreen)
            }
            else if opertion == 13 {
                result.text = String (firstNum - numberFromScreen)
            }
            else if opertion == 14 {
                result.text = String (firstNum + numberFromScreen)
            }
        }
        else if sender.tag == 10 {
            result.text = "0"
            firstNum = 0
            numberFromScreen = 0
            opertion = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
   
    override func viewWillLayoutSubviews() {
        view.layoutIfNeeded()
        buttons.forEach {
            $0.layer.cornerRadius = $0.frame.height / 2
        }
    }

}

