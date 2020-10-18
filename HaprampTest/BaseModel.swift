//
//  BaseModel.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation

//MARK: Each view have to register itself to notify any response and should be unregister when moves out
class BaseModel{
    static let sharedInstanceBaseModel = BaseModel()
    var registerdViews : [UpdateViewProtocol]
    
    init(){
        registerdViews = []
    }
    
    func registerView(notifier : UpdateViewProtocol) {
        registerdViews.append(notifier)
    }
    
    func unregisterAllViews(){
        registerdViews.removeAll()
    }
    
    func unregisterView(notifier : UpdateViewProtocol) {
        var count:Int = 0
        for view in registerdViews {
            if view.isEqual(notifier) {
                registerdViews.remove(at: count)
                break;
            }
            count += 1
        }
    }
    
    func notifyView(event:Int, eventtype: Int) {
        for view in registerdViews
        {
            view.updateView(event: event, eventtype: eventtype)
        }
    }
}
