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
        [_leftImageView setImage:[UIImage imageNamed:@"background1"]];
        _leftLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, width, 45)];
        _leftLable.backgroundColor = [UIColor whiteColor];
        _leftLable.text = @"无印良品";
        
        [_leftView addSubview:_leftImageView];
        [_leftView addSubview:_leftLable];
        
        
        _rightView = [[UIView alloc] initWithFrame:CGRectMake(horizontalInterval*2 + width, verticalInterval, width, height)];
        _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 150)];
        [_rightImageView setImage:[UIImage imageNamed:@"background1"]];
        _rightLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, width, 45)];
        _rightLable.backgroundColor = [UIColor whiteColor];
        _rightLable.text = @"无印良品";
        
        [_rightView addSubview:_rightImageView];
        [_rightView addSubview:_rightLable];
        
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
