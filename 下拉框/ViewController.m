//
//  ViewController.m
//  下拉框
//
//  Created by 李洋 on 16/2/25.
//  Copyright © 2016年 shunweige. All rights reserved.
//

#import "ViewController.h"
#import "PullDownView.h"
@interface ViewController ()<PullDownViewDelegate>
@property (weak, nonatomic) IBOutlet PullDownView *pullDownView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.pullDownView.listArray = @[@"中国",@"法国",@"英国",@"日本",@"韩国",@"伊拉克"].mutableCopy;
    self.pullDownView.title.text = @"中国";
    self.pullDownView.superView = self.view;
    self.pullDownView.delegate = self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.pullDownView closeTableView];
}

-(void)selectAtIndex:(int)index inCombox:(PullDownView *)_combox{
    NSLog(@"点击了第%d个",index);
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
