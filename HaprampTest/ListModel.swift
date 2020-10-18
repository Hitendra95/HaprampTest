//
//  ListModel.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation

//MAKR: Codeable model of list
struct ListModel: Codable {
    var data: [ListData]?
}

struct ListData: Codable {
    var id, text: String?
}
