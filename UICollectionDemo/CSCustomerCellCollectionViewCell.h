//
//  CSCustomerCellCollectionViewCell.h
//  UICollectionDemo
//
//  Created by Start on 2017/7/27.
//  Copyright © 2017年 het. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSCustomerCellCollectionViewCell : UICollectionViewCell
/**imageView*/
@property(nonatomic,strong)UIImageView *imageView;
/**label*/
@property(nonatomic,strong)UILabel *label;

//设置数据
-(void)setImageStr:(NSString *)imageStr labelStr:(NSString *)labelStr;
@end
