//
//  FlowCollectionViewCell.m
//  商品的布局切换Demo
//
//  Created by bailing on 2017/11/24.
//  Copyright © 2017年 bailing. All rights reserved.
//
#import "FlowCollectionViewCell.h"
#import <YYWebImage.h>
@interface FlowCollectionViewCell()
@property (nonatomic,strong)UIImageView *bgImageView;
@property (nonatomic,strong)UILabel *titleLabel;
@end
@implementation FlowCollectionViewCell
-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
    }
    return _bgImageView;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupFrameView];
    }
    return self;
}
-(void)setupFrameView{
    [self.contentView addSubview:self.bgImageView];
    [self.contentView addSubview:self.titleLabel];
    //开始布局了
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(25.0f);
    }];
}
-(void)setModel:(FlowModel *)model{
    _model = model;
    self.titleLabel.text = model.shopName;
    [self.bgImageView yy_setImageWithURL:[NSURL URLWithString:model.shopPicture] placeholder:nil];
}
@end
