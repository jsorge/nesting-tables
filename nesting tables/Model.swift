//
//  Model.swift
//  nesting tables
//
//  Created by Jared Sorge on 2/3/16.
//  Copyright © 2016 Taphouse Software. All rights reserved.
//

import Foundation

enum Image: String {
    case Male = "male"
    case Female = "female"
}


struct Company {
    let name: String
    let workers: [Worker]
}

struct Worker {
    let name: String
    let imageName: Image
}


func generateCompanies() -> [Company] {
    var companies = [Company]()
    
    do {
        let jared = Worker(name: "Jared", imageName: .Male)
        let adam = Worker(name: "Adam", imageName: .Male)
        let molly = Worker(name: "Molly", imageName: .Female)
        let zulily = Company(name: "zulily", workers: [jared, adam, molly])
        companies.append(zulily)
    }
    
    do {
        let steve = Worker(name: "Steve", imageName: .Male)
        let tim = Worker(name: "Tim", imageName: .Male)
        let angela = Worker(name: "Angela", imageName: .Female)
        let apple = Company(name: "Apple", workers: [steve, tim, angela])
        companies.append(apple)
    }
    
    do {
        let marissa = Worker(name: "Marissa", imageName: .Female)
        let yahoo = Company(name: "Yahoo", workers: [marissa])
        companies.append(yahoo)
    }
    
    return companies
}