//
//  WorkerTableViewCell.swift
//  nesting tables
//
//  Created by Jared Sorge on 2/7/16.
//  Copyright © 2016 Taphouse Software. All rights reserved.
//

import UIKit

class WorkerTableViewCell: UITableViewCell {
    
    static let cellID = "WorkerCell"
    static var desiredCellHeight: CGFloat {
        get {
            return CGFloat(55)
        }
    }
    static var nib: UINib {
        get {
            let nibNambe = "WorkerTableViewCell"
            let bundle = NSBundle.mainBundle()
            let nib = UINib(nibName: nibNambe, bundle: bundle)
            return nib
        }
    }
    
    //IBOutlets
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    //MARK: API
    func configureWithWorker(worker: Worker) {
        personImageView.image = UIImage(named: worker.imageName.rawValue)
        nameLabel.text = "\(worker.name)"
    }
    
}
