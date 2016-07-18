//
//  ViewController.swift
//  Emoji Keyboard
//
//  Created by Luke Stevens on 2/1/16.
//  Copyright © 2016 OnMilwaukee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var textView: UITextView!
    
    let imageNames : [String] = ["Accordian", "Bar Dice", "Beastie", "Bratwurst", "Bronze Fonz’s Thumbs", "Cheesehead (Female)", "Cheesehead (Male)", "One Mitchell Park Dome", "The Mitchell Park Domes", "Hoan Bridge", "Lake Michigan", "Laverne", "The Milverine", "The Milwaukee Flag", "Old Fashioned", "Rumchata", "Shirley", "Mark di Suervo’s “The Calling”", "Shorts & Melting Snow (Female)", "Shorts & Melting Snow (Male)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //textView.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = imageNames[indexPath.row]
        cell.imageView!.image = UIImage(named: imageNames[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }

}

