//
//  ViewController.swift
//  Emoji Keyboard
//
//  Created by Luke Stevens on 2/1/16.
//  Copyright © 2016 OnMilwaukee. All rights reserved.
//

//
//  ViewController.swift
//  Vibe
//
//  Created by Randy Perecman on 6/28/16.
//  Copyright © 2016 Vibe, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        goButton.layer.cornerRadius = 15
        goButton.layer.borderColor = UIColor(colorLiteralRed: 52/255, green: 52/255, blue: 52/255, alpha: 1).CGColor
        goButton.layer.borderWidth = 1
        goButton.backgroundColor = UIColor.whiteColor()
        
        instructionsLabel.center.x -= view.bounds.width
        goButton.center.x -= view.bounds.width
        
        UIView.animateWithDuration(0.5, animations: {
            self.instructionsLabel.center.x += self.view.bounds.width
            self.goButton.center.x -= self.view.bounds.width
            
            
        })
        
        goButton.titleLabel!.font = UIFont(name: "Avenir Next", size: 15)
        instructionsLabel.font = UIFont(name: "Avenir Next", size: 17)
        
        
    }
    
    @IBAction func buttonDown(sender: UIButton) {
        goButton.backgroundColor = UIColor(colorLiteralRed: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        goButton.titleLabel?.textColor = UIColor.whiteColor()
    }
    
    @IBAction func buttonDone(sender: UIButton) {
    
   
        goButton.backgroundColor = UIColor.whiteColor()
        goButton.titleLabel?.textColor = UIColor(colorLiteralRed: 52/255, green: 52/255, blue: 52/255, alpha: 1)
    }


    var i = 0
    @IBAction func buttonPressed(sender: UIButton) {
        if i == 0 {
            instructionsLabel.text = "Hey! Follow this quick-start guide to start using vibe!"
            instructionsLabel.font = UIFont(name: "Varela Round", size: 17)
            UIView.animateWithDuration(0.5, animations:  {
                self.instructionsLabel.center.x += self.view.bounds.width
                self.goButton.center.x -= self.view.bounds.width
            })
            
            self.goButton.titleLabel!.font = UIFont(name: "Avenir Next", size: 15)
            self.instructionsLabel.font = UIFont(name: "Avenir Next", size: 17)
            self.goButton.backgroundColor = UIColor.whiteColor()
            self.goButton.titleLabel?.textColor = UIColor(colorLiteralRed: 52/255, green: 52/255, blue: 52/255, alpha: 1)
            
            
            
            i += 1
        }
        if i == 1 {
            instructionsLabel.text = "Go to Settings > General"
            instructionsLabel.font = UIFont(name: "Varela Round", size: 17)
            UIView.animateWithDuration(0.5, animations:  {
                self.instructionsLabel.center.x += self.view.bounds.width
                self.goButton.center.x -= self.view.bounds.width
                })
                
                self.goButton.titleLabel!.font = UIFont(name: "Avenir Next", size: 15)
                self.instructionsLabel.font = UIFont(name: "Avenir Next", size: 17)
               self.goButton.backgroundColor = UIColor.whiteColor()
                self.goButton.titleLabel?.textColor = UIColor(colorLiteralRed: 52/255, green: 52/255, blue: 52/255, alpha: 1)
                
            
            
            i += 1
        }
        else if i == 2 {
            instructionsLabel.text = "Scroll down to Keyboard > Keyboards > Add New Keyboard"
            instructionsLabel.font = UIFont(name: "Varela Round", size: 17)
            UIView.animateWithDuration(0.5, animations: {
                self.instructionsLabel.center.x += self.view.bounds.width
                self.goButton.center.x -= self.view.bounds.width
                self.goButton.backgroundColor = UIColor.whiteColor()
                self.goButton.titleLabel?.textColor = UIColor(colorLiteralRed: 52/255, green: 52/255, blue: 52/255, alpha: 1)

                
            })
            
            self.goButton.titleLabel!.font = UIFont(name: "Avenir Next", size: 15)
            self.instructionsLabel.font = UIFont(name: "Avenir Next", size: 17)
            self.goButton.backgroundColor = UIColor.whiteColor()
            self.goButton.titleLabel?.textColor = UIColor(colorLiteralRed: 52/255, green: 52/255, blue: 52/255, alpha: 1)
            
            i += 1
        }
        else if i == 3 {
            instructionsLabel.text = "Select 'vibe' from the list and turn on 'Allow Full Access'"
            instructionsLabel.font = UIFont(name: "Varela Round", size: 17)
            UIView.animateWithDuration(0.5, animations: {
                self.instructionsLabel.center.x += self.view.bounds.width
                self.goButton.center.x -= self.view.bounds.width
                
                self.goButton.backgroundColor = UIColor.whiteColor()
                self.goButton.titleLabel?.textColor = UIColor(colorLiteralRed: 52/255, green: 52/255, blue: 52/255, alpha: 1)

            })
            
            self.goButton.titleLabel!.font = UIFont(name: "Avenir Next", size: 15)
            self.instructionsLabel.font = UIFont(name: "Avenir Next", size: 17)
            self.goButton.backgroundColor = UIColor.whiteColor()
            self.goButton.titleLabel?.textColor = UIColor(colorLiteralRed: 52/255, green: 52/255, blue: 52/255, alpha: 1)
            
            
            i += 1
        }
        else if i == 4 {
            instructionsLabel.text = "When your in your Messages App, tap the Globe icon at the bottom of the current keyboard to change to 'vibe'"
            instructionsLabel.font = UIFont(name: "Varela Round", size: 17)
            UIView.animateWithDuration(0.5, animations: {
                self.instructionsLabel.center.x += self.view.bounds.width
                self.goButton.center.x -= self.view.bounds.width
                self.goButton.backgroundColor = UIColor.whiteColor()
                self.goButton.titleLabel?.textColor = UIColor(colorLiteralRed: 52/255, green: 52/255, blue: 52/255, alpha: 1)

                
            })
            
            self.goButton.titleLabel!.font = UIFont(name: "Avenir Next", size: 15)
            self.instructionsLabel.font = UIFont(name: "Avenir Next", size: 17)
            self.goButton.backgroundColor = UIColor.whiteColor()
            self.goButton.titleLabel?.textColor = UIColor(colorLiteralRed: 52/255, green: 52/255, blue: 52/255, alpha: 1)
            
            i += 1
        }
        else if i == 5 {
            instructionsLabel.text = "That's it! Start making some good vibes !"
            instructionsLabel.font = UIFont(name: "Varela Round", size: 17)
            UIView.animateWithDuration(0.5, animations: {
                self.instructionsLabel.center.x += self.view.bounds.width
                self.goButton.center.x -= self.view.bounds.width
                self.goButton.backgroundColor = UIColor.whiteColor()
                self.goButton.titleLabel?.textColor = UIColor(colorLiteralRed: 52/255, green: 52/255, blue: 52/255, alpha: 1)

                
            })
            
            self.goButton.titleLabel!.font = UIFont(name: "Avenir Next", size: 15)
            self.instructionsLabel.font = UIFont(name: "Avenir Next", size: 17)
            self.goButton.backgroundColor = UIColor.whiteColor()
            self.goButton.titleLabel?.textColor = UIColor(colorLiteralRed: 52/255, green: 52/255, blue: 52/255, alpha: 1)
            
            goButton.hidden = true
            
            
        }
    }
}



