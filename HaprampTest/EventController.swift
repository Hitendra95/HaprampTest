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
    func handleEvent(eventid : Int) {
        switch eventid {
        case NetworkEvents.EVENT_GET_LIST:
            ModelFacade.sharedInstanceModelFacade.getAuthHits().GetList(handler: AuthResponseHandler.sharedInstanceResponseHandler.getListHandler())
        case NetworkEvents.EVENT_GET_RandomImage:
            ModelFacade.sharedInstanceModelFacade.getAuthHits().getRandomImage(handler: AuthResponseHandler.sharedInstanceResponseHandler.getRandomImageHandler())
        default:
            print("INSIDE DEFAULT EVENT")
        }
    }
    
}
