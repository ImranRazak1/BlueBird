//
//  ViewController.swift
//  BlueBird
//
//  Created by Imran razak on 19/11/2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground
        
        //Adding VC into View
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 =  UINavigationController(rootViewController: PostViewController())
        let vc3 =  UINavigationController(rootViewController: ProfileViewController())
        
        //VC Setups
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        vc1.tabBarItem.title = "Home"
        
        vc2.tabBarItem.image = UIImage(systemName: "plus.app")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "plus.app.fill")
        vc2.tabBarItem.title = "Post"
        
        
        vc3.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        vc3.tabBarItem.title = "Profile"
        
        setViewControllers([vc1, vc2, vc3], animated: true)
        
        
        
    }


}

