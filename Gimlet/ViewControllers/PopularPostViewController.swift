//
//  PopularPostViewController.swift
//  Gimlet
//
//  Created by Luan Nguyen on 2019-10-29.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import UIKit
import OAuthSwift
import Alamofire
import KeychainSwift

class PopularPostViewController: UIViewController {
    
    var tableview: UITableView = {
        let tb = UITableView()
        tb.register(Posts.self, forCellReuseIdentifier: "Popular_Posts_Cell")
        tb.separatorStyle = .none
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    
    var oauthswift: OAuth2Swift!
    var handle: OAuthSwiftRequestHandle!
    var newOAuthToken: String!
    
    let keychain = KeychainSwift()
    
    let state = "GimletRequest"
    let scope = "identity, edit, flair, history, modconfig, modflair, modlog, modposts, modwiki, mysubreddits, privatemessages, read, report, save, submit, subscribe, vote, wikiedit, wikiread"
    let gimletAuth = "Gimlet://oauth-callback"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //AUTHENTHICATION
        oauthswift = OAuth2Swift(consumerKey: "wrQwzbsIGn4Dlg", consumerSecret: "", authorizeUrl: "https://www.reddit.com/api/v1/authorize.compact?client_id=wrQwzbsIGn4Dlg&redirect_uri=\(gimletAuth)", accessTokenUrl:  "https://www.reddit.com/api/v1/access_token", responseType: "token")
        handle = oauthswift.authorize(
            withCallbackURL: URL(string: gimletAuth)!,
            scope: scope, state:state) { result in
                switch result {
                case .success(let (credential, response, parameters)):
                    print(credential.oauthToken)
                    print(response)
                    print(parameters)
                    self.keychain.set(credential.oauthToken, forKey: "token")
                    print(self.keychain.get("token")!)
                    let _  = self.oauthswift.client.get("https://oauth.reddit.com/subreddits/mine/subscriber") { result in
                        switch result {
                        case .success(let response):
                           let dataJSON = try? response.jsonObject()
                            print(String(describing: dataJSON))
                        case .failure(let error):
                            print(error)
                        }
                    }
                case .failure(let error):
                    print("FAILED")
                    print(error.localizedDescription)
                }
            }
        // CONFIGURE REST OF SCREEN
        view.backgroundColor = .white
        configureNavigationBar(largeTitleColor: .white, backgoundColor: UIColor(red:0.47, green:0.11, blue:0.86, alpha:1.0), tintColor: .clear, title: "Popular", preferredLargeTitle: true)
    
        tableview.delegate = self
        tableview.dataSource = self
        addSubviews()
        setupConstraints()
    }
    
    
    
    
    func addSubviews() {
        view.addSubview(tableview)
        
    }
    
    func  setupConstraints() {
        
        //TABLEVIEW CONSTRAINTS
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    

}


extension PopularPostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Popular_Posts_Cell", for: indexPath)
        cell.textLabel!.text = "it works"
        return cell
    }
    
    
}


    
    



