//
//  KeyboardViewController.swift
//  Milwaukee Emoji
//
//  Created by Luke Stevens on 2/1/16.
//  Copyright © 2016 OnMilwaukee. All rights reserved.
//

import UIKit
import Foundation

class KeyboardViewController: UIInputViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    let emojiList : [String] = ["test1", "test2"]
    let searchResults: [Music] = []
    let trending: [Music] = []
    
    
//    var emojiCollectionView : UICollectionView!;

    @IBOutlet var emojiCollectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var nextKeyboardButton: UIButton!
    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "Keyboard", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        self.view = objects[0] as! UIView;
        
      
        emojiCollectionView.registerNib(UINib.init(nibName: "emojiCell", bundle: nil), forCellWithReuseIdentifier: "theOne")
        
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.deleteButton.addTarget(self.textDocumentProxy, action: "deleteBackward", forControlEvents: .TouchUpInside)
        
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchBar.text == "" {
            return trending.count
        }
        else {
        return searchResults.count
    }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : emojiCell =  emojiCollectionView.dequeueReusableCellWithReuseIdentifier("theOne", forIndexPath: indexPath) as! emojiCell
        
        cell.copiedView.layer.cornerRadius = 8
        cell.copiedView.layer.masksToBounds = true
        print(indexPath)
        print("Well at least the method is being called...")
        return cell
        
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
        
        //selectedCell.copiedView.hidden = false
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

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
    }

}
