//
//  ViewController.swift
//  Chess Test
//
//  Created by Alush Benitez on 7/6/18.
//  Copyright © 2018 Alush Benitez. All rights reserved.
//

import UIKit


//GLOBAL VARIABLES
var checkerSquares: [CheckerSquare] = []
var blackSquares: [CheckerSquare] = []

var lastClicked: CheckerSquare? = nil
var lastMovementOptions: [CheckerSquare] = []
var firstWinCheck = true

var blueTurn = true
var hasWinner = false

//STATS FOR END GAME
var totalMoves = 0
var timeSpent = 0
var redTurnTime = 0
var blueTurnTime = 0
var blueMovesForwards = 0
var blueMovesBackwards = 0
var redMoves = 0


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var chessboardCollectionView: UICollectionView!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var showStatsLabel: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    let houndStart = [1, 3, 5, 7]
    
    var occupiedSquares: [CheckerSquare] = []
    
    var count = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        chessboardCollectionView.dataSource = self
        chessboardCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showStatsLabel.setTitle("", for: UIControlState.normal)
        resetButton.setTitle("", for: UIControlState.normal)
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
        }
        
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
    /*
    func displayMessage(message:String){
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Return to Board", style: .default) {
            (action) -> Void in self.addButtons()
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
 */
    
    func addButtons(){
        //showStatsLabel.setTitle("Show Stats", for: UIControlState.normal)
        //resetButton.setTitle("Reset", for: UIControlState.normal)
        winnerLabel.text = "blah blah wins! yay"
    }
    
    @IBAction func whenStatsClicked(_ sender: Any) {
    }
    
    @IBAction func whenResetClicked(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! ViewController2
        dvc.data = "This came from the second VC"
    }
 
    
}






//CHECKER SQUARE CLASS

class CheckerSquare: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    
    var isOccupied = false
    var position = -1
    var color = ""
    var isGreen = false
    
    
    
    override var isSelected: Bool{
        didSet{
            if !hasWinner {
                if isGreen {
                    if blueTurn {
                        self.cellImage.image = UIImage(named: "blue-checker")
                        self.color = "blue"
                        print(position)
                        if position / 8 == 0 {
                            print("nkfjsadlknfbkjhafklndsvdkifklasv")
                            hasWinner = true
                            //ViewController().displayMessage(message: "Blue Wins!")
                            //ViewController().addButtons()
                        }
                    } else {
                        self.cellImage.image = UIImage(named: "Red_checker")
                        self.color = "red"
                    }
                    self.isOccupied = true
                    lastClicked?.isOccupied = false
                    lastClicked?.cellImage.image = nil
                    blueTurn = !blueTurn
                    for square in blackSquares {
                        square.isGreen = false
                    }
                }
            
                if isOccupied {
                    if self.isSelected {
                        lastClicked = self
                        if blueTurn && self.color == "blue" {
                            lastMovementOptions = setUpGreenSquares()
                        } else if !blueTurn && self.color == "red" {
                            setUpGreenSquares()
                        }
                    } else {
                        self.contentView.backgroundColor = UIColor.black
                        
                        for checker in blackSquares {
                            checker.contentView.backgroundColor = UIColor.black
                        }
                    }
                }
                /*
                if blueTurn && self.color == "blue" {
                    if lastMovementOptions.count == 0 {
                        hasWinner = true
                        //ViewController().displayMessage(message: "Red Wins!")
                        //ViewController().addButtons()
                    }
                }
                */
 
            }
        }
    }
    
    
    
    
    
    func setUpGreenSquares() -> [CheckerSquare] {
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
        
        return movementOptions
    }
    
    
    
    func findAvalibleTopSquares(position: Int) -> [CheckerSquare]{
        let row = (position - 8) / 8
        let firstInRow = (row * 8)
        let lastInRow = ((row + 1) * 8) - 1
        
        let topRight = position - 7
        let topLeft = position - 9
        
        var avalible: [CheckerSquare] = []
        
        if (!(topLeft < 0 || topLeft < firstInRow)) && checkerSquares[topLeft].isOccupied == false{
            avalible.append(checkerSquares[topLeft])
        }
        if (!(topRight < 0 || topRight > lastInRow)) && checkerSquares[topRight].isOccupied == false {
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
        
        if (!(bottomLeft > 63 || bottomLeft < firstInRow)) && checkerSquares[bottomLeft].isOccupied == false {
            avalible.append(checkerSquares[bottomLeft])
        }
        if (!(bottomRight > 63 || bottomRight > lastInRow)) && checkerSquares[bottomRight].isOccupied == false {
            avalible.append(checkerSquares[bottomRight])
        }
        
        return avalible
    }
}

