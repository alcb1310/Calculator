//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Andres Court on 25/7/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation


struct CalculatorLogic{
    private var number: Double?
//    private var intermediateCalculation: (calcMethod: String, n1: Double) = (calcMethod: "", n1: 0)
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double?{
        if let n = number {
            switch symbol{
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "AC":
                return 0
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double?{
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation{
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                if n2 == 0{
                    fatalError("Divider can not be zero")
                }
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        
        return nil
    }
}
