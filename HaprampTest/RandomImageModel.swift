//
//  RandomImageModel.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 19/10/20.
//

import Foundation
//MAKR: Codeable model of RandomImage

// MARK: - RandomDataModel
struct DataModel: Codable {
    let id: String?
    let url: String?
    
    init(data: Dictionary<String,AnyObject>){
        id = data["id"] as? String ?? ""
        let urls = data["urls"] as? [String:AnyObject]
        url = urls?["small"] as? String ?? ""
    }
}

