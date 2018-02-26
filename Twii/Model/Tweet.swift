//
//  Tweet.swift
//  Twii
//
//  Created by Hankho on 2018/2/6.
//  Copyright © 2018年 Hankho. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Tweet {
    let user:User
    let message: String
   
    init(json:JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}
