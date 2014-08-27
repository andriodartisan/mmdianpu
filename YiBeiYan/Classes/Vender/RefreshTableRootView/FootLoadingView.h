//
//  ABFootLoadingCell.h
//  AibaIOS
//
//  Created by Rusher on 14-3-4.
//  Copyright (c) 2014年 Yonglang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    RSFootLoadingIdle = 0,
    RSFootLoadingBusy = 1,
    RSFootLoadingFinish = 2
}RSFootLoadingState;

@protocol RSFootLoadingDelegate;

@interface FootLoadingView : UIView

@property (nonatomic,strong) UIActivityIndicatorView  *activityIndicator;
@property (nonatomic,strong) UILabel *promptLabel;
@property (nonatomic,assign) RSFootLoadingState state;

@property (nonatomic,weak) id<RSFootLoadingDelegate> loadingDelegate;

-(void)loadingCellDidReachBottom:(UIScrollView *)scrollView;
-(void)loadingCellFastToLoad:(UIScrollView *)scrollView;

-(void)beginLoad;       // 开始加载
-(void)endLoading;      // 单次加载完成
-(void)finishLoading;   // 没有内容加载了

-(void)reset;

-(void)startAnimating;

@end


@protocol RSFootLoadingDelegate <NSObject>

-(void)loadingCellShouldStartToLoad;

@end