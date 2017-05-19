//
//  LakhHttpTool.swift
//  LakhAdd
//
//  Created by 田涛 on 2017/5/18.
//  Copyright © 2017年 lakh. All rights reserved.
//

import Foundation



class LakhHttpTool {
    
    
    //发送邀请码
    class  func getEmailCode(_ registerCode : String!,finishedBlock : @escaping (_ result : Bool) -> ()) {
        
    
        let url = "\(kUrl)/v2/email"
          let dictinoary:[String:String] = ["email" : registerCode]
    
        NetworkTools.requestData(.POST, URLString: url, parameters: dictinoary, finishedCallback: { (request) in
            kPrint.Print(request)

            finishedBlock(request as! Bool)
        })

    }
    
    
    //验证用户名
    class  func getUserCanUser(_ registerCode : String!,finishedBlock : @escaping (_ result : Int) -> ()) {
        
        
        let url = "\(kUrl)/v2/user/\(registerCode!)"
        
        NetworkTools.requestData(.HEAD, URLString: url, headCallback: { (codeResult) in
            
            finishedBlock(codeResult as! Int)
        })
    }

  
    
    
    //注册
    
    
    class  func registerUserName(_ registerUserInfon : [String : Any],finishedBlock : @escaping (_ result : Int) -> ()) {
        
        
        let url = "\(kUrl)/v2/user"
        
       
        NetworkTools.requestData(.POST, URLString: url, parameters: registerUserInfon, success: { (successValue) in
            
            
        }) {(failerValue) in
        
            
        }
    }

    
    
    
}
