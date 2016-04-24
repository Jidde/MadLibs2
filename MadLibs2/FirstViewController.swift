//
//  FirstViewController.swift
//  MadLibs2
//
//  Created by Jidde Koekoek on 24/04/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//  FirstViewController

import UIKit

class FirstViewController: UIViewController {
    
    // array with the titles
    let data = ["Simple", "Tarzan", "University", "Clothes", "Dance"]
    
    @IBOutlet weak var table: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// extension for datasource
extension FirstViewController: UITableViewDataSource {
    
    // # of tables rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
    }
    
    // cells
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.table.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        cell.customLabel.text = data[indexPath.row]
        
        return cell
    }
}
// extension delegate
extension FirstViewController: UITableViewDelegate {
    
    // did select row
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("firstSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == "firstSegue" {
            if let svc = segue.destinationViewController as? SecondViewController {
                let indexPath = table.indexPathForSelectedRow
                svc.index = indexPath!.row
            }
        }
    }
}









