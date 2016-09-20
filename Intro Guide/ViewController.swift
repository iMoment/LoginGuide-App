//
//  ViewController.swift
//  Intro Guide
//
//  Created by Stanley Pan on 9/13/16.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var guideCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        
        return collectionView
    }()
    
    let cellId = "cellId"
    let loginCellId = "loginCellId"
    
    let pages: [Page] = {
        let firstPage = Page(title: "Share a great listen", message: "It's free to send your books to the people in your life. Every recipient's first book is on us.", imageName: "page1")
        
        let secondPage = Page(title: "Send from your library", message: "Tap the More menu next to any book. Choose \"Send this Book.\"", imageName: "page2")
        
        let thirdPage = Page(title: "Send from the player", message: "Tap the More menu in the upper corner. Choose \"Send this Book.\"", imageName: "page3")
        
        return [firstPage, secondPage, thirdPage]
    }()
    
    lazy var guidePageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
        pageControl.numberOfPages = self.pages.count + 1
        
        return pageControl
    }()
    
    let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1), for: .normal)
        
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1), for: .normal)
        
        return button
    }()

    var guidePageControlBottomAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(guideCollectionView)
        view.addSubview(guidePageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
        guidePageControlBottomAnchor = guidePageControl.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)[1]
        
        _ = skipButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 50)
        
        _ = nextButton.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 50)
        
        guideCollectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        registerCells()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        guidePageControl.currentPage = pageNumber
        
        if pageNumber == pages.count {
            guidePageControlBottomAnchor?.constant = 40
        } else {
            guidePageControlBottomAnchor?.constant = 0
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            // needed for every change in constant constraint inside an animation
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    fileprivate func registerCells() {
        guideCollectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        guideCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: loginCellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == pages.count {
            let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellId, for: indexPath)
            return loginCell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        
        let page = pages[(indexPath as NSIndexPath).item]
        cell.page = page
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
