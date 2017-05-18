//
//  LakhRegisterController.swift
//  LakhAdd
//
//  Created by 田涛 on 2017/5/17.
//  Copyright © 2017年 lakh. All rights reserved.
//

import UIKit

class LakhRegisterController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var authCodeTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "注册账号"
    }

  


  
    /// - Parameter sender: 发送验证码
    @IBAction func sendAutoCode(_ sender: Any) {
        
     
     //1 验证是否为邮箱
        guard (emailTextField.text != nil && emailTextField.text != "") else {
             SVProgressHUDLakh.showInfo("请输入邮箱!")
            return;
        }
        guard LYIMOHRTools.verifyEmailAddress(emailTextField.text) else {
            
            SVProgressHUDLakh.showInfo("请输入正确的邮箱格式!")
            return;
        }
        
     //2 发送验证码
        
        LakhHttpTool.getEmailCode(emailTextField.text!) { (resultSuccess) in
            
            guard resultSuccess else {
                SVProgressHUDLakh.showInfo("发送验证码失败!")
                return
            }
            SVProgressHUDLakh.showInfo("发送验证码成功,请到邮箱查看!")
            
        }
        
       
        
    }
    
    //密码明文
    @IBAction func mingWenAction(_ sender: Any) {
    }
    //注册button
    @IBAction func registerButton(_ sender: Any) {
    }
    

}


extension UIViewController{


    
    
    





}

