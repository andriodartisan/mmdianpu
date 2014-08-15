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
@property(strong,nonatomic) UILabel *leftLable;

@property(strong,nonatomic) UIView *rightView;
@property(strong,nonatomic) UIImageView *rightImageView;
@property(strong,nonatomic) UILabel *rightLable;

@end
