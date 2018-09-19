//
//  UIStackViewExtension.swift
//  Calculadora
//
//  Created by brq on 13/09/2018.
//  Copyright © 2018 brq. All rights reserved.
//

import UIKit


extension UIStackView{
    
    func Costumize(type: UILayoutConstraintAxis){
        
        self.axis = type
        self.distribution = UIStackViewDistribution.fillEqually
        self.alignment = .center
        self.spacing = 0.5
    }
}
