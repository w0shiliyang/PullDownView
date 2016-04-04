//
//  PullDownTextField.h
//  textfield
//
//  Created by 李洋 on 15/12/2.
//  Copyright © 2015年 shunweige. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PullDownView : UIView
/*
 * 下拉列表
 */
@property(nonatomic, strong) UITableView *listTable;
/*
 * 默认显示3个
 */
@property (nonatomic, assign) NSInteger listCount;

/*
 * 列表数据
 */
@property(nonatomic, strong) NSArray *listArray;
/*
 * 标题
 */
@property (nonatomic, copy) NSString *titleString;
/*
 * 选中列表
 */
@property (nonatomic, copy) void(^buttonClick)(void);
/*
 * 选中列表后回调
 */
@property (nonatomic, copy) void(^selectBlock)(NSInteger item);


/*
 * 父视图相对的偏移量：X轴（纠正位置用）
 */
@property (nonatomic, assign) CGFloat originX;
/*
 * 父视图相对的偏移量：Y轴（纠正位置用）
 */
@property (nonatomic, assign) CGFloat originY;


//关闭表0.3秒
-(void)closeTableView;
//立刻关闭
-(void)closeTableFast;
//快速创建
+(instancetype)pullDownWithFrame:(CGRect)frame ListArray:(NSArray *)listArray AndTitle:(NSString *)title buttonClick:(void(^)(void))buttonClick selectItem:(void(^)(NSInteger index))selectBlock;

//用xib创建后添加数据和方法
-(void)pullDownWithListArray:(NSArray *)listArray AndTitle:(NSString *)title buttonClick:(void(^)(void))buttonClick selectItem:(void(^)(NSInteger index))selectBlock;

@end
