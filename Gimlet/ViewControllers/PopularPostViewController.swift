//
//  PopularPostViewController.swift
//  Gimlet
//
//  Created by Luan Nguyen on 2019-10-29.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import UIKit
import OAuthSwift

class PopularPostViewController: UIViewController {
    
    var oauthswift: OAuth2Swift!
    var handle: OAuthSwiftRequestHandle!
    var newOAuthToken: String!
    
    let state = "GimletRequest"
    let scope = "mysubreddits, read, report, save, submit, subscribe, vote"
    let gimletAuth = "Gimlet://oauth-callback"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //AUTHENTHICATION
        oauthswift = OAuth2Swift(consumerKey: "wrQwzbsIGn4Dlg", consumerSecret: "", authorizeUrl: "https://www.reddit.com/api/v1/authorize.compact?client_id=wrQwzbsIGn4Dlg&redirect_uri=\(gimletAuth)&duration=temporary", responseType: "token")
           
               handle = oauthswift.authorize(
                   withCallbackURL: URL(string: gimletAuth)!,
                   scope: scope, state:state) { result in
                   switch result {
                   case .success(let (credential, response, parameters)):
                     print(credential.oauthToken)
                    // Do Request
                   case .failure(let error):
                       print("FAILED")
                       print(error.localizedDescription)
                   }
                    
            }
        view.backgroundColor = .white
        configureNavigationBar(largeTitleColor: .white, backgoundColor: UIColor(red:0.47, green:0.11, blue:0.86, alpha:1.0), tintColor: .clear, title: "Popular", preferredLargeTitle: true)
        
    }
    

    
    
    
    
    
}



