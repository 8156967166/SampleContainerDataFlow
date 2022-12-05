//
//  Card.swift
//  sampleContainerDataFlow
//
//  Created by Bimal@AppStation on 19/10/22.
//

import UIKit

class Card: NSObject {
    var name:String = ""
    var email:String = ""
    var address:String = ""
    
    init(_ dict:[String:Any]) {
        name = dict["name"] as? String ?? ""
        email = dict["email"] as? String ?? ""
        address = dict["address"] as? String ?? ""
    }
    
}
