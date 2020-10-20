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
    lazy var banner = UIImageView()
    var listData = [ListStructre]()
    var bannerImage: DataModel?
    var page = 0
    
    // Aurto refresh
    lazy var refreshControl : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.white
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        refreshControl.addTarget(self, action: #selector(fetchdata), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        setUI()
        fetchdata()
    }
    
    //MARK: Function to fetch api call
    @objc func fetchdata(){
            self.GetList()
            self.GetRandomImage()
      
    }
    //Regiter each view in view will appear
    override func viewWillAppear(_ animated: Bool) {
         // to register the view
         BaseModel.sharedInstanceBaseModel.registerView(notifier: self)
    }
    //Unregister view in api call
    override func viewWillDisappear(_ animated: Bool) {
        // to unregister the view
        BaseModel.sharedInstanceBaseModel.unregisterView(notifier: self)
    }
    
    func setUI(){
        self.view.backgroundColor = .white
        tableview.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseIdentifier)
        tableview.refreshControl = refreshControl
        tableview.separatorStyle = .none
        self.view.addSubview(banner)
        self.view.addSubview(tableview)
        tableview.dataSource = self
        tableview.delegate = self
        setConstraints()


    }
    
    func setConstraints(){
        banner.setAnchors(top: self.view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor , bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 176, width: 0)
        tableview.setAnchors(top: banner.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 0, width: 0)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if tableview.contentOffset.y >= (tableview.contentSize.height - tableview.frame.size.height) {
            print("move to top")
                page = page + 1
                self.tableview.isScrollEnabled = false
                fetchdata()
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: CustomCell.reuseIdentifier) as! CustomCell
        cell.displayImage.image = nil
        cell.selectionStyle = .none
        let data = listData[indexPath.section]
        cell.setData(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = listData[indexPath.section]
        presentDetailScreen(data: data)
        
    }
    
    func presentDetailScreen(data: ListStructre){
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {return}
        vc.data = DetailData(descriptionText: data.descriptionText ?? "", profileImage: data.profileImage ?? "", userName: data.userName ?? "", placeTitle: data.placeTitle ?? "", mainImage: data.fullurl ?? "")
            let customVcTransition = vc
            let transition = CATransition()
            transition.duration = 0
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype(rawValue: CATransitionSubtype.fromRight.rawValue)
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            view.window?.layer.add(transition, forKey: kCATransition)
            vc.modalPresentationStyle = .fullScreen
            present(customVcTransition, animated: false, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if  ((indexPath.item / 2) == 0) {
                    return 213
                }else{
                    return 416
            }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 8
        }else{
            return 0
        }
    }
}

//MAKR: Handle network calls
extension ListViewController:UpdateViewProtocol{
    
    
    //MARK: GET List From Server
     func GetList() {
        var requestDict = Dictionary<String, AnyObject>()
        requestDict[Constants.KEY_Page] = page as AnyObject
        EventsController.sharedInstanceAppController.handleEvent(eventid: NetworkEvents.EVENT_GET_LIST, data: requestDict)
         
     }
    
    func GetRandomImage(){
        EventsController.sharedInstanceAppController.handleEvent(eventid: NetworkEvents.EVENT_GET_RandomImage, data: Dictionary<String, AnyObject>())
    }
    
    //MARK: Handle update Notify from handlers
    func updateView(event: Int, eventtype: Int) {
        self.refreshControl.endRefreshing()
        switch event {
            case NetworkEvents.EVENT_GET_LIST:
                switch eventtype{
                    case ConnectionModel.EVENT_TYPE_SUCCESS:
                        guard let response = ModelFacade.sharedInstanceModelFacade.getListModel().list?.data else {return}
                        print("response \(response)")
                        //print("respone count: \(response.count)")
                        self.listData = self.listData + response
                        self.tableview.isScrollEnabled = true
                        self.tableview.reloadData()
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
                    guard let response = ModelFacade.sharedInstanceModelFacade.getRandomImage().randomImage else {return}
                    print("response \(response)")
                    self.banner.loadImageUsingCacheWithUrl(urlString: response.url ?? "")
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
