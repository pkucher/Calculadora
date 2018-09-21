//
//  Utils.swift
//  Calculadora
//
//  Created by brq on 20/09/2018.
//  Copyright © 2018 brq. All rights reserved.
//

import UIKit

class Utils{
    static let share = Utils()
    
    private init(){}

    func limitContent(value:String) -> String{
        var newString = ""
        let valuemodif = value.replacingOccurrences(of: ".", with: "", options: .literal, range: nil)
        for c in valuemodif{
            if(newString.count == 11){
                return newString
            }else if(valuemodif.count == 13){
                newString = valuemodif
                for _ in 0...1{
                    newString.remove(at: .init(encodedOffset: 0))
                }
                return newString
            }else{
                newString.append(c)
            }
        }
        return newString
    }
}
