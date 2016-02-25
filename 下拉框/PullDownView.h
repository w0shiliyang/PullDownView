//
//  PullDownTextField.h
//  textfield
//
//  Created by 李洋 on 15/12/2.
//  Copyright © 2015年 shunweige. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PullDownView;

typedef void(^TextFieldBlock)(void);

@protocol PullDownViewDelegate <NSObject>

-(void)selectAtIndex:(int)index inCombox:(PullDownView *)_combox;

@end


@interface PullDownView : UIView<UITableViewDataSource,UITableViewDelegate>

//@property(nonatomic, copy) TextFieldBlock changeBlock;
@property(nonatomic, strong) UITableView *listTable;
@property(nonatomic, assign) BOOL isOpen;
@property(nonatomic, strong) UIView *superView;
//列表内容
@property(nonatomic, strong) NSMutableArray *listArray;
@property(nonatomic, strong) UIButton *downPullBtn;
@property(nonatomic, assign) id<PullDownViewDelegate>delegate;
@property(nonatomic, strong)  UILabel *title;
//覆盖整个view的btn
@property (nonatomic, strong)  UIButton *viewBtn;
@property (nonatomic, assign) NSInteger canSeeCount;
//关闭表
-(void)closeTableView;
@end
