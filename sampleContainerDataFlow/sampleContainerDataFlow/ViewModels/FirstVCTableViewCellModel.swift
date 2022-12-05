//
//  FirstVCTableViewCellModel.swift
//  sampleContainerDataFlow
//
//  Created by Bimal@AppStation on 19/10/22.
//

import UIKit

enum FirstVCTableViewCellType {
    case name
    case email
}

class FirstVCTableViewCellModel: NSObject {
    var identifier:String = "firstVC.tableCell.name"
    var cellType: FirstVCTableViewCellType = .name
    var errorCard:Card = Card([:])

    init(_ cellType:FirstVCTableViewCellType, _ errorCard:Card) {
        self.cellType = cellType
        self.errorCard = errorCard
        switch cellType {
        case .name:
            identifier = "firstVC.tableCell.name"
        case .email:
            identifier = "firstVC.tableCell.email"
        }
    }
    
    func getFieldError() ->String {
        switch cellType {
        case .name:
            return errorCard.name
        case .email:
            return errorCard.email
        }
    }
}
