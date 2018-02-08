//
//  HomeDatasource.swift
//  Twii
//
//  Created by Hankho on 2018/1/25.
//  Copyright © 2018年 Hankho. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource,JSONDecodable {
    
    let users:[User]
    
    required init(json: JSON) throws {
        
        var users = [User]()
        
        let array = json["users"].array
        for userJSON in array! {
            let name = userJSON["name"].stringValue
            let username = userJSON["username"].stringValue
            let bio = userJSON["bio"].stringValue
            
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            print(user.username)
            users.append(user)
        }
        self.users = users
    }
    
    let tweets:[Tweet] = {
        let tonyUser = User(name: "TonyStark", username: "@geniusTony", bioText: "Hello, I'm Tony Stark. And this is my message for all of American people.", profileImage: #imageLiteral(resourceName: "ironman_img"))
        let tweet = Tweet(user: tonyUser, message:"Welcome to episode 9 of the Twitter Series, really hope you guys are enjoying the series so far. I really need a long text bloc to render out so we're going to stop here.")
        let tweet2 = Tweet(user: tonyUser, message:"This is the second tweet message for our sample project. Very very exciting message....")
        return [tweet,tweet2]
    }()
    
    //let word = ["Hank","Eric","Andy"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    // return 客製化的UserCell
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }    
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
}
