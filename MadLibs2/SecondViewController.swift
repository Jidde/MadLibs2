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
    var wordsArray: [String] = []
    @IBOutlet weak var wordsLeft: UILabel!
    
    var index: Int?
    
    var story: Story!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var number = 0
        
        if index != nil {
            number = index!
        }
        
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
            
        story = Story(stream: text)
        story.read(text)
        
        wordsLeft.text = "\(story.getPlaceholderCount()) word(s) left"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func appendWord(sender: AnyObject) {
        wordsArray.append(textField.text!)
        
        story.getNextPlaceholder()
        if textField != nil {
            story.fillInPlaceholder(textField.text!)
        }
        
        wordsLeft.text = "\(story.getPlaceholderRemainingCount()) word(s) left"

        
        if story.isFilledIn() == true {
            self.performSegueWithIdentifier("secondSegue", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "secondSegue") {
            
            if let tvc = segue.destinationViewController as? ThirdViewController {
                tvc.variable = story.toString()
            }
        }
    }
}








