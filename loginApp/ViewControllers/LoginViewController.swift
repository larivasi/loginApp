//
//  ViewController.swift
//  loginApp
//
//  Created by Ларин Василий on 03.10.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    
    private let userInfo = User.userInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTF.text = userInfo.username
        passwordTF.text = userInfo.password
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func forgotUsernameOrPassword(_ sender: UIButton) {
        sender.tag == 0
        ?  showAlert(withTitle: "Oooops!", withMessage: "Username: \(userInfo.username)")
        :  showAlert(withTitle: "Oooops!", withMessage: "Password: \(userInfo.password)")
        
    }
    
    @IBAction func loginButtonDidTapped() {
        guard usernameTF.text == userInfo.username, passwordTF.text == userInfo.password else {
            showAlert(
                withTitle: "Invalid login or password",
                withMessage: "Please, enter correct login or password",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeScreenVC", sender: nil)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
}

extension LoginViewController {
    private func showAlert(withTitle title: String, withMessage message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
            
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
