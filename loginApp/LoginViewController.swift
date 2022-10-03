//
//  ViewController.swift
//  loginApp
//
//  Created by Ларин Василий on 03.10.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func forgotUsernamePassword(_ sender: Any) {
        let alert = UIAlertController(title: "Oooops 😬",
                                      message: """
                                      Username: User
                                      Password: Pass
                                      """,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first
        if touch?.phase == UITouch.Phase.began {
        touch?.view?.endEditing(true)
    }
}
    
}

