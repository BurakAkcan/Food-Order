//
//  Dish.swift
//  Food Order
//
//  Created by Burak AKCAN on 26.07.2022.
//

import Foundation

struct Dish{
    let id:String?
    let description:String?
    let name:String?
    let image:String?
    let calories:Double?
    
    var formattedCalories:String{
        return String(format: "%.2f calories ", calories ?? 0)
    }
    
}
