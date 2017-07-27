//
//  CSCustomerFooterView.h
//  UICollectionDemo
//
//  Created by Start on 2017/7/27.
//  Copyright © 2017年 het. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSCustomerFooterView : UICollectionReusableView
/**label*/
@property(nonatomic,strong)UILabel *footerLabel;
//设置值
-(void)setFooterLabelStr:(NSString *)footerLabelStr;
@end
