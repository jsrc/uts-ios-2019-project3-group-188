//
//  MyCloakRoomViewController.swift
//  MyWardrobe
//
//  Created by Chen Jiang on 2019/5/27.
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
        
        //init filemanager
        let fileManager = FileManager.default
        let urlForDocument = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
        
        //get the path of the image
        let hatsUrl = try? fileManager.contentsOfDirectory(at: urlForDocument.appendingPathComponent("Hats", isDirectory: true), includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        let upperWearUrl = try? fileManager.contentsOfDirectory(at: urlForDocument.appendingPathComponent("UpperWear", isDirectory: true), includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        let pantsUrl = try? fileManager.contentsOfDirectory(at: urlForDocument.appendingPathComponent("Pants", isDirectory: true), includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        let shooseUrl = try? fileManager.contentsOfDirectory(at: urlForDocument.appendingPathComponent("Shooes", isDirectory: true), includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        
        //if it is not null, get the image randomly
        if (hatsUrl != nil && hatsUrl!.count > 0) {
            let randomInt = Int(arc4random_uniform(UInt32(hatsUrl!.count)))
            let fileData = fileManager.contents(atPath: hatsUrl![randomInt].path)
            let image = UIImage(data: fileData!)
            upperWearImgView.image = image
        }
        if (upperWearUrl != nil && upperWearUrl!.count > 0) {
            let randomInt = Int(arc4random_uniform(UInt32(upperWearUrl!.count)))
            let fileData = fileManager.contents(atPath: upperWearUrl![randomInt].path)
            let image = UIImage(data: fileData!)
            upperWearImgView.image = image
        }
        if (pantsUrl != nil && pantsUrl!.count > 0) {
            let randomInt = Int(arc4random_uniform(UInt32(pantsUrl!.count)))
            let fileData = fileManager.contents(atPath: pantsUrl![randomInt].path)
            let image = UIImage(data: fileData!)
            pantsImgView.image = image
        }
        if (shooseUrl != nil && shooseUrl!.count > 0) {
            let randomInt = Int(arc4random_uniform(UInt32(shooseUrl!.count)))
            let fileData = fileManager.contents(atPath: shooseUrl![randomInt].path)
            let image = UIImage(data: fileData!)
            shooesImgView.image = image
        }
    }
}
