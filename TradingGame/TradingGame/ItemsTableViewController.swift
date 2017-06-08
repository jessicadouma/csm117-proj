//
//  ItemsTableViewController.swift
//  TradingGame
//
//  Created by Jessica Douma on 6/7/17.
//  Copyright © 2017 Jessica Douma. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    var client: ClientTradingGame!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var whiteLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var OnyxLabel: UILabel!
    @IBOutlet weak var EmeraldsLabel: UILabel!
    @IBOutlet weak var PearlsLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tbc = self.tabBarController as! MyTabBarController
        client = tbc.client
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateChips()
        updateGems()
        updateMoney()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let numberOfRowsAtSection: [Int] = [3,3,1]
        
        return numberOfRowsAtSection[section]
    }

    private func updateChips() {
        if let redChipAmount = client.chips["Red"] {
            redLabel.text = String(redChipAmount)
        }
        
        if let whiteChipAmount = client.chips["White"] {
            whiteLabel.text = String(whiteChipAmount)
        }
        
        if let blueChipAmount = client.chips["Blue"] {
            blueLabel.text = String(blueChipAmount)
        }
    }
    
    private func updateGems() {
        if let onyxGemAmount = client.gems["Onyx"] {
            OnyxLabel.text = String(onyxGemAmount)
        }
        
        if let emeraldsGemAmount = client.gems["Emeralds"] {
            EmeraldsLabel.text = String(emeraldsGemAmount)
        }
        
        if let pearlsGemAmount = client.gems["Pearls"] {
            PearlsLabel.text = String(pearlsGemAmount)
        }
    }
    
    private func updateMoney() {
        moneyLabel.text = String(client.purse)
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
