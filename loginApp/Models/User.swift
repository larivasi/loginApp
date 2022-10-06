//
//  Question.swift
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
        User(username: "Tim", password: "123", firstName: "Markus", profilePic: "https://i.postimg.cc/FRXHsSt2/Ellipse-1.png" )
    }
}

struct Cards {

}
