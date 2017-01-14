## 此Demo已弃用停止更新，请移步：[https://github.com/jiangxh1992/XHFloatWindow](https://github.com/jiangxh1992/XHFloatWindow)

***

# IOSFloatingWindow
IOS悬浮窗

### 插件目录：
![这里写图片描述](http://img.blog.csdn.net/20161114153015639)


### 简单调用：

```objc
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
```
![这里写图片描述](http://img.blog.csdn.net/20161114153029030)


### 事件响应：

```objc
/**
 * FloatingViewController.m
 * 悬浮窗点击事件
 */
- (void)dragButtonClicked:(UIButton *)sender {
    // 按钮选中关闭切换
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setImage:[UIImage imageNamed:@"add_rotate"] forState:UIControlStateNormal];
    }else{
        [sender setImage:[UIImage imageNamed:@"add_button"] forState:UIControlStateNormal];
    }
    
    // do some else....
}
```
![这里写图片描述](http://img.blog.csdn.net/20161114153312093)
