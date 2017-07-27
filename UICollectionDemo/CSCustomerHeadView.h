//
//  CSCustomerHeadView.h
//  UICollectionDemo
//
//  Created by Start on 2017/7/27.
//  Copyright © 2017年 het. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSCustomerHeadView : UICollectionReusableView
/**label*/
@property(nonatomic,strong)UILabel *headLabel;
//设置值
-(void)setHeadLabelStr:(NSString *)headLabelStr;
@end
