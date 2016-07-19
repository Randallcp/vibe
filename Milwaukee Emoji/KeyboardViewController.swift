//
//  KeyboardViewController.swift
//  Milwaukee Emoji
//
//  Created by Luke Stevens on 2/1/16.
//  Copyright © 2016 OnMilwaukee. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON
import Alamofire

class KeyboardViewController: UIInputViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    
    let emojiList : [String] = ["test1", "test2"]
    let trending: [Music] = []
    var allSongs: [Music] = []
    
    let tapRec = UITapGestureRecognizer()


    
    
//    var emojiCollectionView : UICollectionView!;

    @IBOutlet var emojiCollectionView: UICollectionView!
    
    @IBOutlet weak var GenreLabel: UILabel!
    @IBOutlet weak var GenreImage: UIImageView!
    
    @IBOutlet weak var GenreCollectionView: UICollectionView!
    @IBOutlet weak var footer: UIView!
    @IBOutlet weak var letterKeyboard: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var nextKeyboardButton: UIButton!
    
 
 

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "Keyboard", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        self.view = objects[0] as! UIView;
        
      
        emojiCollectionView.registerNib(UINib.init(nibName: "emojiCell", bundle: nil), forCellWithReuseIdentifier: "theOne")
        
        
        // Design
        
        footer.layer.cornerRadius = 8
        emojiCollectionView.layer.cornerRadius = 8
        searchBar.layer.cornerRadius = 25
        
        
      
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
       
        
        tapRec.addTarget(self, action: "handleTap")
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)) )
        searchBar.addGestureRecognizer(tapRecognizer)
     
        searchBar.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let constraint = NSLayoutConstraint(item: self.view, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 0.0, constant: 250)
        self.view.addConstraint(constraint)
    }
    
    func performSearch(searchTerm: String) {
        // This would normally be network calls that return `NSData`. We'll show you how to do those soon!
        // In this case, we are using a local JSON file.
        let apiToContact = "http://itunes.apple.com/search?term=\(searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+"))&entity=song&limit=20"
        // This code will call the iTunes top 25 movies endpoint listed above
        Alamofire.request(.GET, apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let musicData = JSON(value)
                    
                    // Do what you need to with JSON here!
                    // The rest is all boiler plate code you'll use for API requests
                    let allMusicData = musicData["results"].arrayValue
                   // print(allMusicData)
                    
//                    Music(json: allMusicData[i])
                    var i = 0
                    while i < allMusicData.count {
//                        print(allMusicData[i]["trackName"])
//                        print(allMusicData[i]["artistName"])
//                        print(allMusicData[i]["previewUrl"])

                        self.allSongs.append(Music(json: allMusicData[i]))
                        // print(self.allSongs)
                        i += 1
                        
                    }
                    self.emojiCollectionView.reloadData()
                    
//                    while i < allMusicData.count {
//                        Music(json: allMusicData[i])
//                        print(allMusicData["results"])
////                        self.allSongs.append()
//                        i += 1
//                    }
//                    self.movieTitleLabel.text = self.randomMovie.name
//                    self.rightsOwnerLabel.text = self.randomMovie.rightsOwner
                    
                    
                    
                }
            case .Failure(let error):
                print(error)
            }
        }
// emojiCollectionView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.emojiCollectionView {
        if searchBar.text! == "" {
            print("NO TEXT")

            return trending.count
        }
        else {
            print("INPUTTT!!!")

        return allSongs.count
            }
            }
        else {
            return 10
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if collectionView == self.emojiCollectionView {
        let cell : emojiCell =  emojiCollectionView.dequeueReusableCellWithReuseIdentifier("theOne", forIndexPath: indexPath) as! emojiCell
        if searchBar.text! == "" {
            cell.artist.text = trending[indexPath.row].artist
            cell.song.text = trending[indexPath.row].song
        }
        else {
            cell.artist.text = allSongs[indexPath.row].artist
            cell.song.text = allSongs[indexPath.row].song
        }
        cell.copiedView.layer.cornerRadius = 8
        cell.copiedView.layer.masksToBounds = true
        return cell
        }
        else {
            
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let selectedCell : emojiCell = emojiCollectionView.cellForItemAtIndexPath(indexPath) as! emojiCell
        
        
        UIView.animateWithDuration(0.7, animations: { () -> Void in
            selectedCell.copiedView.hidden = false
            selectedCell.copiedView.alpha = 1;
            }) { (completed) -> Void in
                UIView.animateWithDuration(0.7, delay: 1, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                        selectedCell.copiedView.alpha = 0
                    }, completion: { (completed) -> Void in
                        selectedCell.copiedView.hidden = true
                })
        }
        
        selectedCell.copiedView.hidden = false
    }
    
    
    
    @IBAction func qPressed(button: UIButton) {
        searchBar.text! += "q"
    }
    @IBAction func wPressed(button: UIButton) {
        searchBar.text! += "w"
    }
    @IBAction func ePressed(button: UIButton) {
        searchBar.text! += "e"
    }
    @IBAction func rPressed(button: UIButton) {
        searchBar.text! += "r"
    }
    @IBAction func tPressed(button: UIButton) {
        searchBar.text! += "t"
    }
    @IBAction func yPressed(button: UIButton) {
        searchBar.text! += "y"
    }
    @IBAction func uPressed(button: UIButton) {
        searchBar.text! += "u"
    }
    @IBAction func iPressed(button: UIButton) {
        searchBar.text! += "i"
    }
    @IBAction func oPressed(button: UIButton) {
        searchBar.text! += "o"
    }
    @IBAction func pPressed(button: UIButton) {
        searchBar.text! += "p"
    }
    @IBAction func aPressed(button: UIButton) {
        searchBar.text! += "a"
    }
    @IBAction func sPressed(button: UIButton) {
        searchBar.text! += "s"
    }
    @IBAction func dPressed(button: UIButton) {
        searchBar.text! += "d"
    }
    @IBAction func fPressed(button: UIButton) {
        searchBar.text! += "f"
    }
    @IBAction func gPressed(button: UIButton) {
        searchBar.text! += "g"
    }
    @IBAction func hPressed(button: UIButton) {
        searchBar.text! += "h"
    }
    @IBAction func jPressed(button: UIButton) {
        searchBar.text! += "j"
    }
    @IBAction func kPressed(button: UIButton) {
        searchBar.text! += "k"
    }
    @IBAction func lPressed(button: UIButton) {
        searchBar.text! += "l"
    }
    @IBAction func zPressed(button: UIButton) {
        searchBar.text! += "z"
    }
    @IBAction func xPressed(button: UIButton) {
        searchBar.text! += "x"
    }
    @IBAction func cPressed(button: UIButton) {
        searchBar.text! += "c"
    }
    @IBAction func vPressed(button: UIButton) {
        searchBar.text! += "v"
    }
    @IBAction func bPressed(button: UIButton) {
        searchBar.text! += "b"
    }
    @IBAction func nPressed(button: UIButton) {
        searchBar.text! += "n"
    }
    @IBAction func mPressed(button: UIButton) {
        searchBar.text! += "m"
        print("hi")
    }
    @IBAction func spacePressed(button: UIButton) {
        searchBar.text! += " "
    }
    @IBAction func backSpacePressed(button: UIButton) {
        // delete last char
    }
    @IBAction func plusPressed(button: UIButton) {
        advanceToNextInputMode()
    }
    
    @IBAction func searchPressed(sender: UIButton) {
        
        performSearch(searchBar.text!)
        emojiCollectionView.hidden = false
        footer.hidden = false
        
        searchBar.endEditing(true)
        self.emojiCollectionView.reloadData()
    }

    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(160, 78);
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0;
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0;
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

       enum State {
        case DefaultMode
        case SearchMode
    }
    
    
    var state: State = .DefaultMode {
        didSet {
            switch (state) {
                
            case .SearchMode:
                let searchText = searchBar?.text ?? ""
                performSearch(searchBar.text!)
                //keyboardGestureRecognizer.enabled = true //test
                
                
            case .DefaultMode:
                print("nothing")
                //keyboardGestureRecognizer.enabled = false
            }
        }
    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
        state = .DefaultMode
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        performSearch(searchBar.text!)
        emojiCollectionView.hidden = true
        footer.hidden = true
    }
    
    func handleTap(gestureRecognizer : UIGestureRecognizer) {
        
        // When search bar typed:
        emojiCollectionView.hidden = true
        footer.hidden = true
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        emojiCollectionView.hidden = true
        footer.hidden = true
    }
   
}
