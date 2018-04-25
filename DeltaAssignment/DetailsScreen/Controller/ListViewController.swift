//
//  ListViewController.swift
//  DeltaAssignment
//
//  Created by Akshit Verma on 24/04/18.
//  Copyright © 2018 Akshit Verma. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    
    //****Outlets*****//
    @IBOutlet weak var tableView: UITableView!
    
    //Mark:- Properties
    var profileData = [DataModel]()
    let navBar = Bundle.main.loadNibNamed("NavigationView", owner: self, options: nil)?.first as! NavigationView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CommonFunctions.sharedInstance.setUpActivityIndicator(view: self.view)
        setUpNavigationBar()
        tableView.delegate = self
        tableView.dataSource = self
        registerNibs()
        tableView.isHidden = true
        
        //API HIT
        getDataAndInitializeModel { (success) in
            if success{
                
                //********* PRINTING the COUNT of JSON Here *************//
                self.tableView.reloadData()
                self.tableView.isHidden = false
                
            }
        }
        
    }

    func registerNibs(){
        tableView.register(UINib(nibName: "ListViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ListViewCell")
    }
    
    func setUpNavigationBar(){
        navBar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 70)
        navBar.backgroundColor = UIColor.init(red: 0, green: 168/255, blue: 107/255, alpha: 0.75)
        navBar.leftButtonAction = self.backAction
        navBar.title.text = "List View"
        self.view.addSubview(navBar)
    }
    
    func backAction(){
        self.navigationController?.popViewController(animated: true)
   
    }
    
    func getDataAndInitializeModel(completion: @escaping (_ success: Bool)-> Void){
        
        CommonFunctions.sharedInstance.showActivityindicator()
        
        //Calling API Hit for Profile Data
        APIManager.sharedInstance.getProfileData { (data, message) in
            NSLog("-----> Get Profile Data API finished.")
            
            for datum in data{
                self.profileData.append(DataModel(json: datum))
            }
            
            CommonFunctions.sharedInstance.hideActivityIndicator()
            completion(true)
        }
    }

}

/* ******TableView Functions********* */
extension ListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath) as? ListViewCell
        
        //Setting up cell
        cell?.setUpCell(imageUrl: profileData[indexPath.row].imageUrl, name: profileData[indexPath.row].name, email: profileData[indexPath.row].email)
        
        return cell!
    }
    
    
}

extension ListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
}

