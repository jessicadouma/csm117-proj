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
    
    // Store hostname
    @IBAction func enteredHost(_ sender: Any) {
        hostName = hostField.text!
    }
    
    // Store team name
    @IBAction func enteredTeam(_ sender: Any) {
        teamName = teamField.text!
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

