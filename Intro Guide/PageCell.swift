//
//  PageCell.swift
//  Intro Guide
//
//  Created by Stanley Pan on 9/13/16.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let page = page else {
                return
            }
            guideImageView.image = UIImage(named: page.imageName)
            
            let color = UIColor(white: 0.2, alpha: 1)
            
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(20, weight: UIFontWeightMedium), NSForegroundColorAttributeName: color])
            
            attributedText.appendAttributedString(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14), NSForegroundColorAttributeName: color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .Center
            
            let length = attributedText.string.characters.count
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            guideTextView.attributedText = attributedText
        }
    }
    
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
        textView.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        
        return textView
    }()
    
    let lineSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        return view
    }()
    
    func setupViews() {
        addSubview(guideImageView)
        addSubview(guideTextView)
        addSubview(lineSeparatorView)
        
        guideImageView.anchorToTop(topAnchor, left: leftAnchor, bottom: guideTextView.topAnchor, right: rightAnchor)
        
        guideTextView.anchorWithConstantsToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        
        guideTextView.heightAnchor.constraintEqualToAnchor(heightAnchor, multiplier: 0.3).active = true
        
        lineSeparatorView.anchorToTop(nil, left: leftAnchor, bottom: guideTextView.topAnchor, right: rightAnchor)
        
        lineSeparatorView.heightAnchor.constraintEqualToConstant(1).active = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}