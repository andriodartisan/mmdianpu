//
//  RDVGoodsTableViewCell.m
//  RDVTabBarController
//
//  Created by Sun on 14-8-15.
//  Copyright (c) 2014年 Robert Dimitrov. All rights reserved.
//

#import "RDVGoodsTableViewCell.h"

@implementation RDVGoodsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        float horizontalInterval = 5;
        float verticalInterval = 5;
        CGRect frame = [[UIScreen mainScreen] applicationFrame];
        float width = (frame.size.width - 3*horizontalInterval)/2;
        float height = 200;
        
        _leftView = [[UIView alloc] initWithFrame:CGRectMake(horizontalInterval, verticalInterval, width, height)];
        _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 150)];
        [_leftImageView setImage:[UIImage imageNamed:@"left_demo_pic.jpg"]];
        _leftTitleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, width, 20)];
        _leftView.backgroundColor = [UIColor whiteColor];
        _leftTitleLable.text = @"2014女式新款韩版女装夏装大码修身印花挂脖波西米亚长裙沙滩裙";
        _leftTitleLable.font = [UIFont systemFontOfSize:10.0];
        _leftTitleLable.textAlignment = UITextAlignmentLeft;
        _leftPriceLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, width/2, 20)];
        _leftPriceLable.text = @"￥99.0";
        _leftPriceLable.font = [UIFont systemFontOfSize:14.0];
        _leftPriceLable.textAlignment = UITextAlignmentLeft;
        _leftScoreLable = [[UILabel alloc] initWithFrame:CGRectMake(width/2, 170, width/2, 20)];
        _leftScoreLable.text = @"集分宝 120";
        _leftScoreLable.font = [UIFont systemFontOfSize:10.0];
        _leftScoreLable.textAlignment = UITextAlignmentRight;
        
        UIView *distance = [[UIView alloc] initWithFrame:CGRectMake(0, 190, width, 10)];
        distance.backgroundColor = [UIColor colorWithRed:0.858824 green:0.843137 blue:0.823529 alpha:1];
        UIView *distance1 =  [[UIView alloc] initWithFrame:CGRectMake(0, 190, width, 10)];
        distance1.backgroundColor = [UIColor colorWithRed:0.858824 green:0.843137 blue:0.823529 alpha:1];
        
        [_leftView addSubview:_leftImageView];
        [_leftView addSubview:_leftTitleLable];
        [_leftView addSubview:_leftPriceLable];
        [_leftView addSubview:_leftScoreLable];
        [_leftView addSubview:distance];
        
        
        _rightView = [[UIView alloc] initWithFrame:CGRectMake(horizontalInterval*2 + width, verticalInterval, width, height)];
        _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 150)];
        [_rightImageView setImage:[UIImage imageNamed:@"right_demo_pic.jpg"]];
        _rightTitleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, width, 20)];
        _rightView.backgroundColor = [UIColor whiteColor];
        _rightTitleLable.text = @"短袖女连衣裙长款雪纺长裙2014新款夏季短袖显瘦气质大码女装裙子";
        _rightTitleLable.font = [UIFont systemFontOfSize:10.0];
        _rightTitleLable.textAlignment = UITextAlignmentLeft;
        _rightPriceLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, width/2, 20)];
        _rightPriceLable.text = @"￥99.0";
        _rightPriceLable.font = [UIFont systemFontOfSize:14.0];
        _rightPriceLable.textAlignment = UITextAlignmentLeft;
        _rightScoreLable = [[UILabel alloc] initWithFrame:CGRectMake(width/2, 170, width/2, 20)];
         _rightScoreLable.text = @"集分宝 120";
        _rightScoreLable.font = [UIFont systemFontOfSize:10.0];
        _rightScoreLable.textAlignment = UITextAlignmentRight;
        
        [_rightView addSubview:_rightImageView];
        [_rightView addSubview:_rightTitleLable];
        [_rightView addSubview:_rightPriceLable];
        [_rightView addSubview:_rightScoreLable];
        [_rightView addSubview:distance1];
        
        [self addSubview:_leftView];
        [self addSubview:_rightView];
        
        self.backgroundColor = [UIColor colorWithRed:0.858824 green:0.843137 blue:0.823529 alpha:1];
        
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
