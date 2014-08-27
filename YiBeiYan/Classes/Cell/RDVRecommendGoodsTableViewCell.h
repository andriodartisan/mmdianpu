//
//  RDVRecommendGoodsTableViewCell.h
//  RDVTabBarController
//
//  Created by Sun on 14-8-15.
//  Copyright (c) 2014年 Robert Dimitrov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StrikeThroughLabel.h"

@interface RDVRecommendGoodsTableViewCell : UITableViewCell

@property(strong,nonatomic) UIView *view;

@property(strong,nonatomic) UIImageView *goodsImageView;

@property(strong,nonatomic) UIView *rightView;
@property(strong,nonatomic) UILabel *titleLabel;
@property(strong,nonatomic) UILabel *priceLabel;
@property(strong,nonatomic) StrikeThroughLabel *oldPriceLabel;
@property(strong,nonatomic) UILabel *rebateLabel;
@property(strong,nonatomic) UILabel *scoreLabel;
@property(strong,nonatomic) UILabel *isbaoyouLabel;

@end
