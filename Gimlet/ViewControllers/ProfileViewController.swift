////
////  ProfileViewController.swift
////  Gimlet
////
////  Created by Luan Nguyen on 2019-10-29.
////  Copyright © 2019 Luan Nguyen. All rights reserved.
////
//
//import UIKit
//import KeychainSwift
//
//class ProfileViewController: UIViewController {
//
//
//
//    var profileImageView: UIImageView = {
//
//        let profileImageView = UIImageView()
//        profileImageView.translatesAutoresizingMaskIntoConstraints = false
//        profileImageView.contentMode = .scaleAspectFill
//        profileImageView.backgroundColor = UIColor(red:0.47, green:0.11, blue:0.86, alpha:1.0)
//        profileImageView.image = UIImage(named: "Snoo")
//
//        return profileImageView
//    }()
//
//    var screenHeight: CGFloat = 0
//    var screenWidth: CGFloat = 0
//
//    var accountNameLabel: UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.textAlignment = .left
//        lbl.font = .systemFont(ofSize: 20, weight: .bold)
//        lbl.text = "NAME OF ACCOUNT"
//        lbl.numberOfLines = 0
//        lbl.textColor = .black
////        lbl.backgroundColor = .magenta
//        return lbl
//    }()
//
//    var accountCreatedDateLabel: UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.textAlignment = .left
//        lbl.font = .italicSystemFont(ofSize: 10)
//        lbl.text = "Created on 3rd May 2006"
////        lbl.backgroundColor = .red
//        lbl.textColor = .black
//        return lbl
//    }()
//
//    var profileView: UIView = {
//        let myView = UIView()
//        myView.translatesAutoresizingMaskIntoConstraints = false
//        myView.backgroundColor = .white
//        myView.layer.cornerRadius = 10
//        return myView
//    }()
//
//    var amountOfCommentKarmaLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 30, weight: .heavy)
//        label.text = "100 \n COMMENT KARMA"
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        label.adjustsFontSizeToFitWidth = true
////        label.backgroundColor = .red
//        return label
//    }()
//
//    var amountOfPostKarmaLabel: UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.font = .systemFont(ofSize: 30, weight: .heavy)
//        lbl.text = " 150 \n POST KARMA "
//        lbl.numberOfLines = 0
//        lbl.textAlignment = .center
//        lbl.adjustsFontSizeToFitWidth = true
////        lbl.backgroundColor = .green
//        return lbl
//    }()
//
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //CUSTOMISATION
//        view.backgroundColor = .systemGray6
//
//        configureNavigationBar(largeTitleColor: .white, backgoundColor: UIColor(red:0.47, green:0.11, blue:0.86, alpha:1.0), tintColor: .clear, title: "Profile", preferredLargeTitle: true)
//
//
//        //FUNCTIONS
//        addToViews()
//        addConstraints()
//        shadowToView(view: profileView)
//
//
//
//    }
//
//    func shadowToView(view : UIView){
//        view.layer.shadowOffset = CGSize(width: 0, height: 3)
//        view.layer.shadowOpacity = 0.6
//        view.layer.shadowRadius = 3.0
//        view.layer.shadowColor = UIColor.darkGray.cgColor
//    }
//
//
//    func addToViews() {
//        view.addSubview(profileImageView)
//        view.addSubview(accountNameLabel)
//        view.addSubview(accountCreatedDateLabel)
//        view.addSubview(profileView)
//        view.addSubview(amountOfPostKarmaLabel)
//        view.addSubview(amountOfCommentKarmaLabel)
//    }
//
//    func addConstraints() {
//
//        //SCREEN SIZE OF DEVICE
//        let screenSize: CGRect = UIScreen.main.bounds
//        screenWidth = screenSize.width
//        screenHeight = screenSize.height
//        print(screenWidth)
//        print(screenHeight)
//
//
//        NSLayoutConstraint.activate([
//            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15 ),
//            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
//            profileImageView.heightAnchor.constraint(equalToConstant: 200),
//            profileImageView.widthAnchor.constraint(equalToConstant: 200)
//        ])
//
//        NSLayoutConstraint.activate([
//            accountNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
//            accountNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            accountNameLabel.heightAnchor.constraint(equalToConstant: 50),
//            accountNameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            accountCreatedDateLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
//            accountCreatedDateLabel.topAnchor.constraint(equalTo: accountNameLabel.bottomAnchor),
//            accountCreatedDateLabel.heightAnchor.constraint(equalToConstant: 30)
//        ])
//
//        NSLayoutConstraint.activate([
//            profileView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 50),
//            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//            profileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
//        ])
//
//        NSLayoutConstraint.activate([
//            amountOfCommentKarmaLabel.centerXAnchor.constraint(equalTo: profileView.centerXAnchor),
//            amountOfCommentKarmaLabel.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 5),
//            amountOfCommentKarmaLabel.heightAnchor.constraint(equalToConstant: 100)
//
//        ])
//
//        NSLayoutConstraint.activate([
//            amountOfPostKarmaLabel.topAnchor.constraint(equalTo:amountOfCommentKarmaLabel.bottomAnchor , constant: 10),
//            amountOfPostKarmaLabel.heightAnchor.constraint(equalToConstant: 100),
//            amountOfPostKarmaLabel.centerXAnchor.constraint(equalTo: profileView.centerXAnchor)
//        ])
//
//
//
//    }
//
//    func attributedString(from string: String, nonBoldRange: NSRange?) -> NSAttributedString {
//        let fontSize = UIFont.systemFontSize
//        let attrs = [
//            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize),
//            NSAttributedString.Key.foregroundColor: UIColor.black
//        ]
//        let nonBoldAttribute = [
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize),
//        ]
//        let attrStr = NSMutableAttributedString(string: string, attributes: attrs)
//        if let range = nonBoldRange {
//            attrStr.setAttributes(nonBoldAttribute, range: range)
//        }
//        return attrStr
//    }
//
//}
//
//
//
//
//
