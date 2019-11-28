//
//  PopularPostViewController.swift
//  Gimlet
//
//  Created by Luan Nguyen on 2019-10-29.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import UIKit
import OAuthSwift



class PopularPostViewController: UIViewController{
    
    
    
    var postURL: URL?
    
    var posts = [Post]()
    
    var tableview: UITableView = {
        let tb = UITableView()
        tb.register(Posts.self, forCellReuseIdentifier: "Popular_Posts_Cell")
        //        tb.separatorStyle = .none
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    
    var oauthswift: OAuth2Swift!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchListing()
        //        Authenthication.sharedInstance.loginToReddit()
        view.backgroundColor = .white
        configureNavigationBar(largeTitleColor: .white, backgoundColor: UIColor(red:0.47, green:0.11, blue:0.86, alpha:1.0), tintColor: .white, title: "Popular", preferredLargeTitle: true)
        
        tableview.delegate = self
        tableview.dataSource = self
        addSubviews()
        setupConstraints()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchListing()
        tableview.reloadData()
        print(posts)
        
    }
    
    
    func addSubviews() {
        view.addSubview(tableview)
        
    }
    
    func  setupConstraints() {
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    func fetchListing() {
        searchReddit(for: "https://www.reddit.com/.json") {  result in
            DispatchQueue.main.async {
                switch result{
                case .success(let posts):
                    self.posts = posts
                    self.tableview.reloadData()
                case .failure(_):
                    self.posts = []
                }
            }
        }
    }
    
    func searchReddit(for query: String, completion: @escaping (Result<[Post], Error>) -> Void) {
        guard let url = URL(string: "\(query)") else {
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


extension PopularPostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Popular_Posts_Cell", for: indexPath) as! Posts
        let postings = posts[indexPath.row]
        cell.set(posts: postings)
        print(postings.permaLink)
    
//        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = posts[indexPath.row]
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









