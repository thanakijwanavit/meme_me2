//
//  TableViewController.swift
//  imagePicker
//
//  Created by nic Wanavit on 8/2/19.
//  Copyright © 2019 Wanavit. All rights reserved.
//

import Foundation
import UIKit

class TableViewController:UITableViewController{
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let meme = self.appDelegate.memes[(indexPath as NSIndexPath).row]
        // Set the name and image
        cell.cellImage.image = meme.memedImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.memes.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Grab the DetailVC from Storyboard
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeGenerationViewController") as! MemeGenerationViewController
        
        //Populate view controller with data from the selected item
        detailController.imageToDisplay.image = appDelegate.memes[indexPath.row].originalImage
        detailController.bottomText.text = appDelegate.memes[indexPath.row].bottomText
        detailController.topText.text = appDelegate.memes[indexPath.row].topText
        
        // Present the view controller using navigation
        navigationController!.pushViewController(detailController, animated: true)
    }
}
