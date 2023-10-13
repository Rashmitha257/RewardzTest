//
//  AuthenticationViewController.swift
//  RewardzTest
//
//  Created by Softsuave on 12/10/2023.
//

import UIKit

class AuthenticationViewController: UIViewController, UITextFieldDelegate {
    //MARK: - Variables
    var mainView = AuthenticationScreen.instanceFromNib()
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        setKeyBoardNotification()
        setUpInitialView()
    }
    
    //MARK: - Objc action func
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if mainView.nameField.isEditing  {
            moveViewWithKeyboard(notification: notification, keyboardWillShow: true)
        }
    }
       
    @objc func keyboardWillHide(_ notification: NSNotification) {
        moveViewWithKeyboard(notification: notification, keyboardWillShow: false)
    }
    
    @objc func actionOnLetsConnect() {
        let vc = HomeScreenViewController()
        guard let userName = mainView.nameField.text, !userName.isEmpty else {
            displayMyAlertMessage (alertMessage)
            return
        }
        vc.name = userName
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mainView.nameField.resignFirstResponder()
       }
    
    //MARK: - Other func
    /// setting keyborad notifications
    func setKeyBoardNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    /// changing view y with respect to keyboard action
    /// - Parameters:
    ///   - notification: key board hide show notification
    ///   - keyboardWillShow: need to hide key board or not
    func moveViewWithKeyboard(notification: NSNotification, keyboardWillShow: Bool) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let keyboardHeight = keyboardSize.height
        if keyboardWillShow {
            let safeAreaExists = (self.view?.window?.safeAreaInsets.bottom != 0)
            let constant = keyboardHeight + (safeAreaExists ? 0 : 20)
            mainView.frame.origin.y = self.view.frame.origin.y - constant
        }else {
            mainView.frame.origin.y = self.view.frame.origin.y
        }
        if !mainView.nameField.isEditing {
            mainView.nameField.resignFirstResponder()
        }
    }
    
    
    /// Setting view initial setup
    func setUpInitialView() {
        mainView.frame = self.view.frame
        mainView.startOrderingButton.addTarget(self, action: #selector(actionOnLetsConnect), for: .touchUpInside)
        mainView.nameField.delegate = self
        mainView.translatesAutoresizingMaskIntoConstraints = true
        self.view.addSubview(mainView)
        
    }
    
    /// Displaying alert message if name field is empty
    /// - Parameter userMessage: Alert message
    func displayMyAlertMessage(_ userMessage:String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
     }
    

}
