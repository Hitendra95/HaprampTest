//
//  Handlers.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation

class Handler{
    
    static let handlerSharedInstance = Handler()
    func getHandlers(eventType: Int,eventName: String) -> AppHandler
    {

        let handler = EventHanlders(type: eventType,name: eventName)
        return handler
    }
}

//MARK: Event Handler class handle all the events we receive from api call from success to error
class EventHanlders: AppHandler
{
    let eventId : Int!
    let eventName: String!
    
    init(type: Int,name: String)
    {
        self.eventId = type
        self.eventName = name
    }
    
    //handle when data is of type Data
    func handleMessage(data: Data){
        BaseModel.sharedInstanceBaseModel.notifyView(event: eventId, eventtype: ConnectionModel.EVENT_TYPE_SUCCESS)
    }
    //handle when data is of type Dictionary
    func handleMessage(data: Dictionary<String, AnyObject>) {
        switch eventId{
        case NetworkEvents.EVENT_GET_RandomImage:
            let _ = ModelFacade.sharedInstanceModelFacade.getRandomImage().parseUser(data: data)
        default:
            print("test")
        }
        BaseModel.sharedInstanceBaseModel.notifyView(event: eventId, eventtype: ConnectionModel.EVENT_TYPE_SUCCESS)
    }
    //handle when data is of type Array of object
    func handleMessage(data: Array<AnyObject>) {
        switch eventId {
        case NetworkEvents.EVENT_GET_LIST:
            let _ = ModelFacade.sharedInstanceModelFacade.getListModel().parseUser(data: data)
        default:
            print("test")
        }
        BaseModel.sharedInstanceBaseModel.notifyView(event: eventId, eventtype: ConnectionModel.EVENT_TYPE_SUCCESS)
    }
    
    //handle server error
    func handleServerError(data: Dictionary<String,AnyObject>) {
        BaseModel.sharedInstanceBaseModel.notifyView(event: eventId, eventtype: ConnectionModel.EVENT_TYPE_ERROR)
    }
    //handle parse error
    func handleParseError(data: String) {
        ModelFacade.sharedInstanceModelFacade.getConnectionModel().errorMessage = data
        BaseModel.sharedInstanceBaseModel.notifyView(event: eventId, eventtype: ConnectionModel.EVENT_TYPE_ERROR)
    }
    
    //handle network error
    func handleNetworkError() {
        BaseModel.sharedInstanceBaseModel.notifyView(event: eventId, eventtype: ConnectionModel.EVENT_TYPE_NETWORKERROR)
    }
}
