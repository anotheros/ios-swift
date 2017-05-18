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
    
        NetworkTools.requestData(.POST, URLString: url, parameters: dictinoary ) { (request) in
            kNSLog.Print(request)
          
            
            
           finishedBlock(true)
        }

    }
    
    
  
    
    
    
    
}
