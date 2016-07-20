//
//  GenreCell.swift
//  Emoji Keyboard
//
//  Created by Randy Perecman on 7/19/16.
//  Copyright © 2016 OnMilwaukee. All rights reserved.
//

import UIKit

var name: String = ""
class GenreCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var GenreImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 25
      
        
    }

    
}
