//
//  Credential.swift
//  Gimlet
//
//  Created by Luan Nguyen on 2019-11-07.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import Foundation


struct Credential {
    static let server = "https://www.reddit.com/api/v1/access_token"
    var  token: String
    
}

enum KeyChainError: Error {
    case noToken
    case tokenExpired
    case unhandledError(status: Error)
}
