//
//  CSCustomerCellCollectionViewCell.m
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
#import "CSCustomerCellCollectionViewCell.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface CSCustomerCellCollectionViewCell()

@end
@implementation CSCustomerCellCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}


-(void)prepareForReuse
{
    [super prepareForReuse];
    self.imageView.image = nil;
    self.label.text = nil;
}

-(void)setupSubViews
{
    //1.创建控件 2.添加控件 3.设置约束
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.label];
    
    //设置大小
    [self.imageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake((ScreenWidth - 20 )/3, 50));
    }];
    
    [self.label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(5);
        make.centerX.equalTo(self.imageView);
    }];
    
    self.contentView.backgroundColor = [UIColor blueColor];
}

#pragma mark - **************** method
//设置数据
-(void)setImageStr:(NSString *)imageStr labelStr:(NSString *)labelStr
{
    if (imageStr != nil) {
        self.imageView.image = [UIImage imageNamed:imageStr];
    }
    self.label.text = labelStr;
}

#pragma mark - **************** 懒加载
-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.backgroundColor = [UIColor orangeColor];
    }
    return _imageView;
}

-(UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.textColor = [UIColor redColor];
        //_label.backgroundColor = [UIColor grayColor];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}
@end
