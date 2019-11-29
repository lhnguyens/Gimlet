//
//  ProfileViewController.swift
//  Gimlet
//
//  Created by Luan Nguyen on 2019-10-29.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    

    var listsOfPosts = [Post]()
    var tableview: UITableView  = {
        let tb = UITableView()
        tb.register(Posts.self, forCellReuseIdentifier: "SearchCell")
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    var textField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.borderStyle = .bezel
        tf.backgroundColor = .systemGray6
        tf.autocorrectionType = .no
        tf.adjustsFontSizeToFitWidth = true
        tf.font = .systemFont(ofSize: 20, weight: .semibold)
        tf.placeholder = "Search Subreddits"
        tf.keyboardType = .default
        tf.enablesReturnKeyAutomatically = true
        return tf
    }()

    override func viewDidLoad() {
        
        configureNavigationBar(largeTitleColor: .white, backgoundColor: UIColor(red:0.47, green:0.11, blue:0.86, alpha:1.0), tintColor: .white, title: "Search", preferredLargeTitle: true)
        view.backgroundColor = .white
        textField.delegate = self
        view.addSubview(textField)
        view.addSubview(tableview)
        constraintsForObjects()
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    
    func constraintsForObjects() {
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
                   tableview.topAnchor.constraint(equalTo: textField.bottomAnchor),
                   tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                   tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
               ])
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        fetchListing(for: textField.text!)
    }
    
    func fetchListing(for subreddit:String) {
            searchReddit(for: subreddit) {  result in
                DispatchQueue.main.async {
                    switch result{
                    case .success(let posts):
                        self.listsOfPosts = posts
                        self.tableview.reloadData()
                    case .failure(_):
                        self.listsOfPosts = []
                    }
                }
            }
        }
        
        func searchReddit(for query: String, completion: @escaping (Result<[Post], Error>) -> Void) {
            let query = query.trimmingCharacters(in: .whitespacesAndNewlines)
                   guard let url = URL(string: "https://www.reddit.com/\(query.count == 0 ? "" : "r/\(query)").json") else {
                       preconditionFailure("Failed to construct search URL for query: \(query)")
                   }
            
            let jsonDecoder = JSONDecoder()
            URLSession.shared.dataTask(with: url) {  data, response, error in
                if let error = error {
                    completion(.failure(error))
                    print("1")
                }
                else {
                    print("2")
                    do {
                        let dt = data
                        let response = try jsonDecoder.decode(Listing.self, from: dt!)
                        completion(.success(response.posts))
                        print("3")
                        
                    }
                    catch {
                        print("4")
                        completion(.failure(error))
                    }
                }
            }.resume()
        }
    }





extension ProfileViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listsOfPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! Posts
        let postings = listsOfPosts[indexPath.row]
        cell.set(posts: postings)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
       }
       
       func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
           return 600
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
           let data = listsOfPosts[indexPath.row]
           let path = data.permaLink
           let author = data.author
           let url = "https://www.reddit.com/\(path)"
           let vc = WebViewController()
           vc.urlForWebRequest = url
           vc.authorOfPosts = author
           vc.hidesBottomBarWhenPushed = true
           self.navigationController?.pushViewController(vc, animated: true)
           
       }
}



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





