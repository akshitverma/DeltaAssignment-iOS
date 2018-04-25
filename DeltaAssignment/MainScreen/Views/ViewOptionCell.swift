//
//  ViewOptionCell.swift
//  DeltaAssignment
//
//  Created by Akshit Verma on 24/04/18.
//  Copyright © 2018 Akshit Verma. All rights reserved.
//

import UIKit

class ViewOptionCell: UITableViewCell {

    // ****** Outlets ******* //
    
    @IBOutlet weak var viewNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
       
    }

    func setUpCell(viewName: String){
        viewNameLabel.text = viewName
    }
    
}
