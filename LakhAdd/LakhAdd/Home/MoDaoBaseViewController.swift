//
//  MoDaoBaseViewController.swift
//  MoDao
//
//  Created by 田涛 on 2017/5/11.
//  Copyright © 2017年 田涛. All rights reserved.
//

import UIKit

class MoDaoBaseViewController: UIViewController {
    //访客视图信息字典
    var visitorInfoDic :[String:String]?
    
    //自定义导航条
    lazy var navgationBar : UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 64))

     lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //取消自动缩进 - 如果隐藏了导航栏 会缩进20点
        automaticallyAdjustsScrollViewInsets = false
        
        steupNavigationBar()
        
        
        
    }
    
    
    override var title : String?{
        didSet{
            navItem.title = title
        }
    }

 
}




extension MoDaoBaseViewController {





    ///设置导航栏
    fileprivate func steupNavigationBar() {
        view.addSubview(navgationBar)
        //将item 设置给barnj
        navgationBar.items = [navItem]
        //设置 navBar 的渲染颜色
        navgationBar.barTintColor = UIColor.init(hex: "#F6F6F6")
        //设置navBar 的标题字体颜色
        navgationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGray]
        //设置系统按钮的文字渲染颜色  只对系统.plain 的方法有效
        navgationBar.tintColor = UIColor.orange
    }
    
    

   



}
