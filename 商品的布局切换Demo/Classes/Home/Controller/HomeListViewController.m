//
//  HomeListViewController.m
//  商品的布局切换Demo
//
//  Created by bailing on 2017/11/23.
//  Copyright © 2017年 bailing. All rights reserved.
//

#import "HomeListViewController.h"
#import "LongColletionCell.h"
#import "NormalCollectionViewCell.h"
typedef NS_ENUM(NSInteger,CollectionMode){
   CollectionModeNormal,
   CollectionModeLong
};
@interface HomeListViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,assign) CollectionMode mode;
@end
@implementation HomeListViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"布局切换";
    [self setpNav];
    self.mode = CollectionModeNormal;
    [self setupCollectionView];
}
-(void)setpNav{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"改变布局" style:UIBarButtonItemStylePlain target:self action:@selector(changeType)];
}
-(void)changeType{
    if (self.mode == CollectionModeNormal) {
        self.mode = CollectionModeLong;
    }else{
        self.mode = CollectionModeNormal;
    }
    [self collectionViewMode:self.mode];
}
-(void)setupCollectionView{
    self.flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ZF_ScreenWidth, ZF_ScreenHeight) collectionViewLayout:self.flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.collectionView];
    [self collectionViewMode:self.mode];
}
-(void)collectionViewMode:(CollectionMode)mode{
    if (mode == CollectionModeNormal) {
        self.flowLayout.itemSize = CGSizeMake((ZF_ScreenWidth-30)/2,(ZF_ScreenWidth-30)/2+50);
        self.flowLayout.minimumLineSpacing= 5; //设置每一行的间距
        self.flowLayout.minimumInteritemSpacing = 5;
        self.flowLayout.sectionInset=UIEdgeInsetsMake(10, 10, 10,10);
        [self.collectionView registerClass:[NormalCollectionViewCell class] forCellWithReuseIdentifier:@"NormalCollectionViewCell"];
    }else if (mode == CollectionModeLong){
        self.flowLayout.itemSize = CGSizeMake(ZF_ScreenWidth, (ZF_ScreenWidth-30)/2);
        [self.collectionView registerClass:[LongColletionCell class] forCellWithReuseIdentifier:@"LongColletionCell"];
    }
    [self.collectionView reloadData];
}
#pragma mark - uicollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 50;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     NormalCollectionViewCell * cell;
    if (self.mode == CollectionModeNormal) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NormalCollectionViewCell" forIndexPath:indexPath];
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LongColletionCell" forIndexPath:indexPath];
    }
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}
@end
