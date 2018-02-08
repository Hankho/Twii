//
//  HomeDatasourceController.swift
//  Twii
//
//  Created by Hankho on 2018/1/25.
//  Copyright © 2018年 Hankho. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController {
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBarItems()
        
//        let homeDatasource = HomeDatasource()
//        self.datasource = homeDatasource
        fetchHomeFeed()
    }
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    class Home: JSONDecodable {
        
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
    }
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
    fileprivate func fetchHomeFeed() {
        // star our json fetch
        
        let request: APIRequest<HomeDatasource,JSONError> = tron.swiftyJSON.request("/twitter/home")
        request.perform(withSuccess: { (homeDatasource) in
            print ("Successfully fetched our json objects")
            print (homeDatasource.users.count)
            self.datasource = homeDatasource
        }) { (err) in
            print("Failed to fetch json...",err)
        }
   
        
        // this is a lot of code, lets use tron instead
        // URLSession.shared.dataTask(with: <#T##URL#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    // cell item size
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if  let user = self.datasource?.item(indexPath) as? User{
            //user.bioText
            //let's get information of the height of our cell based on user.bioText (自動調整bitText高度)
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            let attributes = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15)]
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    
    // 定義Header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // if section是判斷如果是第二個section時，就不要Header、Footer (section是從0開始算，第二個section是 1)
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    // 定義Footer size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        // if section是判斷如果是第二個section時，就不要Header、Footer (section是從0開始算，第二個section是 1)
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}
