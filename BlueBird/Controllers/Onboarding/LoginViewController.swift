//
//  LoginViewController.swift
//  BlueBird
//
//  Created by Imran razak on 30/11/2022.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    
    private var viewModel =  AuthenticationViewViewModel()
    private var subscriptions: Set<AnyCancellable> = []

    private let LoginAccountTitle: UILabel = {
        let label = UILabel()
        label.text = "Login In"
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
    
    
    private let LoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login In", for: .normal)
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
            self?.LoginButton.isEnabled = validationState
            
            
            
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(LoginAccountTitle)
        view.addSubview(emailInputField)
        view.addSubview(passwordInputField)
        view.addSubview(LoginButton)
                
        bindViews()
        
        LoginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        
        //LoginAccountStack
        let LoginStack = UIStackView(arrangedSubviews: [LoginAccountTitle, emailInputField, passwordInputField,LoginButton])
        LoginStack.axis = .vertical
        LoginStack.distribution = .fill
        LoginStack.spacing = 20
        LoginStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(LoginStack)
        
        NSLayoutConstraint.activate([
            LoginStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            LoginStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            LoginStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            LoginButton.heightAnchor.constraint(equalToConstant: 45)
        
        ])

    }
    
    
    @objc private func didTapLogin() {
        viewModel.loginUser()
      }
}
