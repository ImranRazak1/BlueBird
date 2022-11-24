//
//  ProfileViewController.swift
//  BlueBird
//
//  Created by Imran razak on 19/11/2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    private let profileTableView: UITableView = {
        let tableView =  UITableView()
        tableView.register(PostsTableViewCell.self, forCellReuseIdentifier: PostsTableViewCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints =  false
        return tableView
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(profileTableView)
        

        
        let headerView =  ProfileViewHeader(frame: CGRect(x: 0, y: 0, width: profileTableView.frame.width, height: 380))
        
        
        profileTableView.delegate = self
        profileTableView.dataSource =  self
        profileTableView.tableHeaderView =  headerView
        profileTableView.separatorInset = .zero

      
        
        
        let profileStack =  UIStackView(arrangedSubviews: [profileTableView])
        profileStack.axis = .vertical
        profileStack.spacing = 10
        profileStack.distribution = .fill
        profileStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileStack)
        
        NSLayoutConstraint.activate([
            
            profileStack.topAnchor.constraint(equalTo: view.topAnchor),
            profileStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileStack.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewCell.reuseIdentifier, for: indexPath) as?
                PostsTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
}
