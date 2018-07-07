//
//  CheckerSquare.swift
//  Chess Test
//
//  Created by Alush Benitez on 7/6/18.
//  Copyright © 2018 Alush Benitez. All rights reserved.
//

import UIKit
/*
class CheckerSquare: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    
    var isOccupied = false
    var color = ""
    var pieceToMove: CheckerSquare? = nil
    var position = -1
    let allSquares = getCheckerSquaresArray()
    
    override var isSelected: Bool{
        didSet{
            if isOccupied {
                if self.isSelected {
                    self.contentView.backgroundColor = UIColor.gray
                    var movementOptions: [Int] = []
                    
                    if color == "red" {
                        movementOptions = findAvalibleBottomSquares(position: position)
                    } else {
                        movementOptions = findAvalibleTopSquares(position: position)
                        movementOptions += findAvalibleBottomSquares(position: position)
                    }
                    for cell in movementOptions {
                        cell.contentView.backgroundColor = UIColor.green
                    }
                } else {
                    self.contentView.backgroundColor = UIColor.black
                }
            }
        }
    }
    
    func findAvalibleTopSquares(position: Int) -> [Int]{
        let row = position / 8
        let firstInRow = row * 8
        let lastInRow = ((row + 1) * 8) - 1
        
        let bottomRight = position + 9
        let bottomLeft = position + 7
        
        var avalible: [Int] = []
        
        if !(bottomLeft > 63 || bottomLeft < firstInRow) {
            avalible.append(bottomLeft)
        }
        if bottomRight > 63 || bottomRight > lastInRow {
            avalible.append(bottomRight)
        }
        
        return avalible
    }
    
    func findAvalibleBottomSquares(position: Int) -> [Int]{
        let row = position / 8
        let firstInRow = row * 8
        let lastInRow = ((row + 1) * 8) - 1
        
        let bottomRight = position + 9
        let bottomLeft = position + 7
        
        var avalible: [Int] = []
        
        if !(bottomLeft > 63 || bottomLeft < firstInRow) {
            avalible.append(bottomLeft)
        }
        if bottomRight > 63 || bottomRight > lastInRow {
            avalible.append(bottomRight)
        }
        
        return avalible
    }
    
}
*/
