//
//  MemeCollectionViewController.swift
//  Meme Me
//
//  Created by Thomas Milgrew on 10/15/17.
//  Copyright © 2017 Thomas Milgrew. All rights reserved.
//

import Foundation
import UIKit

class MemeCollectionViewController : UICollectionViewController {
    
    var memes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        cell.memeImageView.image = meme.memeImage
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fullMemeController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        fullMemeController.fullMemeImageView.image = memes[(indexPath as NSIndexPath).row].memeImage
        navigationController!.pushViewController(fullMemeController, animated: true)

    }
    
    @IBAction func showSaveMemeEditor(_ sender: Any) {
        let storyboard = self.storyboard
        let controller = storyboard?.instantiateViewController(withIdentifier: "MemeViewController") as! ViewController
        self.present(controller, animated: true, completion: nil)
    }
    
}
