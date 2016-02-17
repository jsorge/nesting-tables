//
//  CompanyCell.swift
//  nesting tables
//
//  Created by Jared Sorge on 2/16/16.
//  Copyright © 2016 Taphouse Software. All rights reserved.
//

import UIKit

public class CompanyCell: UITableViewCell {
    
    private var company: Company?
    
    public static let cellID = "CompanyCell"
    
    //IBOutlets
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var workerTableView: UITableView!
    
    //MARK: API
    public func configureWithCompany(company: Company) {
        self.company = company
        
        companyNameLabel.text = company.name
        workerTableView.reloadData()
    }
    
    //MARK: Overrides
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        workerTableView.dataSource = self
        
        workerTableView.registerNib(WorkerTableViewCell.nib, forCellReuseIdentifier: WorkerTableViewCell.cellID)
    }
    
}

extension CompanyCell: UITableViewDataSource {
    //MARK: UITableViewDataSource
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let company = company else { return 0 }
        
        return company.workers.count
    }
    
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let company = company else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(WorkerTableViewCell.cellID, forIndexPath: indexPath) as! WorkerTableViewCell
        let worker = company.workers[indexPath.row]
        cell.configureWithWorker(worker)
        
        return cell
    }
}
