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
    
    let blueStart = [1, 3, 5, 7, 8, 10, 12, 14, 17, 19, 21, 23]
    let redStart = [41, 43, 45, 47, 48, 50, 52, 54, 57, 59, 61, 63]
    
    var whiteSquares: [Int] = []
    var blackSquares: [Int] = []

    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chessboardCollectionView.dataSource = self
        chessboardCollectionView.delegate = self
        
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
        
        if blueStart.contains(count){
            cell.cellImage.image = UIImage(named: "blue-checker")
        } else if redStart.contains(count){
            cell.cellImage.image = UIImage(named: "Red_checker")
        } else {
            cell.cellImage.image = UIImage(named: "clear-image")
        }
        
        count += 1
        
        return cell
        
    }
    

}

