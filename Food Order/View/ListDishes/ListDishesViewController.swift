//
//  ListDishesViewController.swift
//  Food Order
//
//  Created by Burak AKCAN on 29.07.2022.
//

import UIKit

class ListDishesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var category:DishCategory!
    
    var dishes:[Dish] = [
        Dish(id: "id1", description: "Food", name: "Kebab", image: "https://picsum.photos/100/100", calories: 1.245),
        Dish(id: "id2", description: "This is best food for dinner This is best food for dinner This is best food for dinner This is best food for dinner This is best food for dinner", name: "Soup", image: "https://picsum.photos/100/100", calories: 2.380),
        Dish(id: "id3", description: "Drink", name: "Ayran", image: "https://picsum.photos/100/100", calories: 0.400),
        Dish(id: "id4", description: "Branch", name: "Honey", image: "https://picsum.photos/100/100", calories: 0.800)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        registerCells()

    }
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }


}

extension ListDishesViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        let dish = dishes[indexPath.row]
        cell.setUp(dish: dish)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
