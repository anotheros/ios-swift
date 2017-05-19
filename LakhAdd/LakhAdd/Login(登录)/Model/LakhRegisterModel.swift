//
//  LakhRegisterModel.swift
//  LakhAdd
//
//  Created by 田涛 on 2017/5/19.
//  Copyright © 2017年 lakh. All rights reserved.
//

import UIKit

class LakhRegisterModel: NSObject {

    // 用户的id
//    var id = ""
    // 昵称, 默认为 id, 可修改一次
    var nickname = ""
    
    // 个性域名, 默认为 id, 可修改一次
    var urlToken = ""
    
    // 默认收藏夹id
    var defaultCollectionsId = ""
    
    // 注册时间, Unix 时间戳
    var createTime = ""
    
    // 正在关注数量
    var idolCount = 0
    
     // 粉丝数量
    var fansCount = 0
    
    // 微刊数量
    var collectionsCount = 0
    
    // 关注的微刊数量
    var followCollectionsCount = 0
    
     // 关注的标签数量
    var followTagsCount = 0
    
    
    
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
   
}
