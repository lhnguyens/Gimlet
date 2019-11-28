//
//  AuthTokenSaver.swift
//  Gimlet
//
//  Created by Luan Nguyen on 2019-11-19.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import Foundation


struct TokenConfig {
    static let serviceName = "RedditAuth"
    static let accountName = "RedditAuthToken"
    static let accessGroup: String? = nil
}

struct AuthtokenSaver {
    
    static func saveAuthToken(token token: String) {
        guard !token.isEmpty else {
            return
        }
        
        do {
            let tokenItem = KeyChain
        }
    }
}
