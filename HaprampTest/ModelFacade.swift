//
//  ModelFacade.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation

//MARK: Get Response In Model
class ModelFacade{
    static let sharedInstanceModelFacade = ModelFacade()
    
    private let authHits:AuthHits
    private let connectionModel:ConnectionModel
    private let list : ListParseModel
    private let randomImage: RandomImageParseModel

   
    private init(){
        authHits = AuthHits()
        list = ListParseModel()
        connectionModel = ConnectionModel()
        randomImage = RandomImageParseModel()
       
    }
    
    func getConnectionModel()->ConnectionModel{
        return connectionModel
    }
    
    func getAuthHits()->AuthHits{
           return authHits
    }
    
    func getListModel()->ListParseModel
    {
        return list
    }
    
    func getRandomImage()->RandomImageParseModel {
        return randomImage
    }
    
}
