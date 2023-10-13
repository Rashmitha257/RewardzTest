//
//  HomeScreenViewModel.swift
//  RewardzTest
//
//  Created by Softsuave on 12/10/2023.
//

import Foundation
class HomeScreenViewModel {
    //MARK: - Variables
    var foodMenuList: (([MenuData]) -> Void)?
    
    //MARK: - Other func
    
    /// Getting menu list from json
    func getFoodMenu() {
        NetworkManager.networkInstance.getAllFoodList { result, error in
            if let result = result {
                foodMenuList?(result)
            }
        }
    }
}
