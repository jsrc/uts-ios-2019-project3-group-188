//
//  HatView.swift
//  MyWardrobe
//
//  Created by Bunlong on 26/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import UIKit

class HatCell: UICollectionViewCell{
    
    @IBOutlet weak var HatImage: UIImageView!
}

class HatView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    @IBOutlet weak var HatCollectionView: UICollectionView!
    
    var images = ["hat1","hat2","hat3","hat4"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HatCell", for: indexPath) as! HatCell
        
        cell.HatImage.image = UIImage(named:images[indexPath.row])
        
        return cell
    }

}
