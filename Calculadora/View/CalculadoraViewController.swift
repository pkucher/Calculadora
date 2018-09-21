//
//  CalculadoraViewController.swift
//  Calculadora
//
//  Created by brq on 12/09/2018.
//  Copyright © 2018 brq. All rights reserved.
//

import UIKit

class CalculadoraViewController: UIViewController {
    
    
    let tf =  UITextField()
    let bt0 = UIButton(type: .system)
    let bt1 = UIButton(type: .system)
    let bt2 = UIButton(type: .system)
    let bt3 = UIButton(type: .system)
    let bt4 = UIButton(type: .system)
    let bt5 = UIButton(type: .system)
    let bt6 = UIButton(type: .system)
    let bt7 = UIButton(type: .system)
    let bt8 = UIButton(type: .system)
    let bt9 = UIButton(type: .system)
    let multiplicador = UIButton(type: .system)
    let divisor = UIButton(type: .system)
    let somar = UIButton(type: .system)
    let subtrair = UIButton(type: .system)
    let limpar = UIButton(type: .system)
    let positAndNegativ  = UIButton(type: .system)
    let point = UIButton(type: .system)
    var result = UIButton(type: .system)
    let percent = UIButton(type: .system)
    var viewModel = CalculadoraViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubView()
        setupUI()
        Constrains()
    }
    
    func addSubView(){
        view.addsubviews(
            [
                tf,
                bt0,
                bt1,
                bt2,
                bt3,
                bt4,
                bt5,
                bt6,
                bt7,
                bt8,
                bt9,
                limpar,
                positAndNegativ,
                percent,
                point,
                somar,
                subtrair,
                divisor,
                multiplicador,
                result
            ]
        )
    }
    

    
//    func Formatter(_ lb: UILabel?){
//        if var label = lb?.text{
//            if (label.count % 3 == 0){
//                label.append(".")
//            }
//        }
//    }
    
    func setupUI(){
        view.backgroundColor = .black
        tf.text = "0"
        tf.font = UIFont.boldSystemFont(ofSize: 40)
        tf.textColor = .white
        tf.textAlignment = .right
        
        bt0.Costumize(target: self, title: "0",type: .number, selector: #selector(click))
        
        bt1.Costumize(target: self,title: "1",type: .number, selector: #selector(click))
        
        bt2.Costumize(target: self,title: "2",type: .number, selector: #selector(click))
        
        bt3.Costumize(target: self,title: "3",type: .number, selector: #selector(click))
        
        bt4.Costumize(target: self,title: "4",type: .number, selector: #selector(click))
        
        bt5.Costumize(target: self,title: "5",type: .number, selector: #selector(click))
        
        bt6.Costumize(target: self,title: "6",type: .number, selector: #selector(click))
        
        bt7.Costumize(target: self,title: "7",type: .number, selector: #selector(click))
        
        bt8.Costumize(target: self,title: "8",type: .number, selector: #selector(click))
        
        bt9.Costumize(target: self,title: "9",type: .number, selector: #selector(click))
        
        limpar.Costumize(target: self,title: "AC",type: .number, selector: #selector(clear))
        
        somar.Costumize(target: self,title: "+",type: .operator, selector: #selector(operators(_:)))
        
        subtrair.Costumize(target: self,title: "-",type: .operator,selector: #selector(operators(_:)))
        
        result.Costumize(target: self,title: "=",type: .operator,selector: #selector(showResult))
        
        multiplicador.Costumize(target: self,title: "*",type: .operator,selector: #selector(operators(_:)))
        
        divisor.Costumize(target: self,title: "/",type: .operator, selector: #selector(operators(_:)))
        
        point.Costumize(target: self,title: ",",type: .number,selector: #selector(click))
        
        positAndNegativ.Costumize(target: self,title: "+/-",type: .number, selector: #selector(switchPositivNegative))
        
        percent.Costumize(target: self,title: "%",type: .number, selector: #selector(percentCalc))
    }
    
    @objc func click(_ sender:UIButton){
        viewModel.content.append(sender.currentTitle!)
        tf.text = viewModel.formatter()
    }
    
    @objc func operators(_ sender:UIButton){
        viewModel.operators(sender.currentTitle)
    }
    
    @objc func percentCalc(){
        viewModel.contentReplace(tf.text ?? "0")
        tf.text = viewModel.percentCalc()
    }
   
    @objc func switchPositivNegative(){
        tf.text = viewModel.switchPositivNegative()
    }
    
    @objc func clear(){
        viewModel.clear()
        tf.text = "0"
    }
    
    @objc func showResult(){
        tf.text = viewModel.showResult()
    }
    
    func Constrains() {
        tf.anchor(
            top: (view.topAnchor, 0),
            left: (view.leftAnchor, 15),
            right: (view.rightAnchor, 15)
        )
        
        limpar.anchor(
            top: (tf.bottomAnchor, 0),
            left: (view.leftAnchor, 0),
            width: view.frame.size.width / 4 ,
            height: view.frame.size.width / 5
        )
        
        bt7.anchor(
            top: (limpar.bottomAnchor, 0),
            left: (view.leftAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        bt4.anchor(
            top: (bt7.bottomAnchor, 0),
            left: (view.leftAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        bt1.anchor(
            top: (bt4.bottomAnchor, 0),
            left: (view.leftAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        bt0.anchor(
            top: (bt1.bottomAnchor, 0),
            left: (view.leftAnchor, 0),
            bottom: (view.bottomAnchor, 0),
            width: view.frame.size.width / 2,
            height: view.frame.size.width / 5
        )
        
        positAndNegativ.anchor(
            top: (tf.bottomAnchor, 0),
            left: (limpar.rightAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        bt8.anchor(
            top: (positAndNegativ.bottomAnchor, 0),
            left: (bt7.rightAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        bt5.anchor(
            top: (bt8.bottomAnchor, 0),
            left: (bt4.rightAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        bt2.anchor(
            top: (bt5.bottomAnchor, 0),
            left: (bt1.rightAnchor, 0),
            bottom: (bt0.topAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        percent.anchor(
            top: (tf.bottomAnchor, 0),
            left: (positAndNegativ.rightAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        bt9.anchor(
            top: (percent.bottomAnchor, 0),
            left: (bt8.rightAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        bt6.anchor(
            top: (bt9.bottomAnchor, 0),
            left: (bt5.rightAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        bt3.anchor(
            top: (bt6.bottomAnchor, 0),
            left: (bt2.rightAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        point.anchor(
            top: (bt3.bottomAnchor, 0),
            left: (bt0.rightAnchor, 0),
            bottom: (view.bottomAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        divisor.anchor(
            top: (tf.bottomAnchor, 0),
            left: (percent.rightAnchor, 0),
            right: (view.rightAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        multiplicador.anchor(
            top: (divisor.bottomAnchor ,0),
            left: (bt9.rightAnchor, 0),
            right: (view.rightAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        subtrair.anchor(
            top: (multiplicador.bottomAnchor, 0),
            left: (bt6.rightAnchor, 0),
            right: (view.rightAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        somar.anchor(
            top: (subtrair.bottomAnchor, 0),
            left: (bt3.rightAnchor, 0),
            right: (view.rightAnchor, 0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
        
        result.anchor(
            top: (somar.bottomAnchor, 0),
            left: (point.rightAnchor, 0),
            right: (view.rightAnchor, 0),
            bottom: (view.bottomAnchor,0),
            width: view.frame.size.width / 4,
            height: view.frame.size.width / 5
        )
    }
}
