//
//  UIControl+MutablieClick.h
//  UIButtonMutablieClick
//
//  Created by hehe on 2017/3/13.
//  Copyright © 2017年 transfar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (MutablieClick)
@property (nonatomic, assign) NSTimeInterval hw_acceptEventInterval;//添加点击事件的间隔时间

@property (nonatomic, assign) BOOL hw_ignoreEvent;//是否忽略点击事件,不响应点击事件
@end
