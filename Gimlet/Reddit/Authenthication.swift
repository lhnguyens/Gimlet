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
    var newOAuthToken: String!

    let keychain = KeychainSwift()

    let state = "GimletRequest"
    let scope = "identity, edit, flair, history, modconfig, modflair, modlog, modposts, modwiki, mysubreddits, privatemessages, read, report, save, submit, subscribe, vote, wikiedit, wikiread"
    let gimletAuth = "Gimlet://oauth-callback"
    
    static let sharedInstance = Authenthication()
    
    
    

   
}
