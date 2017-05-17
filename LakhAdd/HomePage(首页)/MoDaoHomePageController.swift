//
//  MoDaoHomePageController.swift
//  MoDao
//
//  Created by 田涛 on 2017/5/11.
//  Copyright © 2017年 田涛. All rights reserved.
//

import UIKit

class MoDaoHomePageController: MoDaoBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let style = HYPageStyle()
        style.isScrollEnable = true

        let titles = ["推荐", "爱情观", "JAVA", "IOS"]
        
        // 3.获取所有的内容控制器
        var childVcs = [UIViewController]()
        for _ in 0..<titles.count {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.randomColor
            childVcs.append(vc)
        }
        
        // 4.创建HYPageView
        let pageFrame = CGRect(x: 0, y: 64, width: view.bounds.width, height: view.bounds.height - 64)
        let pageView = HYPageView(frame: pageFrame, style: style, titles: titles, childVcs: childVcs, parentVc : self)
        pageView.backgroundColor = UIColor.white
        view.addSubview(pageView)

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
        
        
        
    }
    



}
