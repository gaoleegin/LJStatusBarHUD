//
//  LJStatusBarHUD.h
//  Example
//
//  Created by apple on 14/12/18.
//  Copyright (c) 2014年 goalijun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UIView+LJChangeFrame.h"

@interface LJStatusBarHUD : NSObject
/**
 *  显示普通的信息,可以传入一张自己的图片,设置文字前面的图片
 */
+ (void)showMessage:(NSString *)msg image:(NSString *)image;
/**
 *  显示成功的信息
 */
+ (void)showSuccess:(NSString *)msg;
/**
 *  显示错误的信息
 */
+ (void)showError:(NSString *)msg;

/**
 *  显示正在加载的信息
 */
+ (void)showLoading:(NSString *)msg;
/**
 *  隐藏正在加载的信息
 */
+ (void)hideLoading;
@end
