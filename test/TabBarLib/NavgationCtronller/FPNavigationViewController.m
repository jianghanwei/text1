//
//  FPNavigationViewController.m
//  FunPlay
//
//  Created by Bian Haibo on 2018/2/27.
//  Copyright © 2018年 QW. All rights reserved.
//

#import "FPNavigationViewController.h"

@interface FPNavigationViewController ()
@property(nonatomic,strong) id popDelegate;

@end

@implementation FPNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //将系统的代理保存（在view 加载在完毕就赋值）
    self.popDelegate =self.interactivePopGestureRecognizer.delegate;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    self.interactivePopGestureRecognizer.delegate = nil;
    if (self.viewControllers.count!=0)
    {
        //        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[self imageWithOriImageName:@"global_return_arrow"] style:0 target:self action:@selector(back)];
        
        
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
//        [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        leftBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [leftBtn setImage:[UIImage imageNamed:@"global_return_arrow"] forState:UIControlStateNormal];
                leftBtn.frame =CGRectMake(0, 0, 50,40);
            leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 35);
        [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        viewController.view.backgroundColor = [UIColor whiteColor];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
 
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:YES];
    
}
-(void)back
{
    [self.view endEditing:YES];
    [self popViewControllerAnimated:YES];
}

- (UIImage *)imageWithOriImageName:(NSString *)imageName
{
    //传入一张图片,返回一张不被渲染的图片
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


#pragma mark - 实现代理方法

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSLog(@"代理方法的实现");
    //判断控制器是否为根控制器
    if (self.childViewControllers.count == 1) {
        //将保存的代理赋值回去,让系统保持原来的侧滑功能
        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
