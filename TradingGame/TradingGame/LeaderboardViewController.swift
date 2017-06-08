//
//  LeaderboardViewController.swift
//  TradingGame
//
//  Created by Jessica Douma on 6/7/17.
//  Copyright © 2017 Jessica Douma. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController {

    @IBOutlet weak var team1: UILabel!
    @IBOutlet weak var team2: UILabel!
    @IBOutlet weak var team3: UILabel!
    @IBOutlet weak var team4: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        team1.text = "Jessica Rocks"
        team2.text = "Fern drools"
        team3.text = "Jess is the best"
        team4.text = "fern's a hater"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
