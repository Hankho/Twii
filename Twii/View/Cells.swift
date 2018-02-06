//
//  Cells.swift
//  Twii
//
//  Created by Hankho on 2018/1/25.
//  Copyright © 2018年 Hankho. All rights reserved.
//

import LBTAComponents

let twitterBlue = UIColor(r: 61, g: 167, b: 244)

// 客製化Footer
class UserFooter: DatasourceCell {
    override func setupViews() {
        
        let textLabel:UILabel = {
            let label = UILabel()
            label.text = "Show me more"
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = twitterBlue
            return label
        }()
        super.setupViews()
        let whiteBackgroundView = UIView()
        whiteBackgroundView.backgroundColor = .white
        addSubview(whiteBackgroundView)
        addSubview(textLabel)
        whiteBackgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
// 客製化Header
class UserHeader: DatasourceCell {
    
    let textLabel:UILabel = {
        let label = UILabel()
        label.text = "Who To Follow"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
}



