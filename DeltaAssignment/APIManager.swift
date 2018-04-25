//
//  APIManager.swift
//  DeltaAssignment
//
//  Created by Akshit Verma on 24/04/18.
//  Copyright © 2018 Akshit Verma. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager : NSObject{
    
    public static var sharedInstance = APIManager()
    
    
    /*--------BASE URL----------*/
    private let baseURL = URL(string: "http://dev.deltaapp.in/api/assignment")
    
    private override init() {
        super.init()
    }
    
    
    /*------------API Hit for MOVIES----------------*/
    func getProfileData( completion:@escaping (_ data: [[String:Any]], _ message: String) -> Void){
        guard let url = baseURL else{
            NSLog("No url found!")
            return
        }
        Alamofire.request(url, method: .get).validate().responseJSON { (response) -> Void in
            print(response)
            guard response.result.isSuccess else {
                NSLog("Error while fetching movies data: \(String(describing: response.result.error))" )
                completion([[:]], "Server error occured.")
                return
            }
            
            guard let value = response.result.value as? [[String: Any]] else {
                NSLog("Malformed data received from server")
                completion([[:]], "Malformed data received from server.")
                return
            }
            
            completion(value,"Success")
            
        }
    }
}
