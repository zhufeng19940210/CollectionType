//
//  FlowWaterViewLayout.m
//  商品的布局切换Demo
//
//  Created by bailing on 2017/11/24.
//  Copyright © 2017年 bailing. All rights reserved.
//

#import "FlowWaterViewLayout.h"
@interface FlowWaterViewLayout()
//存放每一列的最大的y值
@property (nonatomic,strong)NSMutableDictionary *maxYdict;
//存放所有的布局属性
@property (nonatomic,strong)NSMutableArray *attrsArray;
@end
@implementation FlowWaterViewLayout
-(NSMutableDictionary *)maxYdict{
    if (_maxYdict == nil) {
        _maxYdict = [NSMutableDictionary dictionary];
    }
    return _maxYdict;
}
-(NSMutableArray *)attrsArray{
    if (_attrsArray == nil) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}
//初始化的准备工作
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.columnMargin1  = 10;
        self.rowMargin1 = 10;
        self.sectionSets = UIEdgeInsetsMake(10, 10, 10, 10);
        self.columCount = 2;
    }
    return self;
}
#pragma mark 2.每次布局之前的操作(只走1次)
-(void)prepareLayout{
    [super prepareLayout];
    for (int i =  0 ; i < self.columCount; i++) {
        NSString *column = [NSString stringWithFormat:@"%d",i];
        //保证布局从顶部开始了
        self.maxYdict[column] =@(self.sectionSets.top);
    }
    [self.attrsArray removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0 ; i <count; i++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [self.attrsArray addObject:attrs];
    }
}

#pragma mark 3.加上这句话才会不断地布局(只要位置发生改变就会调用从下面的布局)
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
#pragma mark 4.返回rect范围内的布局属性(下面的方法具体实现)
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    return self.attrsArray;
}
#pragma mark 5.对上面方法的具体实现
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //假设最短的哪一列是为0
    __block NSString *minYColun = @"0";
    //遍历数据
    [self.maxYdict enumerateKeysAndObjectsUsingBlock:^(NSString *column,NSString *maxY, BOOL * _Nonnull stop) {
        if ([maxY floatValue] < [self.maxYdict[minYColun] floatValue]) {
            minYColun = column;
        }
    }];
    //计算宽度
    /**
     *  计算宽度
     */
    CGFloat width =  (self.collectionView.frame.size.width - self.sectionInset.left - self.sectionInset.right - (self.columCount - 1) * self.columnMargin1)/self.columCount;
    /**
     *  高度
     */
    CGFloat height = [self.delegate FlowWaterLayout:self heightForWidth:width atIndexpath:indexPath];
    
    /**
     *  计算x和y
     */
    CGFloat x = self.sectionInset.left + (width + self.columnMargin1) * [minYColun floatValue];
    CGFloat y = [self.maxYdict[minYColun]floatValue] + self.rowMargin1;
    
    /**
     *  更新这一列的最大Y值
     */
    self.maxYdict[minYColun] = @(y + height);
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attrs.frame = CGRectMake(x, y, width, height);
    
    return attrs;
}
#pragma mark6. 返回indexpath 这个位置item的布局属性
-(CGSize)collectionViewContentSize
{
    __block NSString *maxYColun = @"0";
    
    [self.maxYdict enumerateKeysAndObjectsUsingBlock:^(NSString *column,NSNumber *maxY, BOOL * _Nonnull stop) {
        
        if ([maxY floatValue] > [self.maxYdict[maxYColun] floatValue] ) {
            
            maxYColun = column;
        }
    }];
    
    return CGSizeMake(0, [self.maxYdict[maxYColun] floatValue] + self.sectionInset.bottom);
}

@end
