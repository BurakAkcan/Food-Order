//
//  ListOrdersViewController.swift
//  Food Order
//
//  Created by Burak AKCAN on 30.07.2022.
//

import UIKit

class ListOrdersViewController: UIViewController {
    
    var orders:[Order] = [
        Order(id: "1", name: "Ali", dish: Dish(id: "1", description: "perfect food", name: "Chef Special", image: "https://picsum.photos/100/100", calories: 1.234)),Order(id: "1", name: "Kebab", dish: Dish(id: "1", description: "perfect food", name: "Chef Special", image: "https://picsum.photos/100/100", calories: 1.234)),
        Order(id: "2", name: "Veli", dish: Dish(id: "2", description: "Baklava", name: "Tatlı", image: "https://picsum.photos/100/100", calories: 2.200)),
        Order(id: "3", name: "Mehmet", dish: Dish(id: "3", description: " drink", name: "Chef Drink", image: "https://picsum.photos/100/100", calories: 0.300))
    ]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCell()

    }
    
    private func registerCell(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
   
}
extension ListOrdersViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        let order = orders[indexPath.row]
        cell.setUpOrder(order: order)
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
