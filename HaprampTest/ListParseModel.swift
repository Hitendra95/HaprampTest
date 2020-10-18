//
//  ListParseModel.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation

//MARK: Parser to parse API IN Codelable
class ListParseModel{
    
    var list = ListModel()

    func parseUser(data: Data)-> ListModel{
        print("data to parse:\(data)")
        let decoder = JSONDecoder()
        do
        {
            list = try decoder.decode(ListModel.self, from: data)
            return list
        }
        catch
        {
            print(error.localizedDescription)
            return list
        }
    }
}
