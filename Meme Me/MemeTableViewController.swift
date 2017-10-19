//
//  MemeTableViewController.swift
//  Meme Me
//
//  Created by Thomas Milgrew on 10/15/17.
//  Copyright © 2017 Thomas Milgrew. All rights reserved.
//

import Foundation
import UIKit

class MemeTableViewController : UITableViewController {
    
    var memes: [Meme]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) 
        let meme = memes[(indexPath as NSIndexPath).row]
        
        cell.imageView?.image = meme.memeImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
