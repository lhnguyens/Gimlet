//
//  Posts.swift
//  Gimlet
//
//  Created by Luan Nguyen on 2019-11-07.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage


class Posts: UITableViewCell {
    
    
    var postImageView = UIImageView()
    var titleLabel = UILabel()
    var subRedditLabel = UILabel()
    var postKarma = UILabel()
    var numberOfComments = UILabel()
    
    var karmaImage: UIImageView = {
        let ki = UIImageView()
        ki.image = UIImage(systemName: "heart.fill")
        ki.translatesAutoresizingMaskIntoConstraints = false
        ki.tintColor = .black
        return ki
    }()
    var commentImage: UIImageView = {
           let cI = UIImageView()
           cI.image = UIImage(systemName: "text.bubble.fill")
           cI.translatesAutoresizingMaskIntoConstraints = false
        cI.tintColor = .black
           return cI
       }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(postImageView)
        addSubview(titleLabel)
        addSubview(subRedditLabel)
        addSubview(postKarma)
        addSubview(numberOfComments)
        addSubview(karmaImage)
        addSubview(commentImage)
        
        configureImageView()
        configureTitleLabel()
        configureSubRedditLabel()
        configurePostKarma()
        configureNumOfComments()
        configureConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(posts: Post) {
        postImageView.sd_setImage(with: URL(string:posts.thumbnail), placeholderImage: UIImage(named: "Snoo"))
        titleLabel.text = posts.title
        subRedditLabel.text = posts.subredditNamePrefixed
//        postKarma.text = posts.author
//        numberOfComments.text = posts.url
        postKarma.text = String(posts.score)
        numberOfComments.text = String(posts.numComments)
    }
    
    
    func configureImageView() {
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.layer.cornerRadius = 10
        postImageView.clipsToBounds = true
        postImageView.image = UIImage(named: "Snoo")
        postImageView.contentMode = .scaleAspectFill
        
    }
    func configureTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = .systemFont(ofSize: 20, weight: .heavy)
    }
    
    func configureSubRedditLabel() {
        subRedditLabel.translatesAutoresizingMaskIntoConstraints = false
        subRedditLabel.numberOfLines = 0
        subRedditLabel.font = .italicSystemFont(ofSize: 12)
        subRedditLabel.adjustsFontSizeToFitWidth = true
    }
    func configurePostKarma() {
        postKarma.translatesAutoresizingMaskIntoConstraints = false
        postKarma.numberOfLines = 0
        postKarma.font = .boldSystemFont(ofSize: 12)
        postKarma.adjustsFontSizeToFitWidth = true
    }
    func configureNumOfComments() {
        numberOfComments.translatesAutoresizingMaskIntoConstraints = false
        numberOfComments.numberOfLines = 0
        postKarma.font = .boldSystemFont(ofSize: 12)
        numberOfComments.adjustsFontSizeToFitWidth = true
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            postImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            postImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            postImageView.heightAnchor.constraint(equalToConstant: 60),
            postImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            subRedditLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: 10),
            subRedditLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            subRedditLabel.widthAnchor.constraint(equalToConstant: 80),
            subRedditLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            postKarma.leadingAnchor.constraint(equalTo: subRedditLabel.trailingAnchor, constant: 10),
            postKarma.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            postKarma.widthAnchor.constraint(equalToConstant: 100),
            postKarma.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        NSLayoutConstraint.activate([
            numberOfComments.leadingAnchor.constraint(equalTo: postKarma.trailingAnchor, constant: 10),
            numberOfComments.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            numberOfComments.widthAnchor.constraint(equalToConstant: 100),
            numberOfComments.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            karmaImage.heightAnchor.constraint(equalToConstant: 25),
            karmaImage.widthAnchor.constraint(equalToConstant: 25),
            karmaImage.trailingAnchor.constraint(equalTo: postKarma.leadingAnchor, constant: -10),
            karmaImage.centerYAnchor.constraint(equalTo: postKarma.centerYAnchor),
            karmaImage.leadingAnchor.constraint(equalTo: subRedditLabel.trailingAnchor, constant: 1)
        ])
            
        NSLayoutConstraint.activate([
            commentImage.heightAnchor.constraint(equalToConstant: 25),
            commentImage.widthAnchor.constraint(equalToConstant: 25),
            commentImage.trailingAnchor.constraint(equalTo: numberOfComments.leadingAnchor, constant: -10),
            commentImage.centerYAnchor.constraint(equalTo: numberOfComments.centerYAnchor)
        ])
        
    }
}
