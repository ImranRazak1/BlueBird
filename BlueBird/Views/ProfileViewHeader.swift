//
//  ProfileViewHeader.swift
//  BlueBird
//
//  Created by Imran razak on 22/11/2022.
//

import UIKit

class ProfileViewHeader: UIView {
    
    private let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
       
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        let config = UIImage.SymbolConfiguration(pointSize: 35)
        imageView.image = UIImage(systemName: "person.crop.circle.fill", withConfiguration: config)
        
        //imageView.backgroundColor = .white
        return imageView
    }()
    
    
    private let profileName: UILabel = {
        
        let label = UILabel()
        
        label.text =  "Testing User"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let profileUserHandel: UILabel = {
        let label =  UILabel()
        label.text =  "@Test"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints =  false
        
        return label
        
    }()
    
    
    private let profileBio: UILabel = {
        let label = UILabel()
        label.numberOfLines =  3
        label.textColor = .label
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints =  false
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."

        
        return label
    }()
    
    
    private let followerStats: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints =  false
        label.text = "1000 Followers | 1 Followed"
        return label
    }()
    
    
    //Profile Edit Button
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .systemGray
        addSubview(profileImageView)
        addSubview(profileName)
        addSubview(profileUserHandel)
        addSubview(followerStats)
        addSubview(profileBio)
        
        let profileUserNameStack =  UIStackView(arrangedSubviews: [profileName, profileUserHandel])
        profileUserNameStack.axis =  .vertical
        profileUserNameStack.spacing = 5
        profileUserNameStack.translatesAutoresizingMaskIntoConstraints =  false
        addSubview(profileUserNameStack)
        
        NSLayoutConstraint.activate([
            profileUserNameStack.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 5),
            profileUserNameStack.topAnchor.constraint(equalTo: topAnchor, constant: 15)
           // profileUserNameStack.bottomAnchor.constraint(equalTo: profileBio.bottomAnchor, constant: 10)
        
        
        ])
        
        ConfigureConstraints()
    }
    
    private func ConfigureConstraints() {
        
        
        let profileImageConstraints = [
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            //profileImageView.centerYAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        
        let profileFollowerConstraints = [
            followerStats.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            followerStats.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 5)
            
        ]
         
        
        let profileBioConstraints = [
            profileBio.leadingAnchor.constraint(equalTo: followerStats.leadingAnchor),
            //profileBio.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            profileBio.topAnchor.constraint(equalTo: followerStats.bottomAnchor, constant: 5),
            //profileBio.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ]
               
        
        
        NSLayoutConstraint.activate(profileImageConstraints)
        NSLayoutConstraint.activate(profileFollowerConstraints)
        NSLayoutConstraint.activate(profileBioConstraints)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Profile Header View failed to load")
        
    }
}
 

