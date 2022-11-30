//
//  RegisterViewController.swift
//  BlueBird
//
//  Created by Imran razak on 27/11/2022.
//

import UIKit
import Combine

class RegisterViewController: UIViewController {
    
    private var viewModel =  AuthenticationViewViewModel()
    private var subscriptions: Set<AnyCancellable> = []

    private let createAccountTitle: UILabel = {
        let label = UILabel()
        label.text = "Create your Account"
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let emailInputField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints =  false
        textField.attributedText =  NSAttributedString (
        string: "Email",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        return textField
    }()
    
    private let passwordInputField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints =  false
        textField.attributedText =  NSAttributedString (
        string: "Password",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.isSecureTextEntry = true
        return textField
    }()
    
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.layer.cornerRadius = 8
        button.isEnabled = false
        return button
        
        
    }()
    @objc private func didChangeEmailField() {
        viewModel.email =  emailInputField.text
        viewModel.validateRegistrationForm()
        
    }
    
    @objc private func didChangePasswordField() {
        viewModel.password = passwordInputField.text
        viewModel.validateRegistrationForm()
        
    }
    
    private func bindViews() {
        emailInputField.addTarget(self, action: #selector(didChangeEmailField), for: .editingChanged)
        passwordInputField.addTarget(self, action: #selector(didChangePasswordField), for: .editingChanged)
        viewModel.$isAuthenticationFormValid.sink{ [weak self] validationState in
            self?.createAccountButton.isEnabled = validationState
            
            
            
        }
        .store(in: &subscriptions)

        viewModel.$user.sink { [weak self] user in
            guard user != nil else {return}
            guard let vc = self?.navigationController?.viewControllers.first as? OnboardingViewController else {return}
            vc.dismiss(animated: true)
            
        }
        .store(in: &subscriptions)

        
        viewModel.$error.sink { [weak self] errorString in
            guard let error = errorString else {return}
            self?.presentAlert(with: error)
        }
        .store(in: &subscriptions)
    }
    
    private func presentAlert(with error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okayButton)
        present(alert, animated: true)
    }
    
    
    
    
    @objc private func didTapToDismiss() {
        view.endEditing(true)
      }
      
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(createAccountTitle)
        view.addSubview(emailInputField)
        view.addSubview(passwordInputField)
        view.addSubview(createAccountButton)
        
        createAccountButton.addTarget(self, action: #selector(didTapCreate), for: .touchUpInside)

        bindViews()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
        

        //CreateAccountStack
        let createAccountStack = UIStackView(arrangedSubviews: [createAccountTitle, emailInputField, passwordInputField,createAccountButton])
        createAccountStack.axis = .vertical
        createAccountStack.distribution = .fill
        createAccountStack.spacing = 20
        createAccountStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createAccountStack)
        
        NSLayoutConstraint.activate([
            createAccountStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            createAccountStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            createAccountButton.heightAnchor.constraint(equalToConstant: 45)
        
        ])

    }
    
    @objc private func didTapCreate() {
        viewModel.createUser()
    }
    
  
    
}
