//
//  CheckerSquare.swift
//  Chess Test
//
//  Created by Alush Benitez on 7/6/18.
//  Copyright © 2018 Alush Benitez. All rights reserved.
//

import UIKit

class CheckerSquare: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected {
                self.contentView.backgroundColor = UIColor.gray
            } else {
                self.contentView.backgroundColor = UIColor.black
                
            }
        }
    }
    
}
