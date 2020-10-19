//
//  Extension.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation
import UIKit

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
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) -> Void in

            guard error == nil
                else { return }
            guard let downloadedImage = UIImage(data: data!)
                else {return }

            performUIUpdatesOnMain {
                imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                self.image = downloadedImage
            }


        }).resume()
        }
    }
}
