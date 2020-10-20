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
    func handleMessage(data: Dictionary<String,AnyObject>)
    func handleServerError(data:Dictionary<String,AnyObject>)
    func handleParseError(data:String)
    func handleNetworkError()
}

//MARK: API header class
class API_Headers
{
    static let JSON_CONTENT_TYPE = "Content-Type"
    static let TYPE_JSON = "application/json"
    static let AUTHORIZATION = "Authorization"
}
