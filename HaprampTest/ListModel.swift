//
//  ListModel.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation

//MAKR: Codeable model of list
struct ListModel: Codable{
    let data: [ListStructre]?
}
struct ListStructre: Codable {
    let id: String?
    let width, height: Int?
    let url: String?
    let profileImage: String?
    
    init(data: Dictionary<String,AnyObject>){
        id = data["id"] as? String ?? ""
        width = data["width"] as? Int ?? 0
        height = data["height"] as? Int ?? 0
        let link = data["urls"] as? [String:AnyObject]
        url = link?["small"] as? String ?? ""
        let user = data["user"] as? [String:AnyObject]
        let profile = user?["profile_image"] as? [String:AnyObject]
        profileImage = profile?["medium"] as? String? ?? ""
    }
}


