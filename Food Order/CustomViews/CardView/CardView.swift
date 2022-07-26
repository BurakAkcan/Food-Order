//
//  CardView.swift
//  Food Order
//
//  Created by Burak AKCAN on 24.07.2022.
//

import Foundation
import UIKit

class CardView:UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
       
    }
    
    private func initialSetup(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 12
        layer.shadowRadius = 12
        layer.shadowOpacity = 0.2
        cornerRadius = 12
        
    }
}



