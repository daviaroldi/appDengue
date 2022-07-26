//
//  Agent.swift
//  appDengue
//
//  Created by aluno13 on 26/07/22.
//

import Foundation

struct Agent {
    let id: Int
    let name: String?
    let email: String?
    let registrationDate: Date?
    let lastLogin: Date?
    
    init(_ id: Int = 0, _ name: String = "", _ email: String = "", _ registrationDate: Date = Date(), _ lastLogin: Date = Date()) {
        self.id = id
        self.name = name
        self.email = email
        self.registrationDate = registrationDate
        self.lastLogin = lastLogin
    }
}
