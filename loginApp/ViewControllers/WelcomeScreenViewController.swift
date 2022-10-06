//
//  WelcomeScreenViewController.swift
//  loginApp
//
//  Created by Ларин Василий on 03.10.2022.
//

import UIKit

class WelcomeScreenViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    private let userInfo = User.userInfo()
    private var primaryColor: UIColor {
        #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    }
    private var secondaryColor: UIColor {
        #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVeticalGradientLyer(topColor: primaryColor, buttomColor: secondaryColor)
        welcomeLabel.text = "Hello, " + userInfo.firstName
    }
}

extension UIView {
    func addVeticalGradientLyer(topColor: UIColor, buttomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, buttomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
