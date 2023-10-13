//
//  AuthenticationScreen.swift
//  RewardzTest
//
//  Created by Softsuave on 12/10/2023.
//

import UIKit

class AuthenticationScreen: UIView {
    //MARK: - IBOutlets
    @IBOutlet weak var startOrderingButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    
    //MARK: - Class func
    class func instanceFromNib() -> AuthenticationScreen {
        return UINib(nibName: "AuthenticationScreen", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! AuthenticationScreen
    }
}
