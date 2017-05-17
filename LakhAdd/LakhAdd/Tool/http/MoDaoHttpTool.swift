//
//  MoDaoHttpTool.swift
//  MoDao
//
//  Created by 田涛 on 2017/5/8.
//  Copyright © 2017年 田涛. All rights reserved.
//

import UIKit
import Alamofire


public enum MethodType: String {
    
    case OPTIONS, GET, HEAD, POST, PUT, PATCH, DELETE, TRACE, CONNECT
}

public enum ParameterEncoding {
    case URL
    case URLEncodedInURL
    case JSON
    case PropertyList(PropertyListSerialization.PropertyListFormat, PropertyListSerialization.WriteOptions)
    case Custom((URLRequestConvertible, [String: AnyObject]?) -> (NSMutableURLRequest, NSError?))
}
//get 与post 请求


 class NetworkTools {
      class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        
        // 1.获取类型
        var method : HTTPMethod
 
        switch type {
        case .OPTIONS:
           
           method = HTTPMethod.options
        case .GET:
            
            method = HTTPMethod.get
        case .HEAD:
            
            method = HTTPMethod.head
            
        case .POST:
            
            method = HTTPMethod.post

        case .PUT:
            
            method = HTTPMethod.put
            
        case .PATCH:
            
            method = HTTPMethod.patch
            
        case .DELETE:
            
            method = HTTPMethod.delete
            
        case .TRACE:
            
            method = HTTPMethod.trace
            
        case .CONNECT:
            
            method = HTTPMethod.connect
   
    
        }
        
        
        
        
        //请求头
        let headers = ["Accept": "application/json","Content-Type": "application/json","charset":"utf-8"]
        // 2.发送网络请求
        
       
        
        Alamofire.request(URLString, method: method, parameters:parameters, encoding: JSONEncoding.default ,headers: headers  ).responseJSON { (response) in
            
            // 3.获取结果
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            
            // 4.将结果回调出去
            finishedCallback(result)
        }
        
       

        
        
        
        
        
    }
    
    

    
    
    
    
    
    
    

}





/*
 使用
 
 NetworkTools.requestData(.get, URLString: "http://httpbin.org/get") { (result) in
 print(result)
 }
 
 NetworkTools.requestData(.post, URLString: "http://httpbin.org/post", parameters: ["name": "JackieQu"]) { (result) in
 print(result)
 }
 */
