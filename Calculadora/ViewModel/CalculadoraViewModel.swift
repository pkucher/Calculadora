//
//  CalculadoraViewModel.swift
//  Calculadora
//
//  Created by brq on 19/09/2018.
//  Copyright © 2018 brq. All rights reserved.
//

import Foundation

class CalculadoraViewModel{
    var model = Calculadora()
    var content = "0"
    
    func clear(){
        if  model.n2 == 0 {
            model.n1 = 0
        }else{
            model.n2 = 0
        }
        if model.result == 0{
            model.n1 = 0
        }
        model.result = 0
        content = "0"
    }
    
     func switchPositivNegative() -> String{
        if let change = Double(content) {
            if change < 0{
                content = "\(0  - change)"
            }else{
                content = "-\(change)"
            }
        }
        return content
    }
    
    func formatter() -> String{
        if content.contains(","){
            content = content.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
        }
        if let value = Double(content){
            let formatter = NumberFormatter()
            formatter.usesGroupingSeparator = true
            formatter.numberStyle = .decimal
            formatter.locale = Locale.current
            print(Utils.share.limitContent(value:formatter.string(from: NSNumber(value:value)) ?? "0"))
            let a = Utils.share.limitContent(value:formatter.string(from: NSNumber(value:value)) ?? "0")
            content = a
            return formatter.string(from: NSNumber(value:value)) ?? "0"
        }else{
            return "0"
        }
    }
    
    func contentReplace(_ data: String){
        content = data.replacingOccurrences(of: ".", with: "")
        content = content.replacingOccurrences(of: ",", with: ".")
        if model.n1 == 0{
            model.n1 = Double(content)!
        }else if model.n2 == 0{
           model.n2 = Double(content.replacingOccurrences(of: ",", with: ".", options: .literal, range:nil))!
        }
    }
    
     func operators(_ sender :String?){
        if model.n1 == 0{
        contentReplace(content)
        }
        if let op = sender{
            switch op {
            case "+":
                model.op = "+"
            case "-":
                model.op = "-"
            case "/":
                model.op = "/"
            case "*":
                model.op = "*"
            default:
                break;
            }
        }
        content = ""
    }
    var percent = 0.0
    var number2 = ""
    
    func percentCalc() -> String{
        if model.n2 == 0{
            model.n1 = (model.n1/100)
            return "\(model.n1)"
       }else{
            model.n2 = model.n1 * (model.n2/100)
            return "\(model.n2)"
        }
    }
    
    func showResult() -> String{
        if model.op != ""{
            if content == ""{
                content = "\(model.n1)"
            }
            if model.n2 == 0 {
                number2.append(content)
                model.n2 = Double(number2)!
            }
                switch model.op {
                case "+":
                    model.result = model.n1 + model.n2
                case "-":
                    model.result =  model.n1 - model.n2
                case "/":
                    model.result = model.n1 / model.n2
                case "*":
                    model.result = model.n1 * model.n2
                default:
                    break
                }
            model.n1 = model.result
            content = String(model.result)
                return formatter()
        }else{
            return "\(model.n1)"
        }
    }
}
