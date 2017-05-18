//
//  swiftTotalPch.swift
//  MoDao
//
//  Created by 田涛 on 2017/5/9.
//  Copyright © 2017年 田涛. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

//屏幕的宽
let kScreenWidth = UIScreen.main.bounds.size.width

//屏幕的高
let kScreenHeight = UIScreen.main.bounds.size.height


//网络链接

let kUrl = "https://api.100000p.com"

class kNSLog {
    
  class  func Print(_ message : Any){
        #if DEBUG
            print("\(message)")
        #else
            print("\(message)")
       
        #endif
    }
}




class SVProgressHUDLakh {


    //设置模式
    class func setDefaultStyle(_ style: SVProgressHUDStyle){
        SVProgressHUD.setDefaultStyle(style)
    
    }


    //显示信息
    class func showInfo(_ withStatus: String!){
        SVProgressHUD.showInfo(withStatus: withStatus)
        
    }
    

    //显示进度条
    class func showProgress(_ progress: Float){
    
        SVProgressHUD.showProgress(progress)
    
    }
     //显示进度条带信息
    class func showProgress1(_ progress: Float, _ status: String!){
        
        SVProgressHUD.showProgress(progress, status: status)
        
    }
    


    
    //显示
    class func show(){
        
        SVProgressHUD.show()
        
    }
    
    //显示带信息
    class func show(withStatus :String!){

        SVProgressHUD.show(withStatus: withStatus)
        
    }
    
    //隐藏HUD
    class func dismiss(){
        
        SVProgressHUD.dismiss()
        
    }
    
    
    //隐藏加延时
    class func dismiss(_ withDelay: TimeInterval){
        
        SVProgressHUD.dismiss(withDelay: withDelay)
        
    }
    
    
    

}
