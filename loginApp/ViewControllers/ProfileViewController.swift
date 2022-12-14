//
//  ProfileViewController.swift
//  loginApp
//
//  Created by Ларин Василий on 05.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var navigatroTitle: UINavigationItem!
    
    @IBOutlet weak var hobby: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var work: UILabel!
    
    var username: String?
    
    private let userInfo = User.userInfo()
    private let personalInfo = PersonalInfo.personalInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigatroTitle.title = greetingLogic() + userInfo.firstName
        hobby.text = "Hobby: " + personalInfo.hobby
        position.text = "Position: " + personalInfo.position
        work.text = "Job: " + personalInfo.work
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setProfilePic()
    }
    
    private func setProfilePic() {
        profilePic.layer.cornerRadius = profilePic.bounds.width / 2
        profilePic.clipsToBounds = true
        profilePic.layer.cornerRadius = profilePic.frame.size.width/2
        profilePic.clipsToBounds = false
        profilePic.layer.shadowColor = UIColor.black.cgColor
        profilePic.layer.shadowOpacity = 0.7
        profilePic.layer.shadowOffset =  CGSize(width: 2, height: 2)
        profilePic.layer.shadowRadius = 10
        profilePic.loadFrom(URLAddress: userInfo.profilePic)
        profilePic.alpha = 1
    }
    
    private func greetingLogic() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        let midNight = 0
        let morning = 4
        let midDay = 12
        let evening = 18
        
        var greetingText = "Привет"
        switch hour {
        case midNight ..< morning:
            greetingText = "Доброй ночи, "
        case morning ..< midDay:
            greetingText = "Доброе утро, "
        case midDay ..< evening:
            greetingText = "Добрый день, "
        default:
            _ = "Добрый вечер, "
        }
        return greetingText
    }
}

extension UIImageView {
    func loadFrom (URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data (contentsOf: url) {
                if let loadedImage = UIImage (data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}
