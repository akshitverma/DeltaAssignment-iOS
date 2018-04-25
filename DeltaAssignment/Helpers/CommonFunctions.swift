//
//  CommonFunctions.swift
//  DeltaAssignment
//
//  Created by Akshit Verma on 24/04/18.
//  Copyright © 2018 Akshit Verma. All rights reserved.
//


import Foundation
import UIKit

class CommonFunctions: NSObject{
    
    
    
    static let sharedInstance = CommonFunctions()
    
    var activityIndicator = UIActivityIndicatorView()
    let navBar = Bundle.main.loadNibNamed("NavigationView", owner: self, options: nil)?.first as! NavigationView
    
    func showActivityindicator(){
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator(){
        activityIndicator.stopAnimating()
    }
    
    func setUpActivityIndicator(view: UIView){
        activityIndicator.color = UIColor.black
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2)
        view.addSubview(activityIndicator)
    }
    
    
    
}
