//
//  DishDetailViewController.swift
//  Food Order
//
//  Created by Burak AKCAN on 29.07.2022.
//

import UIKit

class DishDetailViewController: UIViewController {
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishTitle: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    var dish:Dish?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()

    }
    
    private func populateView(){
        guard let dish = dish else {
            return
        }

        dishImageView.kf.setImage(with: dish.image?.asUrl)
        dishTitle.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
        
        
    }
    
    @IBAction func orderClick(_ sender: UIButton) {
    }
    
 

}
