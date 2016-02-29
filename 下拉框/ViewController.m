//
//  ViewController.m
//  下拉框
//
//  Created by 李洋 on 16/2/25.
//  Copyright © 2016年 shunweige. All rights reserved.
//

#import "ViewController.h"
#import "PullDownView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet PullDownView *pullDownView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.pullDownView createDataWithListArray:@[@"中国",@"法国",@"英国",@"日本",@"韩国",@"伊拉克"].mutableCopy AndTitle:@"中国" selectItem:^(NSInteger index) {
        NSLog(@"点击了第%ld个",index);
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.pullDownView closeTableView];
}

//设置列表里的分割线到头
-(void)viewDidLayoutSubviews
{
    if ([self.pullDownView.listTable respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.pullDownView.listTable setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.pullDownView.listTable respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.pullDownView.listTable setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

@end
