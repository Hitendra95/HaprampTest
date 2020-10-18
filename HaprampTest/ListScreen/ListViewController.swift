//
//  ListViewController.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import Foundation
import UIKit
import SkeletonView

class ListViewController: UINavigationController,UITableViewDelegate,UITableViewDataSource{
    var tableview = UITableView()
    lazy var banner = UIView()
    
    override func viewDidLoad() {
        setUI()
        fetchdata()
    }
    
    func fetchdata(){
        GetList()
        GetRandomImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         // to register the view
         BaseModel.sharedInstanceBaseModel.registerView(notifier: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // to unregister the view
        BaseModel.sharedInstanceBaseModel.unregisterView(notifier: self)
    }
    
    func setUI(){
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.refresh, target: self, action: nil)
        navigationItem.leftBarButtonItem = button
        tableview.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseIdentifier)
        tableview.dataSource = self
        tableview.delegate = self
        tableview.separatorStyle = .none
        self.view.addSubview(banner)
        self.view.addSubview(tableview)
        setConstraints()


    }
    
    func setConstraints(){
        banner.setAnchors(top: view.topAnchor, left: view.leftAnchor , bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 176, width: 0)
        tableview.setAnchors(top: banner.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 0, width: 0)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: CustomCell.reuseIdentifier) as! CustomCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if  ((indexPath.item / 2) == 0) {
            return 213
        }else{
            return 416
        }
    }
}

//MAKR: Handle network calls
extension ListViewController:UpdateViewProtocol{
    
    
    //MARK: GET List From Server
     func GetList() {
         
         EventsController.sharedInstanceAppController.handleEvent(eventid: NetworkEvents.EVENT_GET_LIST)
         
     }
    
    func GetRandomImage(){
        EventsController.sharedInstanceAppController.handleEvent(eventid: NetworkEvents.EVENT_GET_RandomImage)
    }
    
    //MARK: Handle update Notify from handlers
    func updateView(event: Int, eventtype: Int) {
        
        switch event {
            case NetworkEvents.EVENT_GET_LIST:
                switch eventtype{
                    case ConnectionModel.EVENT_TYPE_SUCCESS:
                        guard let response = ModelFacade.sharedInstanceModelFacade.getListModel().list.data else {return}
                        print("response \(response)")
                        //self.list = response
                        //self.tableview.reloadData()
                    case ConnectionModel.EVENT_TYPE_ERROR:
                        displayAlert(message: Constants.ERROR)
        
                    case ConnectionModel.EVENT_TYPE_NETWORKERROR:
                        displayAlert(message: Constants.ERROR_NETWORK_ERROR)
                    default:
                        print("default block")
                    }
                
        case NetworkEvents.EVENT_GET_RandomImage:
            switch eventtype{
                case ConnectionModel.EVENT_TYPE_SUCCESS:
                    guard let response = ModelFacade.sharedInstanceModelFacade.getRandomImage().randomImage.data else {return}
                    print("response \(response)")
                    //self.list = response
                    //self.tableview.reloadData()
                case ConnectionModel.EVENT_TYPE_ERROR:
                    displayAlert(message: Constants.ERROR)
    
                case ConnectionModel.EVENT_TYPE_NETWORKERROR:
                    displayAlert(message: Constants.ERROR_NETWORK_ERROR)
                default:
                    print("default block")
                }
            
            default:
                print("default block")
        
        }
    }
    
    //MARK: Show ALert
    func displayAlert(message:String){
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            
        alert.view.clipsToBounds = true
        alert.view.sizeToFit()
            
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
