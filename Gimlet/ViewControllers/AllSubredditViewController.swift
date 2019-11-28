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
    
    let allSubReddit = "https://www.reddit.com/r/all/.json"
    
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
        configureNavigationBar(largeTitleColor: .white, backgoundColor: UIColor(red:0.47, green:0.11, blue:0.86, alpha:1.0), tintColor: .clear, title: "Sub Reddits", preferredLargeTitle: true)
        tableview.delegate = self
        tableview.dataSource = self
        addSubviews()
        setupConstraitns()
        creatMockupData()
        
        
        
    }
  
    
   
    func requestFrontPage() {
               Alamofire.request(allSubReddit, method: .get).responseJSON { response in
                  print(response)
               }
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
        return sublists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubReddit_Cell", for: indexPath) as! SubRedditCell
        let listsItems = sublists[indexPath.row]
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
    
    
    func creatMockupData() {
        let one = SubRedditModel(nameOfSubreddit: "Aww", url: "")
        let two = SubRedditModel(nameOfSubreddit: "Apple", url: "")
        let three = SubRedditModel(nameOfSubreddit: "Funny", url: "")
        
        sublists.append(one)
        sublists.append(two)
        sublists.append(three)
    }
}
