//
//  TableViewController.swift
//  ServicePractice
//
//  Created by Shawn Li on 5/28/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var photos = [Profile]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        Service.shared.fetchPictureData()
        { (profile) in
            self.photos = profile
            DispatchQueue.main.async
            {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        Service.shared.fetchImage(url: photos[indexPath.row].avatar){ (image) in cell.configCell(image: image!)}
        
        return cell
    }
}
