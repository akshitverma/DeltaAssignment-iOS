//
//  CarouselViewController.swift
//  DeltaAssignment
//
//  Created by Akshit Verma on 24/04/18.
//  Copyright © 2018 Akshit Verma. All rights reserved.
//

import UIKit

class CarouselViewController: UIViewController {

    
    /* Outlets */
    @IBOutlet weak var collectionView: UICollectionView!
    
    var profileData = [DataModel]()
    let navBar = Bundle.main.loadNibNamed("NavigationView", owner: self, options: nil)?.first as! NavigationView
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 25.0, left: 0.0, bottom: 25.0, right: 0.0)
    fileprivate let itemsPerRow: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CommonFunctions.sharedInstance.setUpActivityIndicator(view: self.view)

        setUpNavigationBar()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.isPagingEnabled = true
        collectionView.isHidden = true
        registerNibs()
        
        //API HIT
        getDataAndInitializeModel { (success) in
            if success{
                
                //********* PRINTING the COUNT of JSON Here *************//
                self.collectionView.reloadData()
                self.collectionView.isHidden = false
                
            }
        }

    }

    override func viewWillAppear(_ animated: Bool) {
       

        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    func registerNibs(){
        collectionView.register(UINib(nibName: "CarouselViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CarouselViewCell")
    }
    
    func setUpNavigationBar(){
        navBar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 70)
        navBar.backgroundColor = UIColor.init(red: 0, green: 168/255, blue: 107/255, alpha: 0.75)
        navBar.leftButtonAction = self.backAction
        navBar.title.text = "Carousel View"
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


/* ******CollectionView Functions********* */

extension CarouselViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselViewCell", for: indexPath) as? CarouselViewCell
        
//        cell?.layer.shouldRasterize = true;
//        cell?.layer.rasterizationScale = UIScreen.main.scale

        
        //Setting up cell
        cell?.setUpCell(imageUrl: profileData[indexPath.row].imageUrl, name: profileData[indexPath.row].name, email: profileData[indexPath.row].email)
        
        print(cell?.emailLabel.text)
        
        return cell!
    }
}

extension CarouselViewController: UICollectionViewDelegate{
    

    
}
//For Carousel like Layout//
extension CarouselViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

