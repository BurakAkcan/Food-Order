//
//  DishPortraitCollectionViewCell.swift
//  Food Order
//
//  Created by Burak AKCAN on 26.07.2022.
//

import UIKit
import Kingfisher

class DishPortraitCollectionViewCell: UICollectionViewCell {
    //MARK: View Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var disImageView: UIImageView!
    
    static let identifier = "DishPortraitCollectionViewCell"
    
   
    
    func setUp(dish:Dish){
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        disImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLabel.text = dish.formattedCalories
        
    }

}
