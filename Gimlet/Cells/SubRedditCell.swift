//
//  SubRedditCell.swift
//  Gimlet
//
//  Created by Luan Nguyen on 2019-11-07.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import Foundation
import UIKit

class SubRedditCell: UITableViewCell {
    
    var subRedditIcon: UIImageView = {
        let pic = UIImageView()
        pic.image = UIImage(systemName: "circle.fill")
        pic.tintColor = UIColor(red:0.47, green:0.11, blue:0.86, alpha:1.0)
        pic.translatesAutoresizingMaskIntoConstraints = false
        
        return pic
    }()
    
    var subRedditLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 20, weight: .heavy)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ subreddit: Post) {
        subRedditLabel.text = subreddit.subredditNamePrefixed
        
        
    }
    func configureViews() {
        addSubview(subRedditLabel)
        addSubview(subRedditIcon)
        
    }
    func configureConstraints() {
        NSLayoutConstraint.activate([
            subRedditIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            subRedditIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            subRedditIcon.heightAnchor.constraint(equalToConstant: 10),
            subRedditIcon.widthAnchor.constraint(equalToConstant: 10)
        ])
        
        NSLayoutConstraint.activate([
            subRedditLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            subRedditLabel.leadingAnchor.constraint(equalTo: subRedditIcon.trailingAnchor, constant: 10),
            subRedditLabel.heightAnchor.constraint(equalToConstant: 40),
            subRedditLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10)
        ])
        
        
    }
    

}
