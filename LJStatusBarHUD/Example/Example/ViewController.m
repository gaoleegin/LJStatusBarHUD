//
//  ViewController.m
//  Example
//
//  Created by apple on 14/12/18.
//  Copyright (c) 2014年 goalijun. All rights reserved.
//

#import "ViewController.h"
#import "LJStatusBarHUD.h"

@interface ViewController ()
- (IBAction)errorMessage:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *rightMessage;
- (IBAction)rightMessage:(id)sender;
- (IBAction)loadMessage:(id)sender;
- (IBAction)hideLoadMessage:(id)sender;

- (IBAction)customMessage:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)errorMessage:(id)sender {
    [LJStatusBarHUD showError:@"错误信息"];
}
- (IBAction)rightMessage:(id)sender {
    [LJStatusBarHUD showSuccess:@"正确信息"];
}

- (IBAction)loadMessage:(id)sender {
    [LJStatusBarHUD showLoading:@"加载数据中"];
}

- (IBAction)hideLoadMessage:(id)sender {
    [LJStatusBarHUD hideLoading];
}

- (IBAction)customMessage:(id)sender {
    [LJStatusBarHUD showMessage:@"自定义内容" image:nil];
}
@end
