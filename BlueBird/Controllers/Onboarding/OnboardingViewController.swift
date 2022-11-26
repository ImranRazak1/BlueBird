//
//  OnboardingViewController.swift
//  BlueBird
//
//  Created by Imran razak on 26/11/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    

    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "We're building a better conversation"
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints =  false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let welcomeSubText: UILabel = {
        let label = UILabel()
        label.text = "This is the first stepping stone to Open Moderation, privacy focused and community led conversations. Help us build it."
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        
        
        return button
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(welcomeLabel)
        view.addSubview(welcomeSubText)
        
        
        
        
        
    }
    



}
