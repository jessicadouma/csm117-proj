//
//  ViewController.swift
//  TradingGame
//
//  Created by Jessica Douma on 6/6/17.
//  Copyright © 2017 Jessica Douma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // connect vars here
    @IBOutlet weak var hostField: UITextField!
    @IBOutlet weak var teamField: UITextField!
    
    var hostName: String!
    var teamName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    // Dismisses keyboard if user touches outside of textfields
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // Dismisses keyboard if user clicks return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hostField.resignFirstResponder()
        teamField.resignFirstResponder()
        return false
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "joinGameSegue" {
            guard let host = hostField.text else { return false }
            guard let team = teamField.text else { return false }
            
            if team.isEmpty || host.isEmpty {
                // Alert user that transaction was received
                let alert: UIAlertController = UIAlertController(title: "Error", message: "You must enter a hostname and team name to proceed", preferredStyle: .alert)
                
                let action1: UIAlertAction = UIAlertAction(title: "Okay", style: .default) { (_:UIAlertAction) in
                    print("okay")
                }
                
                alert.addAction(action1)
                
                self.present(alert, animated: true) {
                    print("present complete")
                }

                
                return false
            }
            
            hostName = host
            teamName = team
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "joinGameSegue" {
            let vc = segue.destination as! LobbyViewController

            vc.hostName = hostName
            vc.teamName = teamName
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

