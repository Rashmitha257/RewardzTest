//
//  HomeScreen.swift
//  RewardzTest
//
//  Created by Softsuave on 12/10/2023.
//

import UIKit

class HomeScreen: UIView {
    //MARK: - IBoutlets
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: - Calss func
    class func instanceFromNib() -> HomeScreen {
        return UINib(nibName: "HomeScreen", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! HomeScreen
    }

}
