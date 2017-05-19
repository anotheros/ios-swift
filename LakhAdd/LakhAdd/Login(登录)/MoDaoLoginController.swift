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
        
      let  deleagter = UIApplication.shared.delegate;
       deleagter?.window??.rootViewController = MoDaoTabbarController()

        
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
