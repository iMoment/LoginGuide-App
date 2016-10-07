//
//  HomeController.swift
//  Intro Guide
//
//  Created by Stanley Pan on 07/10/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "We're logged in"
        
        let homeImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = #imageLiteral(resourceName: "home")
            
            return imageView
        }()
        
        view.addSubview(homeImageView)
        _ = homeImageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
}
