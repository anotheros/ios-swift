//
//  MoDaoTabbarController.swift
//  MoDao
//
//  Created by 田涛 on 2017/5/11.
//  Copyright © 2017年 田涛. All rights reserved.
//

import UIKit

class MoDaoTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

          steupChildControllers()
        
        
        
    }
    

    //设置所有子控制器
    private func steupChildControllers() {
        
        
        let array: [[String:Any]] = [
            ["clsName":"MoDaoHomePageController","title":"首页","imageName":"home","visitorInfo" : ["imageName": "","message":"关注一些人，回这里看看有什么惊喜"]],
            ["clsName":"MoDaoWeiKanController","title":"微刊","imageName":"message_center","visitorInfo" : ["imageName": "visitordiscover_image_message","message":"登陆后，别人评论你的微博，发给你的消息，都会在这里收到通知"]],
            ["clsName":"MoDaoFaJiController","title":"发籍","imageName":"message_center","visitorInfo" : ["imageName": "visitordiscover_image_message","message":"登陆后，别人评论你的微博，发给你的消息，都会在这里收到通知"]],
            ["clsName":"MoDaoFindController","title":"发现","imageName":"discover","visitorInfo" : ["imageName": "visitordiscover_image_message","message":"登陆后，最新、最热的微博尽在掌握中，不会再于实事潮流擦肩而过"]],
            ["clsName":"MoDaoMeController","title":"我","imageName":"profile","visitorInfo" : ["imageName": "visitordiscover_image_profile","message":"登陆后，你的微博、相册、个人资料会显示在这里，展示给别人"]]
        ]
        //测试数据格式是否正确 转换成plist 数据更加直观
        //(array as NSArray) .write(toFile: "/Users/yaowei/Desktop/demo.plist", atomically: true)
        
        
        var viewControllerArr = [UIViewController]()
        
        for dic in array {
            viewControllerArr.append(controller(dic: dic))
        }
        
        viewControllers = viewControllerArr

        
        
        
    }
    
    
    
    
    
    /// 使用字典创建子控制器
    ///
    /// - parameter dic: 信息字典[clsName,title,imageName]
    ///
    /// - returns: 子控制器
    
    private func controller(dic:[String:Any]) ->UIViewController {
        //1 取得字典内容
        guard let clsName = dic["clsName"] as? String,
            let title = dic["title"] as? String,
            let imageName = dic["imageName"] as? String,
            let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? MoDaoBaseViewController.Type,
            let visitorDic = dic["visitorInfo"] as? [String: String]
            else {
                return UIViewController()
        }
        
        //2 创建视图控制器
        let vc = cls.init()
        vc.title = title
        
        //设置控制器的访客信息字典
        vc.visitorInfoDic = visitorDic
        
        //3 添加图片
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        //4 修改 tabbar 的标题前景色
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for:.highlighted)
        //修改字体 系统默认是12号
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12)], for: .normal)
        
        // 实例化导航控制器 会调用push 方法 讲rootVC 压栈
        let nav = MoDaoNavgationViewController(rootViewController: vc)
        return nav
    }


}
