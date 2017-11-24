//
//  HomeCollectionViewController.m
//  商品的布局切换Demo
//
//  Created by bailing on 2017/11/23.
//  Copyright © 2017年 bailing. All rights reserved.
//
#import "HomeCollectionViewController.h"
#import "NormalCollectionViewCell.h"
#import "HomeHeader.h"
#import "HomeFooterView.h"
@interface HomeCollectionViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectionView;
@end
@implementation HomeCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"collectionView的具体使用";
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = 5;
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.itemSize = CGSizeMake((ZF_ScreenWidth-30)/2,(ZF_ScreenWidth-30)/2+50);
    //设置头部视图的大小
    flowLayout.headerReferenceSize=CGSizeMake(ZF_ScreenWidth,ZF_ScreenHeight *0.28);
    //设置尾部的视图的大小
    flowLayout.footerReferenceSize=CGSizeMake(ZF_ScreenWidth,ZF_ScreenHeight *0.28);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ZF_ScreenWidth, ZF_ScreenHeight) collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    [collectionView registerClass:[NormalCollectionViewCell class] forCellWithReuseIdentifier:@"NormalCollectionViewCell"];
    //这里还有一个注册头部视图了
    //注册头视图
    [collectionView registerClass:[HomeHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeHeader"];
    //注册尾部视图
    [collectionView registerClass:[HomeFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"HomeFooterView"];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NormalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NormalCollectionViewCell" forIndexPath:indexPath];
    return cell;
}
//  返回头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HomeHeader" forIndexPath:indexPath];
        //添加头视图的内容
        UIImageView *headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ZF_ScreenWidth, ZF_ScreenHeight *0.28)];
        headerView.image = [UIImage imageNamed:@"iPhone.png"];
        //头视图添加view
        [header addSubview:headerView];
        return header;
    }else if ( [kind isEqualToString:UICollectionElementKindSectionFooter]){
        UICollectionReusableView *footer=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HomeFooterView" forIndexPath:indexPath];
        //添加头视图的内容
        UIImageView *footerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ZF_ScreenWidth, ZF_ScreenHeight *0.28)];
        footerView.image = [UIImage imageNamed:@"iPhone.png"];
        //头视图添加view
        [footer addSubview:footerView];
        return footer;
    }else{
        return nil;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
