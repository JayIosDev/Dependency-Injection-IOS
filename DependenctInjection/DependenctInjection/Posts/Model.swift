//
//  Model.swift
//  DependenctInjection
//
//  Created by Rahul Sharma on 02/10/21.
//

import Foundation
class Model {
    
    var email:String?
    
    init(data: [String:Any]) {
        if let email = data["email"] as? String {
            self.email  = email
        }
    }
}
