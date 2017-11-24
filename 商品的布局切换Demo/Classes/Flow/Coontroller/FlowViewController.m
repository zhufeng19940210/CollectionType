//
//  FlowViewController.m
//  商品的布局切换Demo
//
//  Created by bailing on 2017/11/24.
//  Copyright © 2017年 bailing. All rights reserved.
//

#import "FlowViewController.h"
#import "FlowModel.h"
#import "FlowWaterViewLayout.h"
#import "FlowCollectionViewCell.h"
static NSString *const FlowCellIdentity = @"FlowCellI";
@interface FlowViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,FlowWaterViewLayoutDelegate>
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)FlowWaterViewLayout *flowLayout;
@property (nonatomic,strong)UICollectionView *flowCollectionView;
@end
@implementation FlowViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
-(FlowWaterViewLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[FlowWaterViewLayout alloc]init];
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 40, 10);
        _flowLayout.columnMargin1 = 10;
        _flowLayout.rowMargin1 = 10;
        _flowLayout.columCount = 2;
        _flowLayout.delegate = self;
    }
    return _flowLayout;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"流布局的使用";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupData];
    self.flowCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ZF_ScreenWidth, ZF_ScreenHeight) collectionViewLayout:self.flowLayout];
    self.flowCollectionView.delegate = self;
    self.flowCollectionView.dataSource = self;
    self.flowCollectionView.backgroundColor =[UIColor whiteColor];
    self.flowCollectionView.showsVerticalScrollIndicator = NO;
    self.flowCollectionView.showsHorizontalScrollIndicator = NO;
    //注册cell
    [self.flowCollectionView registerClass:[FlowCollectionViewCell class] forCellWithReuseIdentifier:FlowCellIdentity];
    [self.view addSubview:self.flowCollectionView];
}
-(void)setupData{
    NSArray *array = [[NSArray alloc]init];
    
    NSString *file = [[NSBundle mainBundle]pathForResource:@"ShopList" ofType:@"plist"];
    
    array = [NSMutableArray arrayWithContentsOfFile:file];
    
    self.dataArray = [FlowModel mj_objectArrayWithKeyValuesArray:array];
    
    NSLog(@"数组==%@",self.dataArray);
}
#pragma mark 有关collectionView的一些设置
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FlowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FlowCellIdentity forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.item];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%ld",indexPath.item);
}

#pragma arguments FlowWaterViewLayoutDelegate
-(CGFloat)FlowWaterLayout:(FlowWaterViewLayout *)Layout heightForWidth:(CGFloat)width atIndexpath:(NSIndexPath *)indexPath{
    
    FlowModel *shopmodel = self.dataArray[indexPath.item];
    /**
     *  取出来宽高
     */
    NSString *shopH = [NSString stringWithFormat:@"%@",shopmodel.H];
    NSString *shopW = [NSString stringWithFormat:@"%@",shopmodel.W];
    /**
     *  转化为float类型
     */
    CGFloat shopHValue = [shopH floatValue];
    CGFloat shopWValue = [shopW floatValue];
    /**
     *  返回比例计算的高度
     */
    return shopHValue / shopWValue * width;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
