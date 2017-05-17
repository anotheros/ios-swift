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

  


    /// <#Description#>
    ///
    /// - Parameter sender: 发送验证码
    @IBAction func sendAutoCode(_ sender: Any) {
    }
    
    //密码明文
    @IBAction func mingWenAction(_ sender: Any) {
    }
    //注册button
    @IBAction func registerButton(_ sender: Any) {
    }
    

}
