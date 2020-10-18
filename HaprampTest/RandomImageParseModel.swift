//
//  RandomImageParseModel.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 19/10/20.
//

import Foundation
//MARK: Parser to parse API IN Codelable
class RandomImageParseModel{
    
    var randomImage = RandomImageModel()

    func parseUser(data: Data)-> RandomImageModel{
        print("data to parse:\(data)")
        let decoder = JSONDecoder()
        do
        {
            randomImage = try decoder.decode(RandomImageModel.self, from: data)
            return randomImage
        }
        catch
        {
            print(error.localizedDescription)
            return randomImage
        }
    }
}
