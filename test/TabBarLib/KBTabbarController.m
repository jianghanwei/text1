//
//  KBTabbarController.m
//  KBTabbarController
//
//  Created by kangbing on 16/5/31.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import "KBTabbarController.h"
#import "view1ViewController.h"
#import "view2ViewController.h"
#import "view3ViewController.h"
#import "view4ViewController.h"
#import "FPNavigationViewController.h"
@interface KBTabbarController ()<UITabBarControllerDelegate>

@end

@implementation KBTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    ViewController *hvc = [[ViewController alloc] init];
    self.delegate = self;
    self.title = @"消息";
//    FPIndexViewController *hvc = [[FPIndexViewController alloc] init];
    view1ViewController *hvc = [[view1ViewController alloc] init];

    
    [self addChildController:hvc title:@"首页" imageName:@"首页-灰色" selectedImageName:@"首页-红色" navVc:[FPNavigationViewController class]];
    
    view2ViewController *mvc = [[view2ViewController alloc] init];
    [self addChildController:mvc title:@"发现" imageName:@"发现-灰色" selectedImageName:@"发现-红色" navVc:[FPNavigationViewController class]];
    
//    FPLoginViewController *tourVc = [[FPLoginViewController alloc]init];
    view3ViewController *tourVc = [[view3ViewController alloc] init];
//    tourVc.tabBarItem.badgeValue = @"11";
    [self addChildController:tourVc title:@"消息" imageName:@"消息-灰色" selectedImageName:@"消息-红色" navVc:[FPNavigationViewController class]];
    
    view4ViewController *uservc = [[view4ViewController alloc] init];
    [self addChildController:uservc title:@"我的" imageName:@"我的-灰色" selectedImageName:@"我的-红色" navVc:[FPNavigationViewController class]];
    
    
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
    //  设置tabbar
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    // 设置自定义的tabbar
//    [self setCustomtabbar];
    
    
    
}

//- (void)setCustomtabbar{
//
//    KBTabbar *tabbar = [[KBTabbar alloc]init];
////    tabbar.tintColor = [UIColor redColor];
//    [self setValue:tabbar forKeyPath:@"tabBar"];
//
//    [tabbar.centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//
//
//}

- (void)centerBtnClick:(UIButton *)btn{

    
    NSLog(@"点击了中间");
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"点击了中间按钮" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [alert show];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildController:(UIViewController*)childController title:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName navVc:(Class)navVc
{
    
    childController.title = title;
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置一下选中tabbar文字颜色
    [childController.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor redColor] }forState:UIControlStateSelected];

   FPNavigationViewController * nav = [[navVc alloc] initWithRootViewController:childController];
    
    [self addChildViewController:nav];
}


- (UIImage *)imageWithColor:(UIColor *)color{
    // 一个像素
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark 判断是否登录若没登录跳转到登录页面

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{//每次点击都会执行的方法

    
    return YES;
    
}
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
//        if ([[FPLoginManager shareDTLoginManager]userCheckLogin]==nil) {
//            [SVProgressHUD showInfoWithStatus:@"请先登录"];
//            FPLoginViewController *vc = [[FPLoginViewController alloc]init];
//            [self presentViewController:vc animated:YES completion:nil];
//        }
//    NSLog(@"%ld",item.tag);
}


@end
