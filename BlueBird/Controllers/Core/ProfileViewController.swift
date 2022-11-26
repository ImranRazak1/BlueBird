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
    
    private let PostsHeaderTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints =  false
        label.text = "Posts"
        return label
        
        
    }()
    
    let backButton =  UIButton(type: .system)
    let editButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title =  "🐥 BlueBird"
        view.addSubview(profileTableView)
        
        editButton.setTitle("Edit", for: .normal)
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: editButton)
        
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.setTitle("Back", for: .normal)
        backButton.sizeToFit()
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
 
        
        let headerView =  ProfileViewHeader(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
        
        
        
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
    
    @objc private func backButtonTapped() {
        
        navigationController?.dismiss(animated: true, completion: nil)
    }

    
    @objc private func editButtonTapped() {
        
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
