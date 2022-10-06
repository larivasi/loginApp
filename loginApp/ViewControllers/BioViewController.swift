//
//  BioViewController.swift
//  loginApp
//
//  Created by Ларин Василий on 06.10.2022.
//

import UIKit

class BioViewController: UIViewController {
    
    private let bioDetails = Bio.bioDetails()

    @IBOutlet weak var lifeStory: UILabel!
    @IBOutlet weak var specialSings: UILabel!
    @IBOutlet weak var birthPlace: UILabel!
    @IBOutlet weak var birthDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lifeStory.text = "Факты из жизни: " + bioDetails.lifeStory
        specialSings.text = "Особые отметки: " + bioDetails.specialSigns
        birthPlace.text = "Место рождения: " + bioDetails.birthPlace
        birthDate.text = "Дата рождения: " + bioDetails.birthDate
    }
}
