//
//  ComponentView.swift
//  MyWardrobe
//
//  Created by Bunlong on 25/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import UIKit

//method to create the tab color
extension UIImage {
    class func itemTabColor(color: UIColor, size: CGSize) -> UIImage {
        let frameColor = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        color.setFill()
        UIRectFill(frameColor)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}

class ComponentTabView: UITabBarController {

    var tabItem = UITabBarItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
        
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
        
        setTabBarImage()
        setTabColor()
    }
    
    // function to set image on tab bars
    func setTabBarImage (){
        
        let imageShirt = UIImage(named: "shirt")?.withRenderingMode(.alwaysOriginal)
        tabItem = (self.tabBar.items?[0])!
        tabItem.image = imageShirt
        
        let imagePant =  UIImage(named: "pant")?.withRenderingMode(.alwaysOriginal)
        tabItem = (self.tabBar.items?[1])!
        tabItem.image =  imagePant
        
        let imageHat =  UIImage(named: "hat")?.withRenderingMode(.alwaysOriginal)
        tabItem = (self.tabBar.items?[2])!
        tabItem.image = imageHat
        
        let imageShoes =  UIImage(named: "shoes")?.withRenderingMode(.alwaysOriginal)
        tabItem = (self.tabBar.items?[3])!
        tabItem.image = imageShoes
        
        self.selectedIndex = 0
    }
    
    //function to create tab color
    func setTabColor() {
        let tabNumber = CGFloat((tabBar.items?.count)!)
        let tabSize = CGSize(width: tabBar.frame.width / tabNumber, height: 80)
        
        tabBar.selectionIndicatorImage = UIImage.itemTabColor(color: #colorLiteral(red: 0.7515752951, green: 0.8359550695, blue: 1, alpha: 1), size: tabSize)
    }
}


