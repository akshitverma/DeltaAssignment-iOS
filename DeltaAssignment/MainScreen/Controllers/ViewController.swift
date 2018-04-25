//
//  ViewController.swift
//  DeltaAssignment
//
//  Created by Akshit Verma on 24/04/18.
//  Copyright © 2018 Akshit Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // ****** Outlets ******* //
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        registerNibs()
        
    }
    
    func registerNibs(){
        tableView.register(UINib(nibName: "ViewOptionCell", bundle: Bundle.main), forCellReuseIdentifier: "ViewOptionCell")
    }


}


/* ******TableView Functions********* */
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewOptionCell", for: indexPath) as? ViewOptionCell
        
        //Setting up cell
        switch indexPath.row{
        case 0:
            cell?.setUpCell(viewName: "List View")
        case 1:
            cell?.setUpCell(viewName: "Carousel View")
        default:
            cell?.setUpCell(viewName: "No Name")
        }
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var listViewVC : ListViewController!
        listViewVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        
        var carouselViewVC : CarouselViewController!
        carouselViewVC = self.storyboard?.instantiateViewController(withIdentifier: "CarouselViewController") as! CarouselViewController
        
        switch indexPath.row{
        case 0:
            self.navigationController?.pushViewController(listViewVC, animated: true)
        case 1:
            self.navigationController?.pushViewController(carouselViewVC, animated: true)
        default:
            self.navigationController?.pushViewController(listViewVC, animated: true)
        }
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

