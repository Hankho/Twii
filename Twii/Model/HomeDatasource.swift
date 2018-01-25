//
//  HomeDatasource.swift
//  Twii
//
//  Created by Hankho on 2018/1/25.
//  Copyright © 2018年 Hankho. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    let word = ["Hank","Eric","Andy"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    // return 客製化的UserCell
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    
    
    override func numberOfItems(_ section: Int) -> Int {
        return word.count
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return word[indexPath.item]
    }
}
