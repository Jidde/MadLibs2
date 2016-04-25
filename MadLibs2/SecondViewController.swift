//
//  SecondViewController.swift
//  MadLibs2
//
//  Created by Jidde Koekoek on 23/04/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//  SecondViewController

import UIKit
import Foundation

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var wordsLeft: UILabel!
    
    // Cell index number
    var index: Int?
    
    // instance of the Story Class
    var story: Story!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var number = 0
        
        if index != nil {
            number = index!
        }
        
        /// function to import the text
        func importTheText (number: Int) -> String {
            
            let textNames = ["madlib0_simple", "madlib1_tarzan", "madlib2_university", "madlib3_clothes", "madlib4_dance"]
            
            var text: String?
            
            if let path: String = NSBundle.mainBundle().pathForResource(textNames[number], ofType: "txt") {
                do {
                    text = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                    if text != nil {
                        return text!
                    }
                } catch {
                    print("Error, you fucked up!")
                    /* error handling here */
                }
            }
            return "error"
        }
        
        let text = importTheText(number)
        
        // read text in class function
        story = Story(stream: text)
        story.read(text)
        
        // show the words left
        wordsLeft.text = "\(story.getPlaceholderCount()) word(s) left"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// fills in words in the story
    @IBAction func appendWord(sender: AnyObject) {
        
        // get next placeholder and fill in the placeholder
        story.getNextPlaceholder()
        if textField != nil {
            story.fillInPlaceholder(textField.text!)
        }
        
        // show words left in label
        wordsLeft.text = "\(story.getPlaceholderRemainingCount()) word(s) left"

        // if all the placeholders are filled, perform segue
        if story.isFilledIn() == true {
            self.performSegueWithIdentifier("secondSegue", sender: self)
        }
    }
    
    /// prepare for segue, parse the story
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "secondSegue") {
            
            if let tvc = segue.destinationViewController as? ThirdViewController {
                tvc.variable = story.toString()
            }
        }
    }
}








