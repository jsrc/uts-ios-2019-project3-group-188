//
//  ComponentView.swift
//  MyWardrobe
//
//  Created by Bunlong on 26/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import UIKit


class UpperWearCell: UICollectionViewCell {
    
    @IBOutlet weak var UpperWearImage: UIImageView!
}


class UpperWearView:  UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var UpperWearCollectionView: UICollectionView!
    
    
    
    var images = ["shirt1","shirt2","shirt3","shirt4"]
    override func viewDidLoad() {
        
        
        

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpperWearCell", for: indexPath) as! UpperWearCell
        
        cell.UpperWearImage.image = UIImage(named:images[indexPath.row])
        
        return cell
    }

}
