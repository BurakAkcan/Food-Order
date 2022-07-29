//
//  DishLandCollectionViewCell.swift
//  Food Order
//
//  Created by Burak AKCAN on 27.07.2022.
//

import UIKit
import Kingfisher

class DishLandCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var disImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabl: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    static let identifier = String(describing: DishLandCollectionViewCell.self)
    
    func setUp(dish:Dish){
        disImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        descriptionLabl.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }

}
