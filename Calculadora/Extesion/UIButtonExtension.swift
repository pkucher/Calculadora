//
//  UIButtonExtension.swift
//  Calculadora
//
//  Created by brq on 13/09/2018.
//  Copyright © 2018 brq. All rights reserved.
//

import UIKit

enum TypeButton{
    case number
    case `operator`
}


extension UIButton{
    
    func Costumize(target:Any?, title: String, type: TypeButton,selector: Selector ){
        
        switch type {
        case .number:
            self.setTitle( title, for: .normal)
            self.backgroundColor = UIColor(named: "Number")
            self.setTitleColor(.black, for: .normal)
        case .operator:
            self.setTitle( title, for: .normal)
            self.backgroundColor = .orange
            self.setTitleColor(.white, for: .normal)
        default:
            break
        }
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.black.cgColor
        
        self.addTarget(target, action: selector, for: .touchUpInside)
        
    }
}
