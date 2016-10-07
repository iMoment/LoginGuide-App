//
//  UserDefaults+helpers.swift
//  Intro Guide
//
//  Created by Stanley Pan on 07/10/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

extension UserDefaults {
    
    enum UserDefaultsKeys: String {
        case isLoggedIn
    }
    
    func setIsLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
}
