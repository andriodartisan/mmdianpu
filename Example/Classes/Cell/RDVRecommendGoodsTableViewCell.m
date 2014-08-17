//
//  RDVRecommendGoodsTableViewCell.m
//  RDVTabBarController
//
//  Created by Sun on 14-8-15.
//  Copyright (c) 2014年 Robert Dimitrov. All rights reserved.
//

#import "RDVRecommendGoodsTableViewCell.h"
#import "StrikeThroughLabel.h"

@implementation RDVRecommendGoodsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        float horizontalInterval = 5;
        float verticalInterval = 5;
        CGRect frame = [[UIScreen mainScreen] applicationFrame];
        _view = [[UIView alloc] initWithFrame:CGRectMake(horizontalInterval, verticalInterval, frame.size.width - horizontalInterval*2, 110)];
        
        _goodsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 100, 100)];
        [_goodsImageView setImage:[UIImage imageNamed:@"recommend_demo_pic.jpg"]];
        
        _rightView = [[UIView alloc] initWithFrame:CGRectMake(110, 5, frame.size.width - horizontalInterval*2 - 110, 100)];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width - horizontalInterval*2 - 110 - 5, 40)];
        _titleLabel.font = [UIFont systemFontOfSize:14.0];
        _titleLabel.textAlignment = UIControlContentVerticalAlignmentTop;
        _titleLabel.textAlignment = UITextAlignmentLeft;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.numberOfLines = 0;
        
//        //文字居中显示
//        label.textAlignment = UIControlContentVerticalAlignmentTop;
//        label.textAlignment = UIControlContentHorizontalAlignmentCenter;
//        //自动折行设置
//        label.lineBreakMode = NSLineBreakByWordWrapping;
//        
//        label.numberOfLines = 0;
        
        _titleLabel.text = @"2014新款真丝连衣裙韩版女雪纺衫长款裙夏季修身显瘦气质大码女装";
        
        float thirdWidth = (frame.size.width - horizontalInterval*2 - 110 -5)/3;
        
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, thirdWidth, 20)];
        _priceLabel.font = [UIFont systemFontOfSize:14.0];
        _priceLabel.textAlignment = UITextAlignmentLeft;
        _priceLabel.text = @"￥ 99.0";
        _oldPriceLabel = [[StrikeThroughLabel alloc] initWithFrame:CGRectMake(thirdWidth, 50, thirdWidth, 20)];
        _oldPriceLabel.font = [UIFont systemFontOfSize:14.0];
        _oldPriceLabel.textAlignment = UITextAlignmentLeft;
        _oldPriceLabel.strikeThroughEnabled = YES;
        _oldPriceLabel.text = @"￥ 199.0";
        
        
        _rebateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, thirdWidth, 20)];
        _rebateLabel.text = @"5.0折";
        _rebateLabel.textAlignment = UITextAlignmentLeft;
        _rebateLabel.font = [UIFont systemFontOfSize:10.0];
        _scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(thirdWidth, 80, thirdWidth, 20)];
        _scoreLabel.font = [UIFont systemFontOfSize:10.0];
        _scoreLabel.textAlignment = UITextAlignmentCenter;
        _scoreLabel.text = @"集分宝 110";
        _isbaoyouLabel = [[UILabel alloc] initWithFrame:CGRectMake(thirdWidth*2, 80, thirdWidth, 20)];
        _isbaoyouLabel.font = [UIFont systemFontOfSize:10.0];
        _isbaoyouLabel.textAlignment = UITextAlignmentRight;
        _isbaoyouLabel.text = @"包邮";
        
        [_rightView addSubview:_titleLabel];
        [_rightView addSubview:_priceLabel];
        [_rightView addSubview:_oldPriceLabel];
        [_rightView addSubview:_rebateLabel];
        [_rightView addSubview:_scoreLabel];
        [_rightView addSubview:_isbaoyouLabel];
        
        [_view addSubview:_goodsImageView];
        [_view addSubview:_rightView];
        
        _view.backgroundColor = [UIColor colorWithRed:0.858824 green:0.843137 blue:0.823529 alpha:1];
        _view.layer.masksToBounds = YES;
        _view.layer.cornerRadius = 5.0;
        
        [self addSubview:_view];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
