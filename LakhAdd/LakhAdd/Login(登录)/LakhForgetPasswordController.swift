//
//  LakhForgetPasswordController.swift
//  LakhAdd
//
//  Created by 田涛 on 2017/5/17.
//  Copyright © 2017年 lakh. All rights reserved.
//

import UIKit

class LakhForgetPasswordController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var authCodeTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      self.title = "找回密码"
        
        
    }

    
    //发送验证
    @IBAction func sendAuthCode(_ sender: UIButton) {
        
 
        sender.isSelected = !sender.isSelected
        
    }
    
    
    //密码明文
    @IBAction func mingWenAction(_ sender: Any) {
        
        
        
    }

    //确认button
    @IBAction func sureButton(_ sender: Any) {
        
        
        
    }



}
