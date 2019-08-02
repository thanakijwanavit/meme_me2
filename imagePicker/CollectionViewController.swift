//
//  CollectionViewController.swift
//  imagePicker
//
//  Created by nic Wanavit on 8/2/19.
//  Copyright © 2019 Wanavit. All rights reserved.
//

import Foundation
import UIKit

class  CollectionViewController: UICollectionViewController {
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    override func viewDidLoad() {
    }
 
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appDelegate.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let meme = self.appDelegate.memes[(indexPath as NSIndexPath).row]
        // Set the name and image
        cell.cellImage.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
