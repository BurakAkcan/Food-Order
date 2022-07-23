//
//  OnboardingViewController.swift
//  Food Order
//
//  Created by Burak AKCAN on 23.07.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    //MARK: -View

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    
    
    //MARK: -Properties
    
    //Second open app skip onboarding screen
    let defaults = UserDefaults.standard
    var slides:[OnboardingSlide] = []
    var currentPage = 0  {
        didSet {
                pageControl.currentPage = currentPage
            if currentPage == slides.count - 1{
                nextButton.setTitle("Get Started", for: .normal)
            }else{
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup custom buttom
        nextButton.layer.shadowColor = UIColor.darkGray.cgColor
        nextButton.layer.shadowOffset = CGSize(width: 3, height: 4)
        nextButton.layer.shadowOpacity = 0.7
        
        
    //MARK: -Create Slides List
        slides = [
                    OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "ic_slide2")),
                    OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "ic_slide1")),
                    OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "ic_slide3"))
                ]
        pageControl.numberOfPages = slides.count
        
    }

    @IBAction func pageControlClick(_ sender: UIButton) {
        if currentPage  == slides.count - 1 {
            //Get started
            print("get start")
            defaults.set(true, forKey: "firstOpen")
            let controller = storyboard?.instantiateViewController(withIdentifier: "homeNC") as! UINavigationController
            controller.modalTransitionStyle = .flipHorizontal
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        }
    }
}

extension OnboardingViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let onboardingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingCell", for: indexPath) as! OnbardingCollectionViewCell
        let item = slides[indexPath.row]
        onboardingCell.setUp(slide: item)
        return onboardingCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    //When scroll has occure
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width
        //Yatayda hareket ettiği için contentOffset.x deriz
        currentPage = Int(scrollView.contentOffset.x/witdh)
       // print(scrollView.contentOffset.x)
       // print(scrollView.frame.width)
        print(currentPage)
        pageControl.currentPage = currentPage
    }
}
