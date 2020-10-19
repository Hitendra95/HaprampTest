//
//  ConnectionHandler.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//
import Foundation
import Alamofire


class ConnectionHandler{
    
    var errorMessage : String = ""
    
    //MARK: MAke API call
    func makeHttpRequest(url: String, reqtype: HTTPMethod,handler:AppHandler, retrycount:Int){
        if retrycount > 0{
            let params = ["client_id":"D-me78N7gO814UXNRDS96J12JuKyYMBjv_gbV03X7Jw"]
            print("URL",url)
            AF.request(url, method: reqtype,parameters: params).responseJSON {
                response in
                print("res",response.result)
                switch response.result {
                case .success:
                    
                    if let data = response.value as? Array<AnyObject>{
                    print("test",data)
                    handler.handleMessage(data: data)
                    }else{
                        guard let data = response.value as? Dictionary<String,AnyObject> else {return}
                        print("test")
                        handler.handleMessage(data: data)
                    }
                    break
                case .failure(let error):
                    print(error)
                    self.errorMessage = error.localizedDescription
                    if self.errorMessage == Constants.ERROR_TIMEOUT{
                        handler.handleParseError(data: error.localizedDescription)
                    }else{
                        let count = retrycount - 1
                        self.makeHttpRequest(url: url, reqtype: reqtype,handler: handler,retrycount: count)
                    }
                }
            }
        }else{
            handler.handleParseError(data: errorMessage)
        }
    }
    
}

