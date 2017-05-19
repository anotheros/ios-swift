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
    
    
    
    //邮箱发验证码
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
            

            guard ((response.response?.statusCode) != nil ) else {
 
                 finishedCallback(false)
                 return
            }
            
            guard ((response.response?.statusCode) == 200 ) else {
                
                finishedCallback(false)
                return
            }
            
             finishedCallback(true)
    
        }

        
        
    }
    
    

    
    
    
    //邮箱发验证码
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, headCallback :  @escaping (_ headResult : Any) -> ()) {
        
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
        
   
        // utf-8怎么转
        
        
        Alamofire.request(URLString, method: method, parameters:parameters, encoding: JSONEncoding.default ,headers: headers  ).responseJSON { (response) in
            
            print(response)
            guard ((response.response?.statusCode) != nil ) else {
                
                headCallback(500)
                return
            }
            
            switch response.response!.statusCode {
            case 200:
                headCallback(200)
                break
                
            case 409:
                headCallback(409)
                break
                
            default:
                headCallback(500)
                break

            }

            
        }
        
        
    }
    
    
    
    //注册
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, success :  @escaping (_ registerResult : Any, _ Token : Any) -> (), failture : @escaping (_ error : Error)->()) {
        
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
            
            
            
            let dic = response.response?.allHeaderFields
    
            
            print(dic?["token"] ?? 222)
          
            switch response.result{
            case .success:
                if let value = response.result.value as? [String: AnyObject] {
                    
                    success(value,dic?["token"] ?? "222222" )
                    
                }
            case .failure(let error):
               
                failture(error)
                
            }
            
            
            
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
