//
//  Extension.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation
import UIKit
import SkeletonView

//MARK: Extension of UIView to provide anchors
extension UIView {
func setAnchors(top:NSLayoutYAxisAnchor?,left:NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?,right:NSLayoutXAxisAnchor?,paddingTop:CGFloat,paddingLeft:CGFloat,paddingBottom:CGFloat,paddingRight:CGFloat,height:CGFloat,width:CGFloat)
{
  self.translatesAutoresizingMaskIntoConstraints = false
  if let top = top
  {
    self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
  }
  if let left = left
  {
    self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
  }
  if let bottom = bottom
  {
    self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
  }
  if let right = right
  {
    self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
  }
  if height != 0
  {
    self.heightAnchor.constraint(equalToConstant: height).isActive = true
  }
  if width != 0
  {
    self.widthAnchor.constraint(equalToConstant: width).isActive = true
  }
}
}

    func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
        DispatchQueue.main.async {
            updates()
        }
    }

//MARK : Extension of UIImage to cache image and provide cache data
let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView
{
    /**
     *  loads image from url
     *  Save loaded image in cache memory
     */

    func loadImageUsingCacheWithUrl(urlString: String) {
        self.image = nil

        /// check for cache
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }

        /// download image from url
        if urlString == ""
        {
            return
        }
        let url = URL(string: urlString)
        if url != nil
        {
        //print("url abc  : \(url)")
            self.isSkeletonable = true
            self.showAnimatedGradientSkeleton()
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) -> Void in

            guard error == nil
                else { return }
            guard let downloadedImage = UIImage(data: data!)
                else {return }

            performUIUpdatesOnMain {
                imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                self.image = downloadedImage
                self.hideSkeleton()
            }


        }).resume()
        }
    }
}

extension UIColor {
    convenience init(hexString:String) {
        let hexString:NSString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) as NSString
        let scanner            = Scanner(string: hexString as String)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    
}

extension UIColor{
    @nonobjc class var translucent: UIColor{
        return UIColor(hexString: "deffffff")
    }
    
    @nonobjc class var textColor: UIColor{
        return UIColor(hexString: "de000000")
    }
}

extension UIFont{
    class var robotoRegular14: UIFont {
        return UIFont(name: "Roboto-Regular", size: 14.0) ?? UIFont.systemFont(ofSize: 14)
    }
    class var robotoRegular12: UIFont {
        return UIFont(name: "Roboto-Regular", size: 12.0) ?? UIFont.systemFont(ofSize: 12)
    }
}
