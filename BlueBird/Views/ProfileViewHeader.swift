//
//  ProfileViewHeader.swift
//  BlueBird
//
//  Created by Imran razak on 22/11/2022.
//

import UIKit

class ProfileViewHeader: UIView {
    

    private let headerImageView: UIImageView = {
        let imageView =  UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "profileHeaderImage")
        imageView.clipsToBounds =  true
        imageView.translatesAutoresizingMaskIntoConstraints =  false
        return imageView
    }()
    
    
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
        label.text = "Testing User Bio"

        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .systemGray
        addSubview(headerImageView)
        addSubview(profileImageView)
        addSubview(profileName)
        addSubview(profileUserHandel)
        addSubview(profileBio)
        

        configureConstraints()
    }
    
    private func configureConstraints() {
        
        let profileHeaderConstraints = [
            headerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImageView.topAnchor.constraint(equalTo: topAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: 150)
        ]
        
        
        let profileImageConstraint = [
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            profileImageView.centerYAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 10),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80)
        ]
        
        
        
        let profileNameConstraint = [
            profileName.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            profileName.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20)
        ]
        
        let usernameLabelConstraints = [
            profileUserHandel.leadingAnchor.constraint(equalTo: profileName.leadingAnchor),
            profileUserHandel.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 5)
        ]
        
        
        let profileBioConstraints = [
            profileBio.leadingAnchor.constraint(equalTo: profileName.leadingAnchor),
            profileBio.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            profileBio.topAnchor.constraint(equalTo: profileUserHandel.bottomAnchor, constant: 5)
        
        
        ]
        
        
        NSLayoutConstraint.activate(profileHeaderConstraints)
        NSLayoutConstraint.activate(profileImageConstraint)
        NSLayoutConstraint.activate(profileNameConstraint)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(profileBioConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Profile Header View failed to load")
    }

}
