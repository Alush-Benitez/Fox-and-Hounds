//
//  ViewController.swift
//  Chess Test
//
//  Created by Alush Benitez on 7/6/18.
//  Copyright © 2018 Alush Benitez. All rights reserved.
//

import UIKit

var checkerSquares: [CheckerSquare] = []
var blackSquares: [CheckerSquare] = []

var blueTurn = true


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var chessboardCollectionView: UICollectionView!
    
    let houndStart = [1, 3, 5, 7]
    
    var occupiedSquares: [CheckerSquare] = []
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chessboardCollectionView.dataSource = self
        chessboardCollectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 64
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Whats gonna be in each cell
        let cell = chessboardCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CheckerSquare
        
        if count == 56{
            cell.cellImage.image = UIImage(named: "blue-checker")
            occupiedSquares.append(cell)
            cell.isOccupied = true
            cell.color = "blue"
        } else if houndStart.contains(count){
            cell.cellImage.image = UIImage(named: "Red_checker")
            cell.isOccupied = true
            occupiedSquares.append(cell)
            cell.color = "red"
        } //else {
            //cell.cellImage.image = UIImage(named: "clear-image")
        //}
        
        checkerSquares.append(cell)
        
        if count < 8 || (count > 15 && count < 24) || (count > 31 && count < 40) || (count > 47 && count < 56){
            if count % 2 == 1 {
                blackSquares.append(cell)
            }
        } else {
            if count % 2 == 0 {
                blackSquares.append(cell)
            }
        }
        
        cell.position = count
        count += 1
        
        return cell
    }
}






class CheckerSquare: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    
    var isOccupied = false
    var position = -1
    var color = ""
    var isGreen = false
    
    
    
    override var isSelected: Bool{
        didSet{
            
            if isGreen {
                if blueTurn {
                    self.cellImage.image = UIImage(named: "blue-checker")
                } else {
                    self.cellImage.image = UIImage(named: "Red_checker")
                }
                blueTurn = !blueTurn
                self.isGreen = false
            }
            
            if isOccupied {
                if self.isSelected {
                    self.contentView.backgroundColor = UIColor.gray
                    var movementOptions: [CheckerSquare] = []
                    
                    if self.color == "red" {
                        movementOptions = findAvalibleBottomSquares(position: self.position)
                    } else {
                        movementOptions = findAvalibleTopSquares(position: self.position)
                        movementOptions += findAvalibleBottomSquares(position: self.position)
                    }
                    for cell in movementOptions {
                        cell.contentView.backgroundColor = UIColor.green
                        cell.isGreen = true
                    }
                    
                } else {
                    self.contentView.backgroundColor = UIColor.black
                    
                    for checker in blackSquares {
                        checker.contentView.backgroundColor = UIColor.black
                        //checker.isGreen = false
                    }
                }
            }
        }
    }
    
    
    
    
    func findAvalibleTopSquares(position: Int) -> [CheckerSquare]{
        let row = (position + 8) / 8
        let firstInRow = (row * 8)
        let lastInRow = ((row + 1) * 8) - 1
        
        let topRight = position - 7
        let topLeft = position - 9
        
        var avalible: [CheckerSquare] = []
        
        if !(topLeft < 0 || topLeft < firstInRow) {
            avalible.append(checkerSquares[topLeft])
        }
        if !(topRight < 0 || topRight > lastInRow) {
            avalible.append(checkerSquares[topRight])
        }
        
        return avalible
    }
    
    func findAvalibleBottomSquares(position: Int) -> [CheckerSquare]{
        let row = (position + 8) / 8
        let firstInRow = (row * 8)
        let lastInRow = ((row + 1) * 8) - 1
        
        let bottomRight = position + 9
        let bottomLeft = position + 7
        
        var avalible: [CheckerSquare] = []
        
        if !(bottomLeft > 63 || bottomLeft < firstInRow) {
            avalible.append(checkerSquares[bottomLeft])
        }
        if !(bottomRight > 63 || bottomRight > lastInRow) {
            avalible.append(checkerSquares[bottomRight])
        }
        
        return avalible
    }
    
}

