//
//  NavigationController.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 20/10/20.
//

import Foundation
import UIKit

//Mark: Set navigation
class NavigationController: UINavigationController{
    lazy var navigationIcon : UIImageView = {
       let imageview = UIImageView()
        imageview.image = UIImage(named: "group_2")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    lazy var searchIcon : UIImageView = {
       let imageview = UIImageView()
        imageview.image = UIImage(named: "filled")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white ]
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.backgroundColor = UIColor.white
        self.navigationBar.addSubview(navigationIcon)
        self.navigationBar.addSubview(searchIcon)
        navigationIcon.setAnchors(top: navigationBar.topAnchor, left: navigationBar.leftAnchor, bottom: navigationBar.bottomAnchor, right: nil, paddingTop: 16, paddingLeft: 18, paddingBottom: 16, paddingRight: 0, height: 0, width: 34)
        searchIcon.setAnchors(top: navigationBar.topAnchor, left: nil, bottom: navigationBar.bottomAnchor, right: navigationBar.rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 16, paddingRight: 17, height: 0, width: 24)


    }
}
