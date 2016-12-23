//
//  User.swift
//  Gong
//
//  Created by Kelvin Abrokwa on 12/23/16.
//  Copyright © 2016 Gong. All rights reserved.
//

import UIKit

// User model
class User {
    
    // MARK: Properties
    var userId: Int
    var username: String
    var photo: UIImage?
    
    
    // MARK: Initialization
    init?(userId: Int, username: String, photo: UIImage?) {
        
        guard !username.isEmpty else {
            return nil
        }
        
        self.userId = userId
        self.username = username
        self.photo = photo
    }
}
