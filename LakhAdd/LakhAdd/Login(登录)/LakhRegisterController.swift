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
        
        userNameTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
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
    @IBAction func mingWenAction(_ sender: UIButton) {
        
       
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
             passwordTextField.isSecureTextEntry = false
        }
        else{
         passwordTextField.isSecureTextEntry = true
        
        }
        
    }
    //注册button
    @IBAction func registerButton(_ sender: UIButton) {
        
        guard (emailTextField.text != nil && emailTextField.text != "") else {
            SVProgressHUDLakh.showInfo("请输入邮箱!")
            return;
        }
        guard LYIMOHRTools.verifyEmailAddress(emailTextField.text) else {
            
            SVProgressHUDLakh.showInfo("请输入正确的邮箱格式!")
            return;
        }

        guard (userNameTextField.text != nil && userNameTextField.text != "") else {
            
            SVProgressHUDLakh.showInfo("请输入用户名!")
            return;
        }
        
        guard (authCodeTextField.text != nil && authCodeTextField.text != "") else {
            
            SVProgressHUDLakh.showInfo("请输入验证码!")
            return;
        }
        
        guard (passwordTextField.text != nil && passwordTextField.text != "") else {
            
            SVProgressHUDLakh.showInfo("请输入密码!")
            return;
        }
        
        
        //注册账号
        LakhHttpTool.registerUserName(["code":authCodeTextField.text!,
                                       "userName":userNameTextField.text!,
                                       "email":emailTextField.text!,
                                       "password":passwordTextField.text!], finishedBlock: { (successBlock, tokenBlock) in
                                        
            
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
                                        
        }) { (errorMessage) in

            print(errorMessage)
            
        }


    }
    
    
}

extension UIViewController : UITextFieldDelegate{


    
    public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {

   //验证用户名
      LakhHttpTool.getUserCanUser(textField.text) { (codeResult) in
        
        switch codeResult {
        case 200:
          SVProgressHUDLakh.showInfo("用户名可用!")
            break
        case 409:
            
        SVProgressHUDLakh.showInfo("用户名不可用!")
            break
        case 500:
            
            SVProgressHUDLakh.showInfo("接口调用异常!")
            break
        default:
            
            break
        }
 
        }
  
    }
    





}

