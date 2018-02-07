//
//  HomeDatasource.swift
//  Twii
//
//  Created by Hankho on 2018/1/25.
//  Copyright © 2018年 Hankho. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users:[User] = {
        let tonyUser = User(name: "TonyStark", username: "@geniusTony", bioText: "Hello, I'm Tony Stark. And this is my message for all of American people.", profileImage: #imageLiteral(resourceName: "ironman_img"))
        let PepperUser = User(name: "Pepper", username: "@beautypepper", bioText: "Hey,Boss. I think that I have to arrange our schedule for my holiday.", profileImage: #imageLiteral(resourceName: "pepper_img"))
        let HankUser = User(name: "Hankho", username: "@hankhe", bioText: "Uh... I'm creator of this app~\nDo you like this?\nIf you like,pls press the button of Follow.", profileImage: #imageLiteral(resourceName: "hank_img"))
        return [tonyUser,PepperUser,HankUser]
    }()
    
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
