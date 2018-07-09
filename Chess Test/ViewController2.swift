//
//  ViewController2.swift
//  Chess Test
//
//  Created by Alush Benitez on 7/8/18.
//  Copyright © 2018 Alush Benitez. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var totalMoves = 0
    var redMoves = 0
    var blueMovesForwards = 0
    var blueMovesBackwards = 0
    
    @IBOutlet weak var winnerTitle: UILabel!
    @IBOutlet weak var totalMovesLabel: UILabel!
    @IBOutlet weak var redMovesLabel: UILabel!
    @IBOutlet weak var blueMovesForwardLabel: UILabel!
    @IBOutlet weak var blueMovesBackwardLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalMovesLabel.text = String(totalMoves)
        redMovesLabel.text = String(redMoves)
        blueMovesForwardLabel.text = String(blueMovesForwards)
        blueMovesBackwardLabel.text = String(blueMovesBackwards)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 

}
