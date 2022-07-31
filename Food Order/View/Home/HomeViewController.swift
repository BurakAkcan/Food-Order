//
//  HomeViewController.swift
//  Food Order
//
//  Created by Burak AKCAN on 23.07.2022.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: -Views
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var specialCollectionView: UICollectionView!
    
    //MARK: Properties
    var categories:[DishCategory] = [
       
        DishCategory(id: "id1", name: "Indian Dish", image: "https://picsum.photos/100/100"),
        DishCategory(id: "id2", name: "Turkish Dish", image: "https://picsum.photos/100/100"),
        DishCategory(id: "id3", name: "Iran Dish", image: "https://picsum.photos/100/100"),
        DishCategory(id: "id4", name: "Greek Dish", image: "https://picsum.photos/100/100"),
        DishCategory(id: "id5", name: "Mexico Dish", image: "https://picsum.photos/100/100")
        ]
    
    var populars:[Dish] = [
        
        Dish(id: "id1", description: "Food", name: "Kebab", image: "https://picsum.photos/100/100", calories: 1.245),
        Dish(id: "id2", description: "This is best food for dinner This is best food for dinner This is best food for dinner This is best food for dinner This is best food for dinner", name: "Soup", image: "https://picsum.photos/100/100", calories: 2.380),
        Dish(id: "id3", description: "Drink", name: "Ayran", image: "https://picsum.photos/100/100", calories: 0.400),
        Dish(id: "id4", description: "Branch", name: "Honey", image: "https://picsum.photos/100/100", calories: 0.800)
        
    ]
    
    var specials:[Dish] = [
        Dish(id: "1", description: "perfect food", name: "Chef Special", image: "https://picsum.photos/100/100", calories: 1.234),
        Dish(id: "2", description: "not good food", name: "Chef Nigt Meat", image: "https://picsum.photos/100/100", calories: 2.200),
        Dish(id: "3", description: "good food", name: "Chefs vegetarian", image: "https://picsum.photos/100/100", calories: 0.450),
        Dish(id: "4", description: "bad food", name: "Chefs fish in fire", image: "https://picsum.photos/100/100", calories: 1.440),
        Dish(id: "5", description: "not bad food", name: "Chefs Turkey", image: "https://picsum.photos/100/100", calories: 1.800)
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        registerCell()
        
        let service = NetworkService()
        
        let request = service.createRequest(route: .temp, method: .post, parameter: ["firtname":"burak","lastname":"Akcan"])
        print(request!.url!)
        print(request?.httpBody)
       

    }
    
    //Register CollectionViewCell
    private func registerCell(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        specialCollectionView.register(UINib(nibName: DishLandCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandCollectionViewCell.identifier)
        
    }
    
}

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialCollectionView:
            return specials.count
        default:
            return 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            let item = categories[indexPath.row]
            cell.setUp(category: item)
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            let item = populars[indexPath.row]
            cell.setUp(dish: item)
            return cell
        case specialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandCollectionViewCell.identifier, for: indexPath) as! DishLandCollectionViewCell
            let item = specials[indexPath.row]
            cell.setUp(dish: item)
            return cell
        default:
            return UICollectionViewCell()
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }else{
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
}

