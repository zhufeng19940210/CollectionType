//
//  FlowModel.h
//  商品的布局切换Demo
//
//  Created by bailing on 2017/11/24.
//  Copyright © 2017年 bailing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlowModel : NSObject
/**
 *  图片的宽度
 */
@property(nonatomic,assign) NSString *W;
/**
 *  图片的高度
 */
@property(nonatomic,assign) NSString *H;

/**
 *   商店的图片
 */
@property(nonatomic,strong) NSString *shopPicture;
/**
 *  商店的名字
 */
@property(nonatomic,strong) NSString *shopName;

@end
