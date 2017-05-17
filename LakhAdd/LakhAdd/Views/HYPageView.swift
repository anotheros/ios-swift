//
//  HYPageView.swift
//  HYPageView
//
//  Created by seemygo on 17/4/8.
//  Copyright © 2017年 seemygo. All rights reserved.
//

import UIKit


class HYPageView: UIView {
    // 在swift中, 如果子类有自定义构造函数, 或者重新父类的构造函数, 那么必须实现父类中使用required修饰的构造函数
    
    // MARK: 定义属性
    fileprivate var style : HYPageStyle
    fileprivate var titles : [String]
    fileprivate var childVcs : [UIViewController]
    fileprivate var parentVc : UIViewController
    
    // MARK: 构造函数
    init(frame: CGRect, style : HYPageStyle, titles : [String], childVcs : [UIViewController], parentVc : UIViewController) {
        // 在super.init()之前, 需要保证所有的属性有被初始化
        // self.不能省略: 在函数中, 如果和成员属性产生歧义
        self.style = style
        self.titles = titles
        self.childVcs = childVcs
        self.parentVc = parentVc
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension HYPageView {
    fileprivate func setupUI() {
        // 1.创建HYTitleView
        let titleFrame = CGRect(x: 0, y: 0, width: bounds.width, height: style.titleHeight)
        let titleView = HYTitleView(frame: titleFrame, style: style, titles: titles)
        titleView.backgroundColor = UIColor.white
        addSubview(titleView)
        
        // 2.创建HYContentView
        let contentFrame = CGRect(x: 0, y: style.titleHeight, width: bounds.width, height: bounds.height - style.titleHeight)
        let contentView = HYContentView(frame: contentFrame, childVcs: childVcs, parentVc : parentVc)
        contentView.backgroundColor = UIColor.randomColor
        addSubview(contentView)
        
        // 3.让HYTitleView&HYContentView进行交互
        titleView.delegate = contentView
        contentView.delegate = titleView
    }
}
