//
//  HomeViewController.swift
//  BlueBird
//
//  Created by Imran razak on 19/11/2022.
//

import UIKit

class HomeViewController: UIViewController {

    
    private let timelineTableView: UITableView = {
        
        let tableView =  UITableView()
        tableView.register(PostsTableViewCell.self, forCellReuseIdentifier: PostsTableViewCell.reuseIdentifier)
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true

        
        
        view.addSubview(timelineTableView)
        timelineTableView.dataSource = self
        timelineTableView.delegate = self
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        timelineTableView.frame = view.frame
        timelineTableView.separatorInset = .zero
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
