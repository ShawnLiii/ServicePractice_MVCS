//
//  Model.swift
//  ServicePractice
//
//  Created by Shawn Li on 5/28/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import Foundation

struct Profile: Decodable
{
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: URL
}

struct ProfileData: Decodable
{
    var data: [Profile]
}
