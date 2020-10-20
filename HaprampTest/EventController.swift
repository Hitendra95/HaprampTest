//
//  EventsController.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation

class EventsController{
    
    static let sharedInstanceAppController = EventsController()
    
    private init(){
        
    }
    
    //MARK: handler of particular event
    func handleEvent(eventid : Int,data : Dictionary<String, AnyObject>!) {
        switch eventid {
        //handler for getList
        case NetworkEvents.EVENT_GET_LIST:
            ModelFacade.sharedInstanceModelFacade.getAuthHits().GetList(data:data, handler: AuthResponseHandler.sharedInstanceResponseHandler.getListHandler())
        //handler for randomImage
        case NetworkEvents.EVENT_GET_RandomImage:
            ModelFacade.sharedInstanceModelFacade.getAuthHits().getRandomImage(data: data, handler: AuthResponseHandler.sharedInstanceResponseHandler.getRandomImageHandler())
        default:
            print("INSIDE DEFAULT EVENT")
        }
    }
    
}
