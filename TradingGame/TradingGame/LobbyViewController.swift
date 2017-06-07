//
//  LobbyViewController.swift
//  TradingGame
//
//  Created by Jessica Douma on 6/6/17.
//  Copyright © 2017 Jessica Douma. All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController {
    
    var hostName: String!
    var teamName: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        waitingForLobbyToFill()
    }
    
    // Performs segue when all teams have joined lobby
    private func waitingForLobbyToFill() {
        sleep(3)
        
        performSegue(withIdentifier: "instructionSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "instructionSegue" {
            let vc = segue.destination as! Instruction1ViewController
            
            vc.hostName = hostName
            vc.teamName = teamName
        }
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
