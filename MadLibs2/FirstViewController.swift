//
//  FirstViewController.swift
//  MadLibs2
//
//  Created by Jidde Koekoek on 24/04/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
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

extension FirstViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.table.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        cell.customLabel.text = data[indexPath.row]
        
        return cell
    }
}

extension FirstViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {

        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            
            if segue.identifier == "firstSegue" {
                if let svc = segue.destinationViewController as? SecondViewController {
                    svc.index = indexPath.row
                    print(indexPath.row)
                }
            }
        }
        performSegueWithIdentifier("firstSegue", sender: self)
    }
}










