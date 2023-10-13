//
//  HomeScreenViewController.swift
//  RewardzTest
//
//  Created by Softsuave on 12/10/2023.
//

import UIKit

class HomeScreenViewController: UIViewController {
    //MARK: - Variables
    let newView = HomeScreen.instanceFromNib()
    let firstCollectionView = RecommendedViewUI.instanceFromNib()
    let secondView = OtherCombos.instanceFromNib()
    var name: String = ""
    var viewModel = HomeScreenViewModel()
    var recommendedFood = [MenuData]()
    var otherFood = [MenuData]()
    
    //MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        updateFoodList()
        setUpInitialView()
        viewModel.getFoodMenu()
    }
    
    //MARK: - Other functions
    
    /// Initial view setup
    func setUpInitialView() {
        let newView = addTopView()
        let firstCollectionView = addFirstCollectionView(respectiveView: newView)
        addSecondCollectionView(respectiveView: firstCollectionView)
    }
    
    /// Adding top welcom view
    /// - Returns: Home screen UI
    func addTopView() -> HomeScreen {
        self.view.addSubview(newView)
        newView.setConstraints(mainView: self.view, respectiveView: self.view, height: 150)
        newView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        newView.nameLabel.text = "\(name), \(homeScreenWelcomeText)"
        return newView
    }
    
    
    /// Adding first collection view
    /// - Parameter respectiveView: respective view with with view has to set
    /// - Returns: fist collection view
    func addFirstCollectionView(respectiveView: UIView) -> RecommendedViewUI {
        setCollectionDelegate(collectionView:  firstCollectionView.recommendCollectionView)
        self.view.addSubview(firstCollectionView)
        firstCollectionView.setConstraints(mainView: self.view, respectiveView: respectiveView, height: 290)
        return firstCollectionView
    }
    
    /// Adding second collection view
    /// - Parameter respectiveView: respective view with with view has to set
    /// - Returns: second collection view
    func addSecondCollectionView(respectiveView: UIView) {
        setCollectionDelegate(collectionView:  secondView.otherCombosCollectionView)
        self.view.addSubview(secondView)
        secondView.setConstraints(mainView: self.view, respectiveView: respectiveView, height: 290)
    }
    
    /// Setting collection view delegates
    /// - Parameter collectionView: collection which we have to set delegate
    func setCollectionDelegate(collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: ImageDetailsCollectionViewCell.IDENTIFIER, bundle: nil), forCellWithReuseIdentifier: ImageDetailsCollectionViewCell.IDENTIFIER)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    /// updating food list after getting from json
    func updateFoodList() {
        viewModel.foodMenuList = {[weak self] list in
            self?.recommendedFood = list
            self?.otherFood = list
            self?.firstCollectionView.recommendCollectionView.reloadData()
            self?.secondView.otherCombosCollectionView.reloadData()
        }
    }

}
//MARK: - Collection view delegate and data source
extension HomeScreenViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == firstCollectionView.recommendCollectionView ? recommendedFood.count : otherFood.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageDetailsCollectionViewCell.IDENTIFIER, for: indexPath) as! ImageDetailsCollectionViewCell
        let isRecommened = collectionView == firstCollectionView.recommendCollectionView
        let item = isRecommened ? recommendedFood[indexPath.row] : otherFood[indexPath.row]
        cell.setCellvalues(menu: item, isRecommened: isRecommened)
        return cell
    }
    
}

extension HomeScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 250)
    }
}
