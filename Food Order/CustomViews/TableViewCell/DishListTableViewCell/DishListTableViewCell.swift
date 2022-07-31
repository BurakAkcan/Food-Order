//
//  DishListTableViewCell.swift
//  Food Order
//
//  Created by Burak AKCAN on 29.07.2022.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var dishTitleLabel: UILabel!
    
    @IBOutlet weak var dishDecriptionLabel: UILabel!
    
    static let identifier = "DishListTableViewCell"
    
    func setUp(dish:Dish){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        dishTitleLabel.text = dish.name
        dishDecriptionLabel.text = dish.description
        
    }
    
    func setUpOrder(order:Order){
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        dishTitleLabel.text = order.dish?.name
        dishDecriptionLabel.text = order.name
    }
}
