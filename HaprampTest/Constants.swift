//
//  Constants.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation
class Constants {
    static let MAX_RETRY_LIMIT : Int = 2
    static let ERROR = "error"
    static let ERROR_TIMEOUT = "The request timed out."
    static let ERROR_NETWORK_ERROR = "Something went wrong. Please try again."
    static let KEY_STATUS_CODE = "statusCode"
    static let KEY_Page = "page"
}

class URls {
    static let baseUrl = "https://api.unsplash.com"
    static let List_Fetch_Path = "/photos"
    static let Get_Random_Photo = "/photos/random"
}
