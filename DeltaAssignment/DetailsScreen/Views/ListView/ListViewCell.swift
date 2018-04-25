//
//  ListViewCell.swift
//  DeltaAssignment
//
//  Created by Akshit Verma on 24/04/18.
//  Copyright © 2018 Akshit Verma. All rights reserved.
//

import UIKit
import Kingfisher

class ListViewCell: UITableViewCell {

    // Outlets //
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.selectionStyle = .none
    }

    func setUpCell(imageUrl: String, name: String, email: String){
       
        
        //Setting Name and Email Label
        nameLabel.text = name
        emailLabel.text = email
        
        
        /* Using Kingfisher to setImage on ImageView via URL async

         Kingfisher will download the image from url, send it to both the memory cache and the disk cache, and display it in imageView.
         When you use the same code later, the image will be retrieved from cache and shown immediately.
         
         */
        let url = URL(string: imageUrl)
        profileImage.kf.setImage(with: url)
        profileImage.contentMode = .scaleAspectFit
        
       
    }
  
}
