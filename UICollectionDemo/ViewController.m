//
//  ViewController.m
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
#import "ViewController.h"
#import "CSCustomerCellCollectionViewCell.h"
#import "CSCustomerHeadView.h"
#import "CSCustomerFooterView.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
/**定义一个CollectionView*/
@property(nonatomic,strong)UICollectionView *collectionView;
/**头部数据集合*/
@property(nonatomic,strong)NSArray *headArrayStr;
/**尾部数据集合*/
@property(nonatomic,strong)NSArray *footerArrayStr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupSubViews];
    //定义一个数组
    self.headArrayStr = @[@"第一个头部",@"第二个头部",@"第三个头部"];
    self.footerArrayStr = @[@"第一个尾部",@"第二个尾部",@"第三个尾部"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupSubViews
{
    [self.view addSubview:self.collectionView];
    [self.collectionView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
#pragma mark - **************** collectionViewDelegate&collectionViewDataSource
//组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

//组内数量
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}
//显示item
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //1.从缓存池获取
    CSCustomerCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CSCustomerCellCollectionViewCell" forIndexPath:indexPath];
    [cell setImageStr:nil labelStr:[NSString stringWithFormat:@"%ld",(long)indexPath.item]];
    return cell;
}

//头部
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView  *reuseableView = nil;
    //根据kind来获取不同的header 和footer
    if (kind  == UICollectionElementKindSectionHeader) {
        //1.从缓冲池获取
        CSCustomerHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CSCustomerHeadView" forIndexPath:indexPath];
        //设置数据
        [headView setHeadLabelStr:self.headArrayStr[indexPath.section]];
        reuseableView = headView;
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        CSCustomerFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CSCustomerFooterView" forIndexPath:indexPath];
        [footerView setFooterLabelStr:self.footerArrayStr[indexPath.section]];
        reuseableView = footerView;
    }
    
    return reuseableView;
}


#pragma mark - **************** 懒加载
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        //1.创建collectionView 2.继承代理 3. 设置代理方法 4.注册cell 5.设置大小
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[CSCustomerCellCollectionViewCell class] forCellWithReuseIdentifier:@"CSCustomerCellCollectionViewCell"];
        [_collectionView registerClass:[CSCustomerHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CSCustomerHeadView"];
        [_collectionView registerClass:[CSCustomerFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CSCustomerFooterView"];
        //格子的大小
        layout.itemSize = CGSizeMake((ScreenWidth - 20)/3, 80);
        //设置组头部大小
        layout.headerReferenceSize = CGSizeMake(ScreenWidth, 44);
        //设置组尾部大小
        layout.footerReferenceSize = CGSizeMake(ScreenWidth, 44);
        //纵向的间隔 http://www.jianshu.com/p/40914d5708af
        layout.minimumLineSpacing = 5;
        //横向的间隔
        layout.minimumInteritemSpacing = 10;
        //设置上下左右边距
        //layout.sectionInset = UIEdgeInsetsMake(5, 0, 0, 0);
        //滚动方向
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        
    }
    return _collectionView;
}
@end
