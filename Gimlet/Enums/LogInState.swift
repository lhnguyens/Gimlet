//
//  LogInState.swift
//  Gimlet
//
//  Created by Luan Nguyen on 2019-11-26.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import Foundation

enum LoginState: String {
    case LoggedIn
    case LoggedOut
}

extension Notification.Name {
    static var loginStateChanged: Notification.Name {
        return .init(rawValue: LoginState.LoggedIn.rawValue)
    }
}
