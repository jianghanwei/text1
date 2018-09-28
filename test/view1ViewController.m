//
//  view1ViewController.m
//  test
//
//  Created by Bian Haibo on 2018/9/12.
//  Copyright © 2018年 QW. All rights reserved.
//

#import "view1ViewController.h"
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
@interface view1ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

@implementation view1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    self.view.backgroundColor = [UIColor redColor];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    
    
    
   
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenW, screenH)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];


    self.extendedLayoutIncludesOpaqueBars = YES;
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _tableView.scrollIndicatorInsets = _tableView.contentInset;
    
 
    
  UIView *  headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenW, screenW/1.63)];
    headView.backgroundColor = [UIColor redColor];
    [_tableView setTableHeaderView:headView];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y>64) {
        _tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        _tableView.scrollIndicatorInsets = _tableView.contentInset;

        [self.navigationController setNavigationBarHidden:NO animated:NO];
    }
    else
    {
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.scrollIndicatorInsets = _tableView.contentInset;
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        
    }
}


#pragma mark tableViewDataSource
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenW, 200)];
    view.backgroundColor = [UIColor redColor];
    return view;
}

-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 100;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 18;
    }
    return 20;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个",indexPath.row];
    return cell;
    
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}


@end
