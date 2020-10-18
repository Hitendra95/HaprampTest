//
//  AppHandler.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation

//MARK: All Handler handled cases
protocol AppHandler {
    func handleMessage(data: Data)
    func handleMessage(data:Array<AnyObject>)
    func handleServerError(data:Dictionary<String,AnyObject>)
    func handleParseError(data:String)
    func handleNetworkError()
}
