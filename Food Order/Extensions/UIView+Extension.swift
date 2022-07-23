//
//  UIView+Extension.swift
//  Food Order
//
//  Created by Burak AKCAN on 23.07.2022.
//

import UIKit

extension UIView{
   @IBInspectable var cornerRadius:CGFloat{
        get{
            return self.cornerRadius
        }
        
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
