//
//  PostsTableViewCell.swift
//  BlueBird
//
//  Created by Imran razak on 19/11/2022.
//

import UIKit


protocol PostsTableViewCellDelegate: AnyObject {
    func PostTableViewCellDidTapUpvote()
}



class PostsTableViewCell: UITableViewCell {

    static let reuseIdentifier: String =  "PostsTableViewCell"
    
    weak var delegate: PostsTableViewCellDelegate?
    
    private let profileImageView: UIImageView = {
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
    
    private let profileNameLabel: UILabel = {
        let label = UILabel()
        
        label.text =  "Testing User"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let userHandel: UILabel = {
        let label =  UILabel()
        label.text =  "@Test"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints =  false
        
        return label
    }()
    
    
    private let postTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
        
    }()
    
    
    private let upVoteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.up.circle.fill"), for: .normal)
        button.tintColor = .systemGray2
        return button
        
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Post Subviews
        contentView.addSubview(profileImageView)
        contentView.addSubview(profileNameLabel)
        contentView.addSubview(userHandel)
        
        
        //Post actions Subviews
        contentView.addSubview(upVoteButton)
        
        
        
        profileImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        profileImageView.widthAnchor.constraint(equalToConstant: 45).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 45).isActive = true
    
        upVoteButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        upVoteButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        upVoteButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        
        //Vertical profile username Stack
        let profileUsernameHeaderStack =  UIStackView(arrangedSubviews: [profileNameLabel, userHandel])
        profileUsernameHeaderStack.axis = .vertical
        //profileUsernameHeaderStack.spacing = 5
        
        //Horizontal profile Stack
        let profileHeaderStack = UIStackView(arrangedSubviews: [profileImageView, profileUsernameHeaderStack, upVoteButton])
        profileHeaderStack.axis =  .horizontal
        profileHeaderStack.spacing = 5
        profileHeaderStack.distribution = .fill
        profileHeaderStack.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderStack.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        let postStack =  UIStackView(arrangedSubviews: [profileHeaderStack, postTextLabel])
        postStack.axis = .vertical
        postStack.spacing = 10
        postStack.distribution = .fill
        postStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(postStack)
        
        NSLayoutConstraint.activate([
        
            postStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            postStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            postStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            postStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)

        ])
        
        configureButtons()
    }
    @objc private func didTapUpvote() {
        delegate?.PostTableViewCellDidTapUpvote()
    }
    
    
    private func configureButtons() {
        upVoteButton.addTarget(self, action: #selector(didTapUpvote), for: .touchUpInside)
    }
    
    required init(coder: NSCoder) {
        fatalError("Post failed to load.")
    }
}
