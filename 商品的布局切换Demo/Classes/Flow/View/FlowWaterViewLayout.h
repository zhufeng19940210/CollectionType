//
//  FlowWaterViewLayout.h
//  商品的布局切换Demo
//
//  Created by bailing on 2017/11/24.
//  Copyright © 2017年 bailing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FlowWaterViewLayout;
@protocol FlowWaterViewLayoutDelegate <NSObject>
-(CGFloat)FlowWaterLayout:(FlowWaterViewLayout *)Layout heightForWidth:(CGFloat)width atIndexpath:(NSIndexPath *)indexPath;
@end
@interface FlowWaterViewLayout : UICollectionViewFlowLayout
//collectionview的上下面的间距
@property (nonatomic,assign)UIEdgeInsets sectionSets;
//collectionview的每一行的间距
@property (nonatomic,assign)CGFloat columnMargin1;
//每一列的间距
@property (nonatomic,assign)CGFloat rowMargin1;
//告诉外面你想显示多少列
@property (nonatomic,assign)int columCount;

@property (nonatomic,weak) id <FlowWaterViewLayoutDelegate>delegate;
@end
