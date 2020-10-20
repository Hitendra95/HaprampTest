//
//  DetailData.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 20/10/20.
//

import Foundation
class DetailData{
    let descriptionText: String?
    let profileImage: String?
    let userName: String?
    let placeTitle: String?
    let mainImage: String?
    
    init(descriptionText: String,profileImage: String,userName: String,placeTitle: String,mainImage: String) {
        self.descriptionText = descriptionText
        self.profileImage = profileImage
        self.userName = userName
        self.placeTitle = placeTitle
        self.mainImage = mainImage
    }
}
