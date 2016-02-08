//
//  WorkerTableViewCell.swift
//  nesting tables
//
//  Created by Jared Sorge on 2/7/16.
//  Copyright © 2016 Taphouse Software. All rights reserved.
//

import UIKit

class WorkerTableViewCell: UITableViewCell {
    
    //IBOutlets
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    //MARK: API
    func configureWithWorker(worker: Worker) {
        personImageView.image = UIImage(named: worker.imageName.rawValue)
        nameLabel.text = "\(worker.name)"
    }
    
}
