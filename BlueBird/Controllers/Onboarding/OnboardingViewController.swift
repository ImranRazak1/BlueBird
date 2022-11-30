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
        label.text = "We're building better conversations"
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints =  false
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let welcomeSubText: UILabel = {
        let label = UILabel()
        label.text = "This is the first stepping stone to Open Moderation, privacy focused and community led conversations. Help us build it."
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create Account", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        return button
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.tintColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let privacyIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "lock.shield.fill")
        image.tintColor = .systemBlue
        image.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    
    private let privacyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "We're commited to privacy and security. Read our"
        label.numberOfLines = 0
        label.tintColor = .systemBlue
        label.font = .systemFont(ofSize: 10, weight: .light)
        return label
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("privacy policy", for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(loginButton)
        view.addSubview(loginLabel)
      

        createAccountButton.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        
        //WelcomeStack
        let welcomeStack = UIStackView(arrangedSubviews: [welcomeLabel, welcomeSubText, createAccountButton])
        welcomeStack.axis = .vertical
        welcomeStack.spacing = 10
        welcomeStack.distribution = .fill
        welcomeStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeStack)
        
        NSLayoutConstraint.activate([
            welcomeStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            welcomeStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            welcomeStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            createAccountButton.heightAnchor.constraint(equalToConstant: 45),
        
        ])
                
       
        configConstraints()

    }
    
    @objc private func didTapLogin() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapCreateAccount() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func configConstraints() {
        let loginLabelConstraints = [
            loginLabel.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: 10),
            loginLabel.leadingAnchor.constraint(equalTo: createAccountButton.leadingAnchor)
        
        ]
        
        
        let loginButtonConstraints = [
            loginButton.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: 5),
            loginButton.leadingAnchor.constraint(equalTo: loginLabel.trailingAnchor, constant: 5)
        ]
        
  
        
    
        
        NSLayoutConstraint.activate(loginLabelConstraints)
        NSLayoutConstraint.activate(loginButtonConstraints)
        
    }
    



}
