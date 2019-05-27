//
//  MyCloakRoomViewController.swift
//  MyWardrobe
//
//  Created by 江上 on 2019/5/27.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

class MyCloakRoomViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var upperWearImgView: UIImageView!
    @IBOutlet weak var pantsImgView: UIImageView!
    @IBOutlet weak var shooesImgView: UIImageView!
    
    @IBAction func startMatching() {
        
        let fileManager = FileManager.default
        let urlForDocument = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urlForDocument[0] as URL
        
//        var hatsUrl: URL = url.appendingPathComponent("Hats", isDirectory: true)
        let upperWearUrl: URL = url.appendingPathComponent("UpperWear", isDirectory: true)
        let pantsUrl: URL = url.appendingPathComponent("Pants", isDirectory: true)
        let shooseUrl: URL = url.appendingPathComponent("Shooes", isDirectory: true)
        
//        let contentsOfURL = try? fileManager.contentsOfDirectory(at: hatsUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        let contentsOfURL2 = try? fileManager.contentsOfDirectory(at: upperWearUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        let contentsOfURL3 = try? fileManager.contentsOfDirectory(at: pantsUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        let contentsOfURL4 = try? fileManager.contentsOfDirectory(at: shooseUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)

//        let count = contentsOfURL?.count
//        if count! > 0 {
//            let fileData = fileManager.contents(atPath: contentsOfURL![0].path)
//            let image = UIImage(data: fileData!)
//        }
        let count2 = contentsOfURL2?.count
        if count2! > 0 {
            let fileData = fileManager.contents(atPath: contentsOfURL2![0].path)
            let image = UIImage(data: fileData!)
            upperWearImgView.image = image
        }
        let count3 = contentsOfURL3?.count
        if count3! > 0 {
            let fileData = fileManager.contents(atPath: contentsOfURL3![0].path)
            let image = UIImage(data: fileData!)
            pantsImgView.image = image
        }
        let count4 = contentsOfURL4?.count
        if count4! > 0 {
            let fileData = fileManager.contents(atPath: contentsOfURL4![0].path)
            let image = UIImage(data: fileData!)
            shooesImgView.image = image
        }
    }
}
