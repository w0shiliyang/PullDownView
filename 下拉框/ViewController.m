///Users/shunweige/pullDownView/下拉框/ViewController.m
//  PullTableViewController.m
//  下拉框
//
//  Created by 李洋 on 16/4/4.
//  Copyright © 2016年 shunweige. All rights reserved.
//

#import "ViewController.h"
#import "PullDownView.h"

#define WEAKSELF typeof(self) __weak weakSelf = self;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PullDownView *pullDownView;
@property (weak, nonatomic) IBOutlet PullDownView *pullDownView1;
@property (nonatomic, strong) PullDownView *pullDownView2;
//临时存放 用来关闭
@property (nonatomic, strong) PullDownView *tempPullDown;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WEAKSELF
    //---------------------------
    //xib简单创建
    self.pullDownView.listArray = @[@"1",@"2",@"3"].mutableCopy;
    self.pullDownView.titleString = @"数字";
    //打开
    self.pullDownView.openClick = ^(){
        NSLog(@"打开");
        weakSelf.tempPullDown = weakSelf.pullDownView;
    };
    //选中
    self.pullDownView.selectBlock = ^(NSInteger index){
        NSLog(@"pullDownView1点击了第%ld个",index);
    };
    //---------------------------
    
    
    //---------------------------
    //xib快速创建
    [self.pullDownView1 pullDownWithListArray:@[@"中国",@"法国",@"英国",@"日本",@"韩国",@"伊拉克"] AndTitle:@"中国" OpenClick:^{
        NSLog(@"打开");
        weakSelf.tempPullDown = weakSelf.pullDownView1;
    } selectItem:^(NSInteger index) {
        NSLog(@"点击了第%ld个",index);
    }];
    //---------------------------
    
    
    //---------------------------
    //代码创建
    //block里用到控件需要设置为属性
    self.pullDownView2 = [PullDownView pullDownWithFrame:CGRectMake(200, 300, 100, 40) ListArray:@[@"小明",@"xiaoh",@"aaaa"] AndTitle:@"哈哈" OpenClick:^{
        weakSelf.tempPullDown = weakSelf.pullDownView2;
    } selectItem:^(NSInteger index) {
        NSLog(@"点击了第%ld个",index);
    }];
    [self.view addSubview:self.pullDownView2];
    //---------------------------
    
}

//取消
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (self.tempPullDown) {
        [self.tempPullDown closeTableFast];
    }
}

//防止打开多个
-(void)setTempPullDown:(PullDownView *)tempPullDown{
    if (!_tempPullDown) {
        _tempPullDown = tempPullDown;
    }else if(_tempPullDown != tempPullDown){
        [_tempPullDown closeTableFast];
        _tempPullDown = nil;
        _tempPullDown = tempPullDown;
    }
}

//#pragma mark ----ios8 ios7 分割线到头
-(void)viewDidLayoutSubviews
{
    if ([self.pullDownView1.listTable respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.pullDownView1.listTable setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.pullDownView1.listTable respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.pullDownView1.listTable setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

@end
