//
//  HYPageStyle.swift
//  HYPageView
//
//  Created by seemygo on 17/4/8.
//  Copyright © 2017年 seemygo. All rights reserved.
//  NSObject --> KVC

import UIKit

class HYPageStyle {
    
    // 是否可以滚动
    var isScrollEnable : Bool = false
    
    // Label的一些属性
    var titleHeight : CGFloat = 48
    var normalColor : UIColor = UIColor.init(r: 124, g: 124, b: 124)
    var selectColor : UIColor = UIColor.init(r: 79, g: 121, b: 150)
    var fontSize : CGFloat = 17
    
    var titleMargin : CGFloat = 30
    
    // 是否显示滚动条
    var isShowBottomLine : Bool = false
    var bottomLineColor : UIColor = UIColor.orange
    var bottomLineHeight : CGFloat = 2
    
    // 是否需要缩放功能
    var isScaleEnable : Bool = false
    var maxScale : CGFloat = 1.2
    
    // 是否需要显示的coverView
    var isShowCoverView : Bool = false
    var coverBgColor : UIColor = UIColor.black
    var coverAlpha : CGFloat = 0.4
    var coverMargin : CGFloat = 8
    var coverHeight : CGFloat = 25
    var coverRadius : CGFloat = 12
    
    
}
