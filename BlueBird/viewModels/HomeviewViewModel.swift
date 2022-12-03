//
//  HomeviewViewModel.swift
//  BlueBird
//
//  Created by Imran razak on 03/12/2022.
//

import Foundation
import Combine
import FirebaseAuth

final class HomeviewViewModel: ObservableObject {
    
    @Published var user: BluebirdUser?
    @Published var error: String?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    func retrieveUser() {
        guard let id = Auth.auth().currentUser?.uid else {return}
        DatabaseManager.shared.collectionUsers(retrieve: id)
            .sink { [weak self]completion in
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            } receiveValue: { [weak self] user in
                self?.user = user
            }
            .store(in: &subscriptions)

        
    }
    
}


