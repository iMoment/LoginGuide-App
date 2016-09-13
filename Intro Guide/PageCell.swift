//
//  PageCell.swift
//  Intro Guide
//
//  Created by Stanley Pan on 9/13/16.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page?
    
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
    
    let guideTextView: UITextView = {
        let textView = UITextView()
        textView.text = "SAMPLE TEXT FOR NOW"
        textView.editable = false
        
        return textView
    }()
    
    func setupViews() {
        addSubview(guideImageView)
        addSubview(guideTextView)
        
        guideImageView.anchorToTop(topAnchor, left: leftAnchor, bottom: guideTextView.topAnchor, right: rightAnchor)
        guideTextView.anchorToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        guideTextView.heightAnchor.constraintEqualToAnchor(heightAnchor, multiplier: 0.3).active = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}