//
//  RDVGoodsTableViewCell.h
//  RDVTabBarController
//
//  Created by Sun on 14-8-15.
//  Copyright (c) 2014年 Robert Dimitrov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDVGoodsTableViewCell : UITableViewCell

@property (strong,nonatomic) NSArray *goodsArr;

@property(strong,nonatomic) UIView *leftView;
@property(strong,nonatomic) UIImageView *leftImageView;
@property(strong,nonatomic) UILabel *leftTitleLable;
@property(strong,nonatomic) UILabel *leftPriceLable;
@property(strong,nonatomic) UILabel *leftScoreLable;


@property(strong,nonatomic) UIView *rightView;
@property(strong,nonatomic) UIImageView *rightImageView;
@property(strong,nonatomic) UILabel *rightTitleLable;
@property(strong,nonatomic) UILabel *rightPriceLable;
@property(strong,nonatomic) UILabel *rightScoreLable;

@end
