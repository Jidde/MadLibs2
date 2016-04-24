//
//  ThirdViewController.swift
//  MadLibs2
//
//  Created by Jidde Koekoek on 23/04/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//  ThirdViewController

import UIKit

class ThirdViewController: UIViewController {
    
    var variable: String?
    
    @IBOutlet weak var storyField: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if variable != nil {
            storyField.text = variable
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func makeNewStory(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        /*
            STUFF NAAR DELEGATE
        */
        
    }
}
