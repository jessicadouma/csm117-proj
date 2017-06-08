//
//  CluesTableViewController.swift
//  TradingGame
//
//  Created by Jessica Douma on 6/7/17.
//  Copyright © 2017 Jessica Douma. All rights reserved.
//

import UIKit

class CluesTableViewController: UITableViewController {
    var client: ClientTradingGame!
    
    var labels = [UILabel]()
    @IBOutlet weak var clue1Label: UILabel!
    @IBOutlet weak var clue2Label: UILabel!
    @IBOutlet weak var clue3Label: UILabel!
    @IBOutlet weak var clue4Label: UILabel!
    @IBOutlet weak var clue5Label: UILabel!
    @IBOutlet weak var clue6Label: UILabel!
    @IBOutlet weak var clue7Label: UILabel!
    @IBOutlet weak var clue8Label: UILabel!
    @IBOutlet weak var clue9Label: UILabel!
    @IBOutlet weak var clue10Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tbc = self.tabBarController as! MyTabBarController
        client = tbc.client

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        labels.append(clue1Label)
        labels.append(clue2Label)
        labels.append(clue3Label)
        labels.append(clue4Label)
        labels.append(clue5Label)
        labels.append(clue6Label)
        labels.append(clue7Label)
        labels.append(clue8Label)
        labels.append(clue9Label)
        labels.append(clue10Label)
        
        for index in 0..<client.clues.count {
            labels[index].text = client.clues[index]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
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
