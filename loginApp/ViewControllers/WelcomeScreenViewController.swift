//
//  WelcomeScreenViewController.swift
//  loginApp
//
//  Created by Ларин Василий on 03.10.2022.
//

import UIKit

class WelcomeScreenViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Hello," + (username ?? " unknown")
        
    }
    
}
