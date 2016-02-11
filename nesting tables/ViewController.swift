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
        return UITableViewCell()
    }
}


extension ViewController: UITableViewDelegate {
    //MARK: UITableViewDelegate
}


class CompanyCell: UITableViewCell {
    
    private var company: Company?
    
    //IBOutlets
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var workerTableView: UITableView!
    
    //MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        
        workerTableView.dataSource = self
        workerTableView.delegate = self
        
        workerTableView.registerNib(WorkerTableViewCell.nib, forCellReuseIdentifier: WorkerTableViewCell.cellID)
    }
    
}

extension CompanyCell: UITableViewDataSource {
    //MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let company = company else { return 0 }
        
        return company.workers.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let company = company else { return UITableViewCell() }
        
        return UITableViewCell()
    }
}

extension CompanyCell: UITableViewDelegate {
    
}
