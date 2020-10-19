//
//  ListParseModel.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation

//MARK: Parser to parse API IN Codelable
class ListParseModel{
    
    var list : ListModel?

    func parseUser(data: Array<AnyObject>)-> ListModel?{
        print("data to parse:\(data)")
        var parsedModel = [ListStructre]()
        for i in 0 ..< data.count{
            let dict:Dictionary<String,AnyObject> = (data[i] as? Dictionary<String,AnyObject>)!
            let obj = ListStructre(data: dict)
            parsedModel.append(obj)
        }
        list = ListModel(data: parsedModel)
        return list
    }
}
