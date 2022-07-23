//
//  OnbardingCollectionViewCell.swift
//  Food Order
//
//  Created by Burak AKCAN on 23.07.2022.
//

import UIKit

class OnbardingCollectionViewCell: UICollectionViewCell {
    
  
    
    //MARK: -Views Properties
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    
    
    override func awakeFromNib() {
        self.titleLabel.layer.shadowOpacity = 0.01
    }
    
    
    
    //MARK: -Setup View
   func setUp(slide:OnboardingSlide){
        slideImageView.image = slide.image
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
    }
    
}
