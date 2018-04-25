//
//  DataModel.swift
//  DeltaAssignment
//
//  Created by Akshit Verma on 24/04/18.
//  Copyright © 2018 Akshit Verma. All rights reserved.
//

import Foundation
import SwiftyJSON

class DataModel : NSObject{
    
    //MARK:- Properties
    
    var name : String = ""
    var email : String = ""
    var imageUrl : String = ""
 
    
    init(json: [String: Any]) {
        
        var jsonData = JSON(json)
        if let name = jsonData["name"].string{
            self.name = "\(name)"
        }
        
        if let email = jsonData["email"].string{
            self.email = email
        }
        
        if let rawImage = jsonData["image"].string{
           self.imageUrl = rawImage
        }

        
    }
    
}



