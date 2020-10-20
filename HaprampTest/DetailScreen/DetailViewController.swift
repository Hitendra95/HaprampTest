//
//  DetailViewController.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
    lazy var DetialView = DetailView()//(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
    var data : DetailData?
    var cancleButton : UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "cancel"), for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = UIColor.translucent
        button.layer.borderWidth = 1
        button.layer.backgroundColor = UIColor.white.cgColor
        button.isUserInteractionEnabled = true
        return button
    }()
    
    override func viewDidLoad() {
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setData()
    }
    
    func setUI(){
        cancleButton.addTarget(self, action: #selector(cancel), for: UIControl.Event.touchDown)
        self.view.addSubview(DetialView)
        self.DetialView.addSubview(cancleButton)
        DetialView.setAnchors(top: self.view.safeAreaLayoutGuide.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)
        cancleButton.setAnchors(top: self.view.topAnchor, left: nil, bottom: nil, right: self.view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, height: 40, width: 40)
    }
    
    @objc func cancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func setData(){
        guard let dataPassed = data else {return}
        DetialView.descriptionText.text = dataPassed.descriptionText ?? ""
        DetialView.MainImage.loadImageUsingCacheWithUrl(urlString: dataPassed.mainImage ?? "")
        DetialView.placeTitle.text = dataPassed.placeTitle ?? ""
        DetialView.profileImage.loadImageUsingCacheWithUrl(urlString: dataPassed.profileImage ?? "")
        DetialView.userName.text = dataPassed.userName ?? ""
    }
    
}
