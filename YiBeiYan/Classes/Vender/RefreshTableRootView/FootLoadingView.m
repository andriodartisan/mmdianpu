//
//  ABFootLoadingCell.m
//  AibaIOS
//
//  Created by Rusher on 14-3-4.
//  Copyright (c) 2014年 Yonglang. All rights reserved.
//

#import "FootLoadingView.h"
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
@interface FootLoadingView()


@end

@implementation FootLoadingView

- (id)init
{
    self = [super init];
    if (self) {
        [self commoooooooonInit];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commoooooooonInit];
    }
    return self;
}

-(void)commoooooooonInit
{
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityIndicator.frame = CGRectMake(0, 0, 30, 30);
    self.activityIndicator.hidesWhenStopped = YES;
    [self addSubview:self.activityIndicator];
    
    self.promptLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 20)];
    self.promptLabel.text = @"没有内容了";
    self.promptLabel.textAlignment = NSTextAlignmentCenter;
    self.promptLabel.textColor = RGB(174, 173, 173);
    self.promptLabel.font = [UIFont systemFontOfSize:18.0f];
    [self addSubview:self.promptLabel];
    self.promptLabel.hidden = YES;
    
    self.state = RSFootLoadingIdle;
}


-(void)layoutSubviews
{
    CGRect activityIndicatorFrame = self.activityIndicator.frame;
    activityIndicatorFrame.origin.x = (CGRectGetWidth(self.bounds) - CGRectGetWidth(activityIndicatorFrame))/2 ,
    activityIndicatorFrame.origin.y = (CGRectGetHeight(self.bounds) - CGRectGetHeight(activityIndicatorFrame))/2;
    self.activityIndicator.frame = activityIndicatorFrame;
    
    CGRect promptFrame = self.promptLabel.frame;
    promptFrame.origin.x = (CGRectGetWidth(self.bounds) - CGRectGetWidth(promptFrame))/2 ,
    promptFrame.origin.y = (CGRectGetHeight(self.bounds) - CGRectGetHeight(promptFrame))/2;
    self.promptLabel.frame = promptFrame;
}

-(void)loadingCellDidReachBottom:(UIScrollView *)scrollView
{
    if (scrollView.contentSize.height - scrollView.contentOffset.y <= CGRectGetHeight(scrollView.bounds) && (self.state== RSFootLoadingIdle)) {
        [self beginLoad];
        if ([self.loadingDelegate respondsToSelector:@selector(loadingCellShouldStartToLoad)]) {
            [self.loadingDelegate loadingCellShouldStartToLoad];
        }
    }
}

-(void)loadingCellFastToLoad:(UIScrollView *)scrollView
{
    [self beginLoad];
    if ([self.loadingDelegate respondsToSelector:@selector(loadingCellShouldStartToLoad)]) {
        [self.loadingDelegate loadingCellShouldStartToLoad];
    }
}

-(void)reset
{
    self.state = RSFootLoadingIdle;
}

-(void)beginLoad
{
    if (self.state == RSFootLoadingIdle) {
        self.state = RSFootLoadingBusy;
    }
}

-(void)endLoading
{
    if (self.state == RSFootLoadingBusy) {
        self.state = RSFootLoadingIdle;
    }
}

-(void)finishLoading
{
    self.state = RSFootLoadingFinish;
}

-(void)startAnimating
{
    if (self.state == RSFootLoadingBusy)
    {
        [self.activityIndicator startAnimating];
    }
}

-(void)setState:(RSFootLoadingState)state
{
    _state = state;
    switch (state) {
        case RSFootLoadingIdle:
        {
            self.promptLabel.hidden = YES;
            break;
        }
        case RSFootLoadingBusy:
        {
            self.promptLabel.hidden = YES;
            [self.activityIndicator startAnimating];
            break;
        }
        case RSFootLoadingFinish:
        {
            self.promptLabel.hidden = NO;
            [self.activityIndicator stopAnimating];
            break;
        }
    }
}

@end
