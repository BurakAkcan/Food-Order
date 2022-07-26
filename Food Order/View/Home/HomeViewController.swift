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
        Dish(id: "id2", description: "Chef", name: "Soup", image: "https://picsum.photos/100/100", calories: 2.380),
        Dish(id: "id3", description: "Drink", name: "Ayran", image: "https://picsum.photos/100/100", calories: 0.400),
        Dish(id: "id4", description: "Branch", name: "Honey", image: "https://picsum.photos/100/100", calories: 0.800)
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        registerCell()
       

    }
    
    //Register CollectionViewCell
    private func registerCell(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
    }
    
}

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
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
        default:
            return UICollectionViewCell()
        }
        
        
        
    }
    
    
}

