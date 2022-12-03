//
//  DatabaseManager.swift
//  BlueBird
//
//  Created by Imran razak on 30/11/2022.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestoreCombineSwift
import Combine

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    let db = Firestore.firestore()
    let usersPath: String  = "users"
    
    func collectionUsers(add user: User) -> AnyPublisher <Bool, Error> {
        let bluebirdUser = BluebirdUser(from: user)
        return db.collection(usersPath).document(bluebirdUser.id).setData(from: bluebirdUser)
            .map {_ in
                return true
            }
            .eraseToAnyPublisher()
        
        
    }
    
    func collectionUsers(retrieve id: String) -> AnyPublisher<BluebirdUser, Error> {
        db.collection(usersPath).document(id).getDocument()
            .tryMap{
                try $0.data(as: BluebirdUser.self)
            }
            .eraseToAnyPublisher()
    }
    
    
    
}
