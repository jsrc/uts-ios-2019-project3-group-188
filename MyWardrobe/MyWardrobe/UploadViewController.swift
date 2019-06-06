//
//  UploadViewController.swift
//  MyWardrobe
//
//  Created by Chen Jiang on 2019/5/27.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFolder(name: "UpperWear")
        createFolder(name: "Pants")
        createFolder(name: "Shooes")
        createFolder(name: "Hats")
    }
    
    @IBOutlet weak var chooseImageView: UIImageView!
    @IBOutlet weak var type: UISegmentedControl!
    
    //when click choose from the album
    @IBAction func chooseFromAlbum(_ sender: Any) {
        //to make sure that support choose from album
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //init picker
            let picker = UIImagePickerController()
            //setting delegate
            picker.delegate = self
            //appoint the type
            picker.sourceType = .photoLibrary
            //show the controller
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("fail to shwo the album")
        }
    }
    
    //the delegate that after choose image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //open the original image
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        chooseImageView.image = image
        
        var filePath = NSHomeDirectory() + "/Documents/"
        switch type.selectedSegmentIndex {
        case 1:
            filePath = filePath + "UpperWear"
            break
        case 2:
            filePath = filePath + "Pants"
            break
        case 3:
            filePath = filePath + "Shooes"
            break
        default:
            filePath = filePath + "Hats"
            break
        }
        //get current time as file name
        let now = Date()
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let timeStamp = String(timeInterval)
        filePath = filePath + "/" + timeStamp + ".png"
        
        let imageData:Data = image.pngData()!
        try? imageData.write(to: URL(fileURLWithPath: filePath))
        
        //quit the picker
        picker.dismiss(animated: true, completion:nil)
    }
    
    //create floder to store the image
    func createFolder(name:String) {
        let baseUrl = URL(fileURLWithPath: NSHomeDirectory() + "/Documents/")
        let manager = FileManager.default
        let folder = baseUrl.appendingPathComponent(name, isDirectory: true)
        let exist = manager.fileExists(atPath: folder.path)
        if !exist {
            try! manager.createDirectory(at: folder, withIntermediateDirectories: true,
                                         attributes: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

