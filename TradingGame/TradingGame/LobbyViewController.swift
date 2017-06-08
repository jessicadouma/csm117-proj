//
//  LobbyViewController.swift
//  TradingGame
//
//  Created by Jessica Douma on 6/6/17.
//  Copyright © 2017 Jessica Douma. All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController {
    var client: ClientTradingGame!
    
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
        client = ClientTradingGame(connect: teamName, toHost: hostName, onPort: 1024)
        
        client.write(message: client.name)
        
        let responses = client.read()
        
        for response in responses {
            if let r = response {
                print(r)
            } else {
                print("Could not read from server")
            }
        }
        
        if client.roundActive == false {
            let responses = client.read()
            
            for response in responses {
                if let r = response {
                    print(r)
                } else {
                    print("Could not read from server")
                }
            }
        }
        
        performSegue(withIdentifier: "instructionSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "instructionSegue" {
            let vc = segue.destination as! Instruction1ViewController
            
            vc.client = client
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
