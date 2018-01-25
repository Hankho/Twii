//
//  HomeDatasourceController.swift
//  Twii
//
//  Created by Hankho on 2018/1/25.
//  Copyright © 2018年 Hankho. All rights reserved.
//

import LBTAComponents

class HomeDatasourceController: DatasourceController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
        
    }
    // 定義Header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
       return CGSize(width: view.frame.width, height: 100)
    }
}
