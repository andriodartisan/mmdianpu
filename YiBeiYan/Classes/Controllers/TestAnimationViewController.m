//
//  TestAnimationViewController.m
//  RDVTabBarController
//
//  Created by Sun on 14-8-19.
//  Copyright (c) 2014年 Robert Dimitrov. All rights reserved.
//

#import "TestAnimationViewController.h"

@interface TestAnimationViewController ()
@property (strong,nonatomic) UIButton * btn1;

@end

@implementation TestAnimationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"动画测试";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blueColor]];
    // Do any additional setup after loading the view.
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
    [imageview setImage:[UIImage imageNamed:@"bag11_double"]];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 70, 70)];
    [btn addSubview:imageview];
    [btn addTarget:self action:@selector(doanimation:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 270, 70, 70)];
    self.btn1.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:btn];
    [self.view addSubview:self.btn1];
}

-(void)doanimation:(UIButton*)sender{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @200;
    animation.toValue = @455;
    animation.duration = 4;
    
    [sender.layer addAnimation:animation forKey:@"basic"];
    sender.layer.position = CGPointMake(100, 200);
    
    animation.beginTime = CACurrentMediaTime() + 1;
    [self.btn1.layer addAnimation:animation forKey:@"basic"];
    
//    //初始化
//    CALayer *kkLayer = [[CALayer alloc]init];
//    kkLayer.backgroundColor = [[UIColor grayColor]CGColor];
//    kkLayer.frame = self.btn1.frame;
//    // 设定它的frame
//    kkLayer.cornerRadius = 5;// 圆角处理
//    [self.btn1.layer addSublayer:kkLayer]; // 增加到UIView的layer上面
//    // 移动kkLayer的position
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
//    animation.fromValue = [NSValue valueWithCGPoint:kkLayer.position];
//    CGPoint toPoint = kkLayer.position; toPoint.x += 180;
//    animation.toValue = [NSValue valueWithCGPoint:toPoint];
//    // 以x轴进行旋转
//    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"]; rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
//    rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
//    // 对kkLayer进行放大缩小
//    CABasicAnimation *scaoleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"]; scaoleAnimation.duration = 3;
//    scaoleAnimation.autoreverses = YES;
//    scaoleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
//    scaoleAnimation.toValue = [NSNumber numberWithFloat:2.5];
//    scaoleAnimation.fillMode = kCAFillModeForwards;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
