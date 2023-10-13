//
//  NetworkManager.swift
//  RewardzTest
//
//  Created by Softsuave on 12/10/2023.
//

import Foundation
final class NetworkManager {
    static let networkInstance = NetworkManager()
    
    private init() {}
    
    
    func getJsonFile(filename fileName: String) -> [MenuData]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([MenuData].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func getAllFoodList(completionHandler: (_ result: [MenuData]?, _ error: String?) -> (Void)) {
        if let menuData = getJsonFile(filename: "FoodData") {
            completionHandler(menuData,nil)
        } else {
            completionHandler(nil, "Unable to fetch json file please try again or check")
        }
    }
    
    
    
}
