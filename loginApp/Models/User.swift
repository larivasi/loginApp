//
//  User.swift
//  loginApp
//
//  Created by Ларин Василий on 06.10.2022.
//

struct User {
    let username: String
    let password: String
    let firstName: String
    let profilePic: String
    
    static func userInfo() -> User {
        User(username: "Tim",
             password: "123",
             firstName: "Markus",
             profilePic: "https://i.postimg.cc/FRXHsSt2/Ellipse-1.png"
        )
    }
}

struct Bio {
    let birthDate: String
    let birthPlace: String
    let specialSigns: String
    let lifeStory: String
    
    static func bioDetails() -> Bio {
        Bio(birthDate: "18.05.1998",
            birthPlace: "Berlin",
            specialSigns: "Tatto on left wrist",
            lifeStory: "Something intresting about me"
        )
    }

}

struct PersonalInfo {
    let work: String
    let position: String
    let hobby: String
    
    static func personalInfo() -> PersonalInfo {
        PersonalInfo(work: "Hard",
                     position: "Middle",
                     hobby: "Learn how to code"
        )
    }
}
