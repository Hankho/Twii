//
//  UserCell.swift
//  Twii
//
//  Created by Hankho on 2018/1/31.
//  Copyright © 2018年 Hankho. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any?{
        didSet{
            guard let user = datasourceItem as? User else {return}
            nameLabel.text = user.name
            usernameLabel.text = user.username
            bioTextView.text = user.bioText
            profileImageView.image = user.profileImage
        }
    }
    // 使用者頭像
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ironman_img")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Iron Man"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let usernameLabel:UILabel = {
        let label = UILabel()
        label.text = "@GeniusTonyStark"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.gray
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Hello, I'm Tony Stark. And this is my message for all of American people."
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.backgroundColor = .clear
        return textView
    }()
    // 追蹤按鈕
    let followButton:UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = twitterBlue.cgColor
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(twitterBlue, for: .normal)
        button.setImage(#imageLiteral(resourceName: "follow_image"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        bioTextView.anchor(usernameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
}
