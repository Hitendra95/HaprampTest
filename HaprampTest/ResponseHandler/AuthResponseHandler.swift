//
//  AuthResponseHandler.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation

class AuthResponseHandler{
    
    static let sharedInstanceResponseHandler = AuthResponseHandler()
    let handler = Handler.handlerSharedInstance
    private init(){
        
    }
    
    //MARK: Get Handler of particlur API
    func getListHandler()->AppHandler{
        
        return handler.getHandlers(eventType: NetworkEvents.EVENT_GET_LIST,eventName: NetworkEventsName.EVENT_GET_LIST)

    }
    
    func getRandomImageHandler()-> AppHandler{
        return handler.getHandlers(eventType: NetworkEvents.EVENT_GET_RandomImage, eventName: NetworkEventsName.EVENT_GET_RandomImage)
    }
}
