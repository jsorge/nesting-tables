//
//  Model.swift
//  nesting tables
//
//  Created by Jared Sorge on 2/3/16.
//  Copyright © 2016 Taphouse Software. All rights reserved.
//

import Foundation


struct Company {
    let name: String
    let workers: [Worker]
}

struct Worker {
    let name: String
    let imageName: String
}

