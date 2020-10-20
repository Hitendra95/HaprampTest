//
//  DetailView.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 20/10/20.
//

import Foundation
import UIKit
class DetailView: UIView{
    
    lazy var MainImage : UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
    
    lazy var placeTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.robotoRegular12
        title.textColor = UIColor.textColor
        return title
    }()
    
    lazy var navigationIcon : UIImageView = {
       let imageview = UIImageView()
        imageview.image = UIImage(named: "group_3-1")
        return imageview
    }()
    
    lazy var descriptionText : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.robotoRegular14
        label.textColor = UIColor.textColor
        return label
    }()
    
    lazy var profileImage : UIImageView = {
       let profile = UIImageView()
        profile.layer.cornerRadius = 16
        profile.clipsToBounds = true
        return profile
    }()
    
    lazy var userName : UILabel = {
        let label = UILabel()
        label.font = UIFont.robotoRegular14
        label.textColor = UIColor.textColor
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(MainImage)
        self.addSubview(navigationIcon)
        self.addSubview(placeTitle)
        self.addSubview(descriptionText)
        self.addSubview(profileImage)
        self.addSubview(userName)
        setCOnstraints()
    }
    
    func setCOnstraints(){
        MainImage.setAnchors(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 334, width: 0)
        navigationIcon.setAnchors(top: MainImage.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, height: 20, width: 20)
        placeTitle.setAnchors(top: MainImage.bottomAnchor, left: navigationIcon.rightAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 18, paddingLeft: 8, paddingBottom: 0, paddingRight: 12, height: 16, width: 0)
        descriptionText.setAnchors(top: placeTitle.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 14, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 0, width: 0)
        profileImage.setAnchors(top: descriptionText.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 19, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, height: 32, width: 32)
        userName.setAnchors(top: descriptionText.bottomAnchor, left: profileImage.rightAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 25, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, height: 20, width: 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
