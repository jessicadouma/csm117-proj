//
//  Instruction2ViewController.swift
//  TradingGame
//
//  Created by Jessica Douma on 6/6/17.
//  Copyright © 2017 Jessica Douma. All rights reserved.
//

import UIKit

class Instruction2ViewController: UIViewController {
    var client: ClientTradingGame!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func readyToPlay(_ sender: Any) {
        let mainST = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainST.instantiateViewController(withIdentifier: "myTabBar") as! MyTabBarController

        vc.client = client
        present(vc, animated: true, completion: nil)
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
