//
//  AuthHits.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation
import Alamofire

//MARK: Make api call and pass the handler of that api call
class AuthHits{
    let conn : ConnectionHandler = ConnectionHandler()
    func GetList(data : Dictionary<String, AnyObject>!,handler:AppHandler)
    {
        conn.makeHttpRequest(url: URls.baseUrl+URls.List_Fetch_Path, reqtype: .get, data: data, handler: handler, retrycount: Constants.MAX_RETRY_LIMIT)
    }
    
    func getRandomImage(data : Dictionary<String, AnyObject>!,handler: AppHandler){
        
        conn.makeHttpRequest(url: URls.baseUrl+URls.Get_Random_Photo, reqtype: .get, data: data, handler: handler, retrycount: Constants.MAX_RETRY_LIMIT)
        
    }
}
