//
//  UploadViewController.swift
//  MyWardrobe
//
//  Created by 江上 on 2019/5/27.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createFolder(name: "UpperWear")
        createFolder(name: "Pants")
        createFolder(name: "Shooes")
        createFolder(name: "Hats")
    }
    
    @IBOutlet weak var chooseImageView: UIImageView!
    @IBOutlet weak var type: UISegmentedControl!
    
    //选取相册
    @IBAction func chooseFromAlbum(_ sender: Any) {
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = .photoLibrary
            //弹出控制器，显示界面
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("读取相册错误")
        }
    }
    
    //选择图片成功后代理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //获取选择的原图
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
        //获取当前时间
        let now = Date()
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let timeStamp = String(timeInterval)
        filePath = filePath + "/" + timeStamp + ".png"
        
        let imageData:Data = image.pngData()!
        try? imageData.write(to: URL(fileURLWithPath: filePath))
        
        //图片控制器退出
        picker.dismiss(animated: true, completion:nil)
    }
    
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

