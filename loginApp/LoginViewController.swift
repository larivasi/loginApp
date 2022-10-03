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
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeScreenViewController else { return }
        welcomeVC.username = usernameTF.text
    }
    
    
    @IBAction func forgotUsernamePassword(_ sender: Any) {
        showAlert(withTitle: "Oooops!", withMessage: "Username: User \nPassword: Pass")
      
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.phase == UITouch.Phase.began {
            touch?.view?.endEditing(true)
        }
    }
    
    

    @IBAction func loginButtonDidTapped() {
        guard let userName = usernameTF.text, let password = passwordTF.text else { return }
        if userName != "User" || password != "Pass" {
            showAlert(withTitle: "Incorrect login or password", withMessage: "Please make sure that you enter")
            passwordTF.text = ""
        }
        
    }
}

extension LoginViewController {
    private func showAlert(withTitle title: String, withMessage message: String) {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
