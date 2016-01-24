//
//  MenuViewController.swift
//  531
//
//  Created by Harry Liu on 2016-01-21.
//  Copyright © 2016 HarryLiu. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adds top margin 
        self.tableView.contentInset = UIEdgeInsetsMake(30, 0, 0, 0);
        
        //Changes color 
        self.tableView.backgroundColor = UIColor.init(red: 204.0/255.0, green: 51.0/255.0, blue: 63.0/255.0, alpha: 1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel!.textColor = UIColor.whiteColor()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
