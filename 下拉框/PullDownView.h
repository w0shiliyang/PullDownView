//
//  PullDownTextField.h
//  textfield
//
//  Created by 李洋 on 15/12/2.
//  Copyright © 2015年 shunweige. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PullDownView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong) UITableView *listTable;
@property (nonatomic, assign) NSInteger canSeeCount;

//关闭表
-(void)closeTableView;
-(void)createDataWithListArray:(NSArray *)listArray AndTitle:(NSString *)title selectItem:(void(^)(NSInteger index))selectBlock;
@end
