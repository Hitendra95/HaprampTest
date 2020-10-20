//
//  CustomCell.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 19/10/20.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell{
    
    class var reuseIdentifier: String{return String(describing: self)}
    
    let displayImage : UIImageView = {
        
        let dImage = UIImageView()
        dImage.contentMode = .scaleAspectFill
        dImage.backgroundColor = .white
        return dImage
    }()
    
    let profileImage : UIImageView = {
        
        let pImage = UIImageView()
        pImage.image = UIImage(named: "kkr-1")
        pImage.contentMode = .scaleToFill
        pImage.layer.cornerRadius = 36/2
        pImage.clipsToBounds = true
        pImage.layer.borderWidth = 2
        pImage.layer.borderColor = UIColor.white.cgColor
        return pImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        self.backgroundColor = .white
        displayImage.addSubview(profileImage)
        self.addSubview(displayImage)
        setConstraints()
        

    }
//    
    func setData(data: ListStructre){
        displayImage.loadImageUsingCacheWithUrl(urlString: data.url ?? "")
        profileImage.loadImageUsingCacheWithUrl(urlString: data.profileImage ?? "")
    }
    
    func setConstraints(){
        displayImage.setAnchors(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)
        profileImage.setAnchors(top: nil, left: nil, bottom: displayImage.bottomAnchor, right: displayImage.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 8, height: 32, width: 32)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
