//
//  RandomImageParseModel.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 19/10/20.
//

import Foundation
//MARK: Parser to parse API IN Codelable
class RandomImageParseModel{
    
    var randomImage : DataModel?

    func parseUser(data: Dictionary<String,AnyObject>)-> DataModel?{
        //print("data to parse:\(data)")
        randomImage = DataModel(data: data)
        return randomImage
    }
}
