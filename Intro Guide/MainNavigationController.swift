//
//  MainNavigationController.swift
//  Intro Guide
//
//  Created by Stanley Pan on 30/09/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if isLoggedIn() {
            // assume user is logged in
            let homeController = HomeController()
            viewControllers = [homeController]
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    func showLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: {
            // TODO: something here later
        })
    }
}
