//
//  ViewController.m
//  FloatWindowDemo
//
//  Created by Xinhou Jiang on 16/7/22.
//  Copyright © 2016年 xiaoxigame. All rights reserved.
//

#import "ViewController.h"
#import "FloatingViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    // 添加悬浮窗
    FloatingViewController *floatVC = [[FloatingViewController alloc]init];
    [self addChildViewController:floatVC];
    [self.view addSubview:floatVC.view];
}

@end
