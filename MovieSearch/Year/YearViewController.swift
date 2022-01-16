//
//  YearViewController.swift
//  MovieSearch
//
//  Created by RTAYLO25 on 11/29/21.
//  Copyright © 2021 Auburn University at Montgomery. All rights reserved.
//

import UIKit

class YearViewController: UIViewController {

    
    @IBOutlet weak var tableView:UITableView!
    
    let manager = YearDataManager()
    
    var selectedYear:YearItem?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        manager.fetch()
    }
    
    func set(selected cell: UITableViewCell, at indexPath: IndexPath)
    {
        if let year = selectedYear?.year
        {
            let data = manager.findYear(by: year)
            if data.isFound
            {
                if indexPath.row == data.position
                {
                    cell.accessoryType = .checkmark
                }
                else {cell.accessoryType = .none}
            }
        }
        else
        {
            cell.accessoryType = .none
        }
    }

}

// MARK: UITableViewDataSource
extension YearViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.numberOfItems()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YearIdentifier", for: indexPath) as UITableViewCell
        cell.textLabel?.text = manager.YearItem(at: indexPath).full
        set(selected: cell, at: indexPath)
        
        return cell
    }
}

extension YearViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let cell = tableView.cellForRow(at: indexPath)
        {
            cell.accessoryType = .checkmark
            selectedYear = manager.YearItem(at: indexPath)
            tableView.reloadData()
        }
    }
}

