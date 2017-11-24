//
//  LongColletionCell.m
//  商品的布局切换Demo
//
//  Created by bailing on 2017/11/23.
//  Copyright © 2017年 bailing. All rights reserved.
//

#import "LongColletionCell.h"
@interface LongColletionCell()
@property (nonatomic,strong)UIImageView *bgImageView;
@property (nonatomic,strong)UILabel *priceLabel;
@property (nonatomic,strong)UILabel *nameLabel;
@end
@implementation LongColletionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"iPhone.png"];
    [self.contentView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo((ZF_ScreenWidth-30)/2);
        make.top.left.equalTo(self);
    }];
    self.bgImageView = imageView;
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = @"IphoneX";
    nameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgImageView.mas_right).offset(10);
        make.top.equalTo(self.contentView);
    }];
    self.nameLabel = nameLabel;
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.textColor = [UIColor redColor];
    priceLabel.font =[UIFont systemFontOfSize:15];
    priceLabel.textAlignment =NSTextAlignmentLeft;
    priceLabel.text = @"￥99999";
    [self.contentView addSubview:priceLabel];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel).offset(20);
        make.left.equalTo(self.nameLabel);
    }];
    self.priceLabel = priceLabel;
}
@end
