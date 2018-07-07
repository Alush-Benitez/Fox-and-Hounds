//
//  ViewController.swift
//  Chess Test
//
//  Created by Alush Benitez on 7/6/18.
//  Copyright © 2018 Alush Benitez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var chessboardCollectionView: UICollectionView!
    
    let houndStart = [1, 3, 5, 7]
    
    var whiteSquares: [Int] = []
    var blackSquares: [Int] = []
    
    var checkerSquares: [CheckerSquare] = []
    var occupiedSquares: [CheckerSquare] = []
    
    var blueTurn = true

    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chessboardCollectionView.dataSource = self
        chessboardCollectionView.delegate = self
        //chessboardCollectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
        
        for num in 0 ... 63 {
            if num % 2 == 1 {
                blackSquares.append(num)
            } else {
                whiteSquares.append(num)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        } else if houndStart.contains(count){
            cell.cellImage.image = UIImage(named: "Red_checker")
            cell.isOccupied = true
            occupiedSquares.append(cell)
        } else {
            cell.cellImage.image = UIImage(named: "clear-image")
        }
        
        checkerSquares.append(cell)
        
        count += 1
        
        return cell
    }
}

