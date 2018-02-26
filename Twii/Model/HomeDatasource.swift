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
    // 宣告陣列 users
    let users:[User]
    // 宣告陣列 tweets
    let tweets:[Tweet]
    
    required init(json: JSON) throws {

        guard let usersJsonArray = json["users"].array,
              let tweetsJsonArray = json["tweets"].array else{
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey:"Parsing JSON was not valid."])
        }
        self.users = usersJsonArray.map({User(json: $0)})

        self.tweets = tweetsJsonArray.map({Tweet(json: $0)})
//        let tweetsJsonArray = json["tweets"].array
//        for tweetJSON in tweetsJsonArray! {
//            let tweet = Tweet(json: tweetJSON)
//            tweets.append(tweet)
//        }
        
        //self.tweets = tweets
    }
    
    
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
