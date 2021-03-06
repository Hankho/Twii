//
//  service.swift
//  Twii
//
//  Created by Hankho on 2018/2/12.
//  Copyright © 2018年 Hankho. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    // 建構 instance
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource?, Error?) -> ()) {
        print("Fetching home feed")
       
        let request: APIRequest<HomeDatasource,JSONError> = tron.swiftyJSON.request("/twitter/home1")
        request.perform(withSuccess: { (homeDatasource) in
            print ("Successfully fetched our json objects")
            completion(homeDatasource, nil)
 //           self.datasource = homeDatasource
        }) { (err) in
            
            completion(nil, err)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
    
}
