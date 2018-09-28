//
//  KBTabbar.m
//  KBTabbarController
//
//  Created by kangbing on 16/5/31.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import "KBTabbar.h"
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
@implementation KBTabbar


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setImage:[UIImage imageNamed:@"plus_Last"] forState:UIControlStateNormal];
//        btn.bounds = CGRectMake(0, 0, 50, 50);
//        self.centerBtn = btn;
//        [self addSubview:btn];
        
 
        
    }
    return self;
}

- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
//    self.centerBtn.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.3);
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.origin.y, screenW, 0.5)];
    [self addSubview:lineView];
    
    int index = 0;
    CGFloat wigth = self.bounds.size.width / 4;

//    CGFloat wigth = self.bounds.size.width / 5;
    
    for (UIView* sub in self.subviews) {
        
        if ([sub isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            sub.frame = CGRectMake(index * wigth, self.bounds.origin.y, wigth, self.bounds.size.height-0);
            
            index++;
//
//            if (index == 2) {
//                index++;
//            }
        }
    }
}



//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    
//    if (self.isHidden == NO) {
//        
//        CGPoint newPoint = [self convertPoint:point toView:self.centerBtn];
//        
//        if ( [self.centerBtn pointInside:newPoint withEvent:event]) {
//            return self.centerBtn;
//        }else{
//            
//            return [super hitTest:point withEvent:event];
//        }
//    }
//    
//    else {
//        return [super hitTest:point withEvent:event];
//    }
//}



@end
