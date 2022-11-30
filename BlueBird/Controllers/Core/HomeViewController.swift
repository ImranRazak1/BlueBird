//
//  HomeViewController.swift
//  BlueBird
//
//  Created by Imran razak on 19/11/2022.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    
    private let timelineTableView: UITableView = {
        
        let tableView =  UITableView()
        tableView.register(PostsTableViewCell.self, forCellReuseIdentifier: PostsTableViewCell.reuseIdentifier)
        return tableView
        
    }()
    
    
    private func handleAuthentication() {
        if Auth.auth().currentUser == nil {
            let vc = UINavigationController(rootViewController: OnboardingViewController())
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationItem.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let rightBarButton = UIBarButtonItem(title: "Profile", style: .done, target: self, action: #selector(profileButtonTapped))
        rightBarButton.image = UIImage(systemName: "person.crop.circle")
        
        let leftBarButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(didSignOut))
        
        navigationItem.rightBarButtonItem = rightBarButton
        navigationItem.leftBarButtonItem = leftBarButton
        
        navigationController?.navigationBar.isHidden = false

        
        view.addSubview(timelineTableView)
        timelineTableView.dataSource = self
        timelineTableView.delegate = self
        
        
        
        
    }
    
    @objc private func didSignOut(){
        try? Auth.auth().signOut()
        handleAuthentication()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        timelineTableView.frame = view.frame
        timelineTableView.separatorInset = .zero
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handleAuthentication()
    }
    
    @objc private func profileButtonTapped() {
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        profileViewController.modalPresentationStyle = .fullScreen
        present(profileViewController, animated: true)
        
    }
    
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewCell.reuseIdentifier, for: indexPath) as? PostsTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    /*
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 120
     }
     */
}
