//
//  CSCustomerHeadView.m
//  UICollectionDemo
//
//  Created by Start on 2017/7/27.
//  Copyright © 2017年 het. All rights reserved.
//
// 定义这个常量，就可以不用在开发过程中使用"mas_"前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS
#import <Masonry/Masonry.h>
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#import "CSCustomerHeadView.h"
@interface CSCustomerHeadView()

@end
@implementation CSCustomerHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

//避免复用乱码
-(void)prepareForReuse
{
    [super prepareForReuse];
    self.headLabel.text = nil;
}
-(void)setupSubViews
{
    //1.添加控件 2.设置约束
    [self addSubview:self.headLabel];
    [self.headLabel makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - **************** method
//设置值
-(void)setHeadLabelStr:(NSString *)headLabelStr
{
    self.headLabel.text = headLabelStr;
}
#pragma mark - **************** 懒加载
-(UILabel *)headLabel
{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.backgroundColor = [UIColor redColor];
    }
    return _headLabel;
}
@end
