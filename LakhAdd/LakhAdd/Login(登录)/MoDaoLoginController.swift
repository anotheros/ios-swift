//
//  MoDaoLoginController.swift
//  MoDao
//
//  Created by 田涛 on 2017/5/16.
//  Copyright © 2017年 田涛. All rights reserved.
//

import UIKit

class MoDaoLoginController: UIViewController {
    
    @IBOutlet weak var loginIcon: UIImageView!
    
    
    @IBOutlet weak var emailName: UITextField!

    @IBOutlet weak var passWord: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
        self.title = "登录"
    
    }

    //明文展示密码
    @IBAction func showPasswordChange(_ sender: UIButton) {
        
        
        sender.isSelected = !sender.isSelected
    }

    //登录
    @IBAction func loginAction(_ sender: Any) {
        
        
        guard (emailName.text != nil && emailName.text != "") else {
            SVProgressHUDLakh.showInfo("请输入邮箱!")
            return;
        }
        guard LYIMOHRTools.verifyEmailAddress(emailName.text) else {
            
            SVProgressHUDLakh.showInfo("请输入正确的邮箱格式!")
            return;
        }
        guard (passWord.text != nil && passWord.text != "") else {
            SVProgressHUDLakh.showInfo("请输入密码!")
            return;
        }
 
       //网络请求
        LakhHttpTool.LoginUserName(["email":emailName.text!,
                                    "password":passWord.text!
                                    ], finishedBlock: { (successBlock, tokenBlock) in
         
                                        
                                        //1 将successBlock 转成 字典
                                        
                                        guard successBlock is [String : NSObject] else {
                                            
                                            return
                                        }
                                        
                                        let registerModel = LakhRegisterModel(dict: successBlock as! [String : Any])
                                        
                                        
                                        print(registerModel)
                                        
                                        
                                        
                                        guard successBlock is String else {
                                            
                                            return
                                        }
                                        
                                        
                                        LakhToken = tokenBlock as! String
                                        
                                        print(LakhToken)
                                        
                                        
                                        
                                        let  deleagter = UIApplication.shared.delegate;
                                        deleagter?.window??.rootViewController = MoDaoTabbarController()
           
                                        
        }) { (errorMessage) in
            
            print(errorMessage)

            
        }
        
        
        
        
        
   
        
    }
    
    //找回密码
    @IBAction func findPassword(_ sender: Any) {
        
        self.navigationController?.pushViewController(LakhForgetPasswordController(), animated: true)
        
        
    }
    
    //注册账号
    @IBAction func registerEmial(_ sender: Any) {

        self.navigationController?.pushViewController(LakhRegisterController(), animated: true)
        

    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

}



extension MoDaoLoginController {






}
