//
//  swiftTotalPch.swift
//  MoDao
//
//  Created by 田涛 on 2017/5/9.
//  Copyright © 2017年 田涛. All rights reserved.
//

import Foundation
import UIKit


//屏幕的宽
let kScreenWidth = UIScreen.main.bounds.size.width

//屏幕的高
let kScreenHeight = UIScreen.main.bounds.size.height


//网络链接

let kUrl = "https://api.100000p.com"

class kNSLog: NSObject {
    
  class  func Print(_ message : Any){
        #if DEBUG
            print("\(message)")
        #else
            print("\(message)")
       
        #endif
    }
}

