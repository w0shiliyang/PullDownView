//
//  PullTableViewController.m
//  下拉框
//
//  Created by 李洋 on 16/4/4.
//  Copyright © 2016年 shunweige. All rights reserved.
//

#import "PullTableViewController.h"
#import "PullDownView.h"

#define WEAKSELF typeof(self) __weak weakSelf = self;

@interface PullTableViewController ()
@property (weak, nonatomic) IBOutlet PullDownView *pullDownView;
@property (weak, nonatomic) IBOutlet PullDownView *pullDownView1;
@property (weak, nonatomic) IBOutlet PullDownView *pullDownView2;

@property (nonatomic, strong) PullDownView *tempPullDown;
@end

@implementation PullTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WEAKSELF
    //范例1
    self.pullDownView.listArray = @[@"1",@"2",@"3"].mutableCopy;
    self.pullDownView.titleString = @"数字";
    self.pullDownView.selectBlock = ^(NSInteger index){
        NSLog(@"pullDownView1点击了第%ld个",index);
    };
    self.pullDownView.buttonClick = ^(){
        weakSelf.tempPullDown = weakSelf.pullDownView;
    };
    
    //范例2
    [self.pullDownView1 pullDownWithListArray:@[@"中国",@"法国",@"英国",@"日本",@"韩国",@"伊拉克"] AndTitle:@"中国" buttonClick:^{
        weakSelf.tempPullDown = weakSelf.pullDownView1;
        NSLog(@"点击按钮");
    } selectItem:^(NSInteger index) {
        NSLog(@"点击了第%ld个",index);
        weakSelf.tempPullDown = nil;
    }];

    //范例3
    self.pullDownView2.listArray = @[@"名字",@"年龄",@"性别"].mutableCopy;
    self.pullDownView2.titleString = @"类型";
    self.pullDownView2.buttonClick = ^(){
        weakSelf.tempPullDown = weakSelf.pullDownView2;
    };
    self.pullDownView2.selectBlock = ^(NSInteger index){
        NSLog(@"pullDownView2点击了第%ld个",index);
    };
    
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (self.tempPullDown) {
        [self.tempPullDown closeTableFast];
    }
}


@end
