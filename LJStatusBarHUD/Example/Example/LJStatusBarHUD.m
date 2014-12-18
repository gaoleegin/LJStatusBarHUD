//
//  LJStatusBarHUD.m
//  Example
//
//  Created by apple on 14/12/18.
//  Copyright (c) 2014年 goalijun. All rights reserved.
//

#import "LJStatusBarHUD.h"

@interface LJStatusBarHUDButton : UIButton
@property (nonatomic, weak) UIActivityIndicatorView *loadingView;
@end

static const NSTimeInterval HWStatusBarHUDDuration = 0.5;

@implementation LJStatusBarHUD

static UIWindow *_window;
static LJStatusBarHUDButton *_button;

+ (void)initialize
{
    _window = [[UIWindow alloc] init];
    _window.height = 20;
    _window.transform = CGAffineTransformMakeTranslation(0, -_window.height);
    _window.backgroundColor = [UIColor blackColor];
    _window.width = [UIScreen mainScreen].bounds.size.width;
    _window.windowLevel = UIWindowLevelAlert;
    
    _button = [[LJStatusBarHUDButton alloc] init];
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _button.titleLabel.font = [UIFont systemFontOfSize:13];
    _button.titleLabel.textAlignment = NSTextAlignmentCenter;
    _button.frame = _window.bounds;
    [_window addSubview:_button];
}

/**
 *  显示普通的信息
 */
+ (void)showMessage:(NSString *)msg image:(NSString *)image
{
    // 如果窗口正在显示,就返回
    if (_window.hidden == NO && !_button.loadingView.isAnimating) return;
    
    // 显示窗口
    _window.hidden = NO;
    
    // 设置文字
    [_button setTitle:msg forState:UIControlStateNormal];
    [_button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    // 隐藏圈圈
    [_button.loadingView stopAnimating];
    
    // 动画
    [UIView animateWithDuration:HWStatusBarHUDDuration animations:^{
        _window.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:HWStatusBarHUDDuration delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
            _window.transform = CGAffineTransformMakeTranslation(0, -_window.height);
        } completion:^(BOOL finished) {
            _window.hidden = YES;
        }];
    }];
}

/**
 *  显示成功的信息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:@"LJStatusBarHUD.bundle/success"];
}

/**
 *  显示错误的信息
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:@"LJStatusBarHUD.bundle/error"];
}

/**
 *  显示正在加载的信息
 */
+ (void)showLoading:(NSString *)msg
{
    // 如果窗口正在显示,就返回
    if (_window.hidden == NO) return;
    
    // 显示窗口
    _window.hidden = NO;
    
    // 设置文字
    [_button setTitle:msg forState:UIControlStateNormal];
    // 清除图片
    [_button setImage:nil forState:UIControlStateNormal];
    // 显示圈圈
    [_button.loadingView startAnimating];
    
    // 动画
    [UIView animateWithDuration:HWStatusBarHUDDuration animations:^{
        _window.transform = CGAffineTransformIdentity;
    } completion:nil];
}

/**
 *  隐藏正在加载的信息
 */
+ (void)hideLoading
{
    // 动画
    [UIView animateWithDuration:HWStatusBarHUDDuration animations:^{
        _window.transform = CGAffineTransformMakeTranslation(0, -_window.height);
    } completion:^(BOOL finished) {
        [_button.loadingView stopAnimating];
        _window.hidden = YES;
    }];
}
@end

@implementation LJStatusBarHUDButton

- (UIActivityIndicatorView *)loadingView
{
    if (!_loadingView) {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        loadingView.hidesWhenStopped = YES;
        [self addSubview:loadingView];
        self.loadingView = loadingView;
    }
    return _loadingView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = self.bounds;
    // 文字宽度
    CGFloat titleW = [[self titleForState:UIControlStateNormal] sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}].width;
    //添加注释
    // 图片的尺寸
    CGFloat imgWH = 15;
    CGFloat imgY = (self.frame.size.height - imgWH) * 0.5;
    CGFloat imgX = (self.frame.size.width - titleW) * 0.5 - imgWH - 10;
    self.imageView.frame = CGRectMake(imgX, imgY, imgWH, imgWH);
    
    // 设置位置和尺寸
    self.loadingView.center = self.imageView.center;
}

@end
