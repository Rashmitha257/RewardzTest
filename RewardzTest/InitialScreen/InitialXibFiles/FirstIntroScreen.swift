//
//  FirstIntroScreen.swift
//  RewardzTest
//
//  Created by Softsuave on 12/10/2023.
//

import UIKit



class FirstIntroScreen: UIView {
    
//    MARK: - IBOutlets
    @IBOutlet weak var letsContinueButton: UIButton!
    
    //MARK: - Class func
    class func instanceFromNib() -> FirstIntroScreen {
        return UINib(nibName: "FirstIntroScreen", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! FirstIntroScreen
        }
    
}
