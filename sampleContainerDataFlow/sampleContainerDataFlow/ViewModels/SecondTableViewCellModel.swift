//
//  SecondTableViewCellModel.swift
//  sampleContainerDataFlow
//
//  Created by Bimal@AppStation on 19/10/22.
//

import UIKit

enum SecondTableViewCellType {
    case address 
}

class SecondTableViewCellModel: NSObject {
    var identifier:String = "secondVC.tableCell.address"
    var cellType: SecondTableViewCellType = .address
    
    init(_ cellType:SecondTableViewCellType) {
        self.cellType = cellType
        switch cellType {
        case .address:
            identifier = "secondVC.tableCell.address"
        }
    }
}
