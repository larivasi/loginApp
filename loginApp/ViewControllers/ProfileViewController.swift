//
//  ProfileViewController.swift
//  loginApp
//
//  Created by Ларин Василий on 05.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var username: String?
    
    @IBOutlet weak var upperBackground: UIView!
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var greetingText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingText.text = greetingLogic() + (username ?? "unknown")
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
        profilePic.loadFrom(URLAddress: "https://i.postimg.cc/FRXHsSt2/Ellipse-1.png")
        profilePic.alpha = 1
    }
    
    func greetingLogic() -> String {
      let hour = Calendar.current.component(.hour, from: Date())
      
      let midNight = 0
      let morning = 4
      let midDay = 12
      let evening = 18
      
      var greetingText = "Hello" // Default greeting text
      switch hour {
      case midNight ..< morning:
          greetingText = "Доброй ночи, "
      case morning..<midDay:
          greetingText = "Доброе утро, "
      case midDay..<evening:
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
