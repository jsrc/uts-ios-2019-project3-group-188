//
//  UnderWearView.swift
//  MyWardrobe
//
//  Created by Bunlong on 26/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import UIKit

class UnderWearCell: UICollectionViewCell {
    
    @IBOutlet weak var UnderWearImage: UIImageView!
    

}


class UnderWearView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var HatCollectionView: UICollectionView!
    
    
    
    var images = ["pants1","pants2","pants3","pants4"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UnderWearCell", for: indexPath) as! UnderWearCell
        
        cell.UnderWearImage.image = UIImage(named:images[indexPath.row])
        
        return cell
    }
    

}
