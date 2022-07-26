//
//  CategoryCollectionViewCell.swift
//  Food Order
//
//  Created by Burak AKCAN on 23.07.2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    func setUp(category:DishCategory){
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
        
    }
    
    
}
