//
//  ViewController.swift
//  nesting tables
//
//  Created by Jared Sorge on 2/3/16.
//  Copyright © 2016 Taphouse Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var companies: [Company]?
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.companies = generateCompanies()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    //MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let companies = companies else { return 0 }
        return companies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let companies = companies else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(CompanyCell.cellID, forIndexPath: indexPath) as! CompanyCell
        let company = companies[indexPath.row]
        cell.configureWithCompany(company)
        
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    
    //MARK: UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height: CGFloat = 45
        guard let companies = companies else { return height }
        
        let company = companies[indexPath.row]
        for _ in company.workers {
            height += WorkerTableViewCell.desiredCellHeight
        }
        
        return height
    }
    
}
