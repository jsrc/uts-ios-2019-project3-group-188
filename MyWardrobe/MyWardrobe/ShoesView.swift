//
//  ShoesView.swift
//  MyWardrobe
//
//  Created by Bunlong on 26/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import UIKit

class ShoesCell: UICollectionViewCell {
    
    @IBOutlet weak var shoesImageView: UIImageView!
    
}

class ShoesView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var shoesCollectionView: UICollectionView!
    
    
    var images = ["1","2","3","4"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoesCell", for: indexPath) as! ShoesCell
        
        cell.shoesImageView.image = UIImage(named:images[indexPath.row])
        
        return cell
    }
    

}
