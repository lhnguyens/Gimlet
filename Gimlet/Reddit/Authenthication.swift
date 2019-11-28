//
//  Authenthication.swift
//  Gimlet
//
//  Created by Luan Nguyen on 2019-10-30.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import Foundation
import UIKit
import OAuthSwift
import KeychainSwift

class Authenthication {
    
    var oauthswift: OAuth2Swift!
    var handle: OAuthSwiftRequestHandle!
    static var sharedInstance = Authenthication()
    
    //    AUTH INFO
    let state = "GimletRequest"
    let scope = "identity, edit, flair, history, modconfig, modflair, modlog, modposts, modwiki, mysubreddits, privatemessages, read, report, save, submit, subscribe, vote, wikiedit, wikiread"
    let gimletAuth = "Gimlet://oauth-callback"
    
    var isLoggedIn = LoginState.LoggedOut {
        didSet {
            NotificationCenter.default.post(name: .loginStateChanged, object: nil)
        }
    }
    
    
    func loginToReddit() {
        
        oauthswift = OAuth2Swift(consumerKey: "wrQwzbsIGn4Dlg", consumerSecret: "", authorizeUrl: "https://www.reddit.com/api/v1/authorize.compact?client_id=wrQwzbsIGn4Dlg&redirect_uri=\(gimletAuth)", accessTokenUrl:  "https://www.reddit.com/api/v1/access_token", responseType: "token")
        
        let authToken = readToken()
        
        if !authToken.isEmpty {
            handle = oauthswift.authorize(
                withCallbackURL: URL(string: gimletAuth)!,
                scope: scope, state:state) { result in
                    switch result {
                    case .success(let (credential, response, parameters)):
                        print(credential.oauthToken)
                        self.saveToken(credential.oauthToken)
                        self.isLoggedIn = .LoggedIn
                        self.getFrontPageEndPoint(self.oauthswift) {
                            print("DATA SUCCESSFUL RETRIEVED")
                        }
                        print("LOGIN SUCCESSFULL")
                        
                    case .failure(let error):
                        print(" AUTHENTHICATION.SWIFT: Failed to authenthicate user")
                        print(error.localizedDescription)
                        
                    }
            }
        }
            
        else {
            
            oauthswift.client.credential.oauthToken = authToken
            oauthswift.renewAccessToken(withRefreshToken: authToken) { result in
                switch result {
                case .success(let data) :
                    print("Token renewed")
                    self.isLoggedIn = .LoggedIn
                    self.getFrontPageEndPoint(self.oauthswift) {
                        print("TOKEN ALREADY SAVED, DATA RETRIEVED ")
                    }
                case .failure(let error):
                   print(error)
                    
                }
                
                
            }
            
            
        }
    }
}

extension Authenthication {
    
    func getFrontPageEndPoint(_ oauthSwift: OAuthSwift, completion: () -> ()) {
        let _ = oauthswift.client.get("https://oauth.reddit.com/users/popular/") { result in
            switch result {
            case .success(let response):
                let dataJSON = try? response.jsonObject()
                print(String(describing: dataJSON))
                print("JsonDataSuccessful")
            case .failure(let error):
                print("DATA FAILED")
              
            }
        }
        completion()
    }
    
    func getUsersFavouriteSubreddits(_ oauthSwift: OAuthSwift, completion: () -> ()) {
        let _ = oauthswift.client.get("https://oauth.reddit.com/subreddits/default") { result in
            switch result {
            case .success(let response):
                let dataJSON = try? response.jsonObject()
                print(String(describing: dataJSON))
                print("Favoruti subreddits founds")
            case .failure(let error):
                print("DATA FAILED")
              
            }
        }
        completion()
    }
    
    func logOutOfReddit() {
        let tokenItem = KeychainSwift()
        tokenItem.delete("token")
    }
}


extension Authenthication {
    
    func saveToken(_ token:String) {
        guard !token.isEmpty else {
            return
        }
        let tokenItem = KeychainSwift()
        tokenItem.set(token, forKey: "token")
    }
    
    func readToken() -> String {
        let tokenItem = KeychainSwift()
        let token: String = tokenItem.get("token") ?? ""
        
        return token
    }
}
