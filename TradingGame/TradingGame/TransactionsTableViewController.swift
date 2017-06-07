//
//  TransactionsTableViewController.swift
//  TradingGame
//
//  Created by Jessica Douma on 6/7/17.
//  Copyright © 2017 Jessica Douma. All rights reserved.
//

import UIKit

class TransactionsTableViewController: UITableViewController, UITextFieldDelegate {
    
    // Stepper variables
    @IBOutlet weak var redStepper: UIStepper!
    @IBOutlet weak var whiteStepper: UIStepper!
    @IBOutlet weak var blueStepper: UIStepper!
    @IBOutlet weak var onyxStepper: UIStepper!
    @IBOutlet weak var emeraldStepper: UIStepper!
    @IBOutlet weak var pearlStepper: UIStepper!
    @IBOutlet weak var moneyStepper: UIStepper!
    
    // Textfield variables
    @IBOutlet weak var teamToTrade: UITextField!
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var whiteValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    @IBOutlet weak var onyxValue: UILabel!
    @IBOutlet weak var emeraldValue: UILabel!
    @IBOutlet weak var pearlValue: UILabel!
    @IBOutlet weak var moneyValue: UILabel!
    @IBOutlet weak var clue1: UITextField!
    @IBOutlet weak var clue2: UITextField!
    @IBOutlet weak var clue3: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    // Update textfield values
    @IBAction func updateRed(_ sender: Any) {
        redValue.text = String(Int(redStepper.value))
    }
    @IBAction func updateWhite(_ sender: Any) {
        whiteValue.text = String(Int(whiteStepper.value))
    }
    @IBAction func updateBlue(_ sender: Any) {
        blueValue.text = String(Int(blueStepper.value))
    }
    @IBAction func updateOnyx(_ sender: Any) {
        onyxValue.text = String(Int(onyxStepper.value))
    }
    @IBAction func updateEmerald(_ sender: Any) {
        emeraldValue.text = String(Int(emeraldStepper.value))
    }
    @IBAction func updatePearl(_ sender: Any) {
        pearlValue.text = String(Int(pearlStepper.value))
    }
    @IBAction func updateMoney(_ sender: Any) {
        moneyValue.text = String(Int(moneyStepper.value))
    }
    
    // Clear textfield values when transaction is sent
    @IBAction func sendItems(_ sender: Any) {
        teamToTrade.text = ""
        redValue.text = "0"
        whiteValue.text = "0"
        blueValue.text = "0"
        onyxValue.text = "0"
        emeraldValue.text = "0"
        pearlValue.text = "0"
        moneyValue.text = "0"
        clue1.text = ""
        clue2.text = ""
        clue3.text = ""
        
        
        // Alert user that transaction was sent
        let alert: UIAlertController = UIAlertController(title: "Transaction Sent!", message: "You can view the changes in the items and clue tabs.", preferredStyle: .alert)
        
        let action1: UIAlertAction = UIAlertAction(title: "Okay", style: .default) { (_:UIAlertAction) in
            print("okay")
        }
        
        alert.addAction(action1)
        
        self.present(alert, animated: true) { 
            print("present complete")
        }
        
    }
    
    // Dismisses keyboard if user clicks return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        teamToTrade.resignFirstResponder()
        clue1.resignFirstResponder()
        clue2.resignFirstResponder()
        clue3.resignFirstResponder()
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let numberOfRowsAtSection: [Int] = [3,3,1,3]
        
        return numberOfRowsAtSection[section]
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
