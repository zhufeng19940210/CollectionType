//
//  NormalCollectionViewCell.m
//  商品的布局切换Demo
//
//  Created by bailing on 2017/11/23.
//  Copyright © 2017年 bailing. All rights reserved.
//

#import "NormalCollectionViewCell.h"
@interface NormalCollectionViewCell()
@property (nonatomic,strong)UIImageView *bgImageView;
@property (nonatomic,strong)UILabel *name;
@property (nonatomic,strong)UILabel *price;
@end
@implementation NormalCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.bgImageView = ({
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:@"iPhone.png"];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo((ZF_ScreenWidth - 30)/2);
            make.centerX.equalTo(self);
        }];
        imageView;
    });
    self.name = ({
        UILabel *name = [UILabel new];
        name.text = @"IphoneX";
        name.textColor = [UIColor blackColor];
        name.font = [UIFont systemFontOfSize:15];
        name.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:name];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgImageView.mas_bottom).offset(5);
            make.left.right.equalTo(self.bgImageView);
        }];
        name;
    });
    self.price =({
        UILabel *price = [[UILabel alloc]init];
        price.text = @"￥99999";
        price.textColor = [UIColor redColor];
        price.font = [UIFont systemFontOfSize:12];
        price.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:price];
        [price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.name.mas_bottom).offset(5);
            make.left.right.equalTo(self.bgImageView);
        }];
        price;
    });
}
@end
