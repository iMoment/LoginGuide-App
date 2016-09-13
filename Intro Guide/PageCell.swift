//
//  PageCell.swift
//  Intro Guide
//
//  Created by Stanley Pan on 9/13/16.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    let guideImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "page1")
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    func setupViews() {
        addSubview(guideImageView)
        guideImageView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}