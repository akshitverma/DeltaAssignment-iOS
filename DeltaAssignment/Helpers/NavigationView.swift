//
//  NavigationView.swift
//  DeltaAssignment
//
//  Created by Akshit Verma on 25/04/18.
//  Copyright © 2018 Akshit Verma. All rights reserved.
//


import UIKit

class NavigationView: UIView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var leftButtonAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        leftButtonAction!()
    }
}


