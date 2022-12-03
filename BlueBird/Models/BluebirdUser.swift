//
//  BlueBirdUser.swift
//  BlueBird
//
//  Created by Imran razak on 30/11/2022.
//

import Foundation
import Firebase

struct BluebirdUser: Codable {
    let id: String
    var profileName: String = ""
    var profileBio: String = ""
    var usernameHandle: String = ""
    var followersCount: Double = 0
    var followingCount: Double = 0
    var profileImagePath: String = ""
    var isUserOnboarded: Bool = false
    
    init(from user: User) {
        self.id = user.uid
    }
}
