//
//  ViewController.swift
//  loginApp
//
//  Created by Ларин Василий on 03.10.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let username = "User"
    let password = "pass"
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func forgotUsername(_ sender: Any) {
        showAlert(withTitle: "Oooops!", withMessage: "Username: \(username)")
        
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        showAlert(withTitle: "Oooops!", withMessage: "Password: \(password)")
    }
    
    
    @IBAction func loginButtonDidTapped() {
        guard let userName = usernameTF.text, let password = passwordTF.text else { return }
        if userName != username || password != password {
            showAlert(withTitle: "Incorrect login or password", withMessage: "Please make sure that you enter")
            passwordTF.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeScreenViewController else { return }
        welcomeVC.username = usernameTF.text
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
