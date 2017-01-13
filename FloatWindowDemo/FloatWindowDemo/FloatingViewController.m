//
//  FloatingViewController.m
//  Unity-iPhone
//
//  Created by Xinhou Jiang on 6/13/16.
//
//
#define floatWindowSize 50                // 悬浮窗窗口尺寸
#define imageName_normal @"add_button"    // 悬浮窗按钮默认图片
#define imageName_selected @"add_rotate"  // 悬浮窗按钮选中图片


#import "FloatingViewController.h"
#import "UIDragButton.h"

@interface FloatingViewController ()<UIDragButtonDelegate>

/**
 *  悬浮的window
 */
@property(strong,nonatomic) UIWindow *window;

/**
 *  悬浮的按钮
 */
@property(strong,nonatomic)UIDragButton *button;

@end

@implementation FloatingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 将视图尺寸设置为0，防止阻碍其他视图元素的交互
    self.view.frame = CGRectZero;
    // 延时显示悬浮窗口
    [self performSelector:@selector(createButton) withObject:nil afterDelay:1];
    
    // 注册屏幕旋转通知
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarOrientationChange:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}

/**
 *  创建悬浮窗口
 */
- (void)createButton
{
    // 1.悬浮按钮
    _button = [UIDragButton buttonWithType:UIButtonTypeCustom];
    [_button setImage:[UIImage imageNamed:imageName_normal] forState:UIControlStateNormal];
    // 按钮图片伸缩充满整个按钮
    _button.imageView.contentMode = UIViewContentModeScaleToFill;
    // 按钮尺寸
    _button.frame = CGRectMake(0, 0, floatWindowSize, floatWindowSize);
    // 初始选中状态
    _button.selected = NO;
    // 禁止高亮
    _button.adjustsImageWhenHighlighted = NO;
    // 悬浮窗所依赖的根视图
    _button.rootView = self.view.superview;
    // 悬浮按钮点击事件代理
    _button.buttonDelegate = self;
    // 按钮透明度
    _button.imageView.alpha = 0.8;
    
    // 2.按钮的悬浮窗容器
    _window = [[UIWindow alloc]init];
    // 悬浮窗尺寸
    _window.frame = CGRectMake(0, 100, floatWindowSize, floatWindowSize);
    // 保证悬浮窗至于屏幕最前面
    _window.windowLevel = UIWindowLevelAlert+1;
    // 悬浮窗容器背景透明
    _window.backgroundColor = [UIColor clearColor];
    // 悬浮窗圆角
    _window.layer.cornerRadius = floatWindowSize/2;
    _window.layer.masksToBounds = YES;
    // 将按钮添加到悬浮按钮上
    [_window addSubview:_button];
    //显示window
    [_window makeKeyAndVisible];
}

/**
 *  悬浮按钮点击代理事件
 */
- (void)dragButtonClicked:(UIButton *)sender {
    // 按钮选中关闭切换
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setImage:[UIImage imageNamed:imageName_selected] forState:UIControlStateNormal];
    }else{
        [sender setImage:[UIImage imageNamed:imageName_normal] forState:UIControlStateNormal];
    }
    
    // do something else...
}

/**
 * 屏幕旋转事件
 */
//- (void)statusBarOrientationChange:(NSNotification *)notification {
//    // do something...
//}

@end
