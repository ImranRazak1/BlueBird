//
//  ProfileviewViewModel.swift
//  BlueBird
//
//  Created by Imran razak on 03/12/2022.
//

import Foundation
import Combine

final class ProfileviewViewModel: ObservableObject {
    @Published var profileName: String?
    @Published var usernameHandle: String?
    @Published var profileBio: String?
    @Published var profileImagePath: String?
    
}
