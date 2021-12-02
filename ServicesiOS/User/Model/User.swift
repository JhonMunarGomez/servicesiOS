//
//  User.swift
//  ServicesiOS
//
//  Created by Jhon Munar on 1/12/21.
//

import Foundation

struct User : Codable{
    //Mark : attribute
    let id: Int
    var name: String
    let username: String
    let email: String
    let phone: String
    let website: String
    let company:Company
    
}
