//
//  ViewController.swift
//  RewardzTest
//
//  Created by Softsuave on 11/10/2023.
//

import UIKit

class InitialViewController: UIViewController {
//MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInitialView()
    }
    
    //MARK: - Objec action func func
    @objc func actionOnLetsConnect() {
        let vc = AuthenticationViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    //MARK: - Other func
    /// SEtting up initial view
    func setUpInitialView() {
        let newView = FirstIntroScreen.instanceFromNib()
        newView.frame = self.view.frame
        newView.letsContinueButton.addTarget(self, action: #selector(actionOnLetsConnect), for: .touchUpInside)
        self.view.addSubview(newView)
        
    }
   

}

