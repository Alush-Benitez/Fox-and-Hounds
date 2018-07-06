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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chessboardCollectionView.dataSource = self
        chessboardCollectionView.delegate = self
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
        
        cell.cellImage.image = UIImage(named: "clearness")
        return cell
        
    }
    

}

