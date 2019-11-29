//
//  AllSubredditViewController.swift
//  Gimlet
//
//  Created by Luan Nguyen on 2019-10-29.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import UIKit
import OAuthSwift
import Alamofire

class AllSubredditViewController: UIViewController {
    
    
    var lists =  [Post]()
    var sublists: [SubRedditModel] = []
    
    var oauthswift: OAuth2Swift!
    var tableview: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(SubRedditCell.self, forCellReuseIdentifier: "SubReddit_Cell")
        tb.separatorStyle = .none
        return tb
    }()
    
    
  
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchListing()
        configureNavigationBar(largeTitleColor: .white, backgoundColor: UIColor(red:0.47, green:0.11, blue:0.86, alpha:1.0), tintColor: .clear, title: "Trending", preferredLargeTitle: true)
        tableview.delegate = self
        tableview.dataSource = self
        addSubviews()
        setupConstraitns()
       
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchListing()
        tableview.reloadData()
       
        
    }
    
    func addSubviews() {
        view.addSubview(tableview)
    }
    func setupConstraitns() {
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    
    
}
extension AllSubredditViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubReddit_Cell", for: indexPath) as! SubRedditCell
        let listsItems = lists[indexPath.row]
        cell.set(listsItems)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
       }
       
       func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
           return 600
       }
    

}

extension AllSubredditViewController {
    
    func fetchListing() {
        searchReddit(for: "https://www.reddit.com/.json") {  result in
            DispatchQueue.main.async {
                switch result{
                case .success(let posts):
                    self.lists = posts
                    self.tableview.reloadData()
                case .failure(_):
                    self.lists = []
                }
            }
        }
    }
    
    func searchReddit(for query: String, completion: @escaping (Result<[Post]>) -> Void) {
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
