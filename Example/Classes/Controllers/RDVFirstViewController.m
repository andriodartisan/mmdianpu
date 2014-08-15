// RDVFirstViewController.m
// RDVTabBarController
//
// Copyright (c) 2013 Robert Dimitrov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "RDVFirstViewController.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "ILBarButtonItem.h"

#import "SubCateViewController.h"

@interface RDVFirstViewController ()

@property (strong , nonatomic) NSArray *subClass;

@end

@implementation RDVFirstViewController
@synthesize subClass = _subClass;

-(NSArray *)cates{
    if (_cates == nil){
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"Category" withExtension:@"plist"];
        _cates = [NSArray arrayWithContentsOfURL:url];
    }
    return _cates;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"首页";
    }
    return self;
}

#pragma mark - View lifecycle

-(void)viewWillAppear:(BOOL)animated{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [[self rdv_tabBarItem] setBadgeValue:@"3"];
    
    if (self.rdv_tabBarController.tabBar.translucent) {
        UIEdgeInsets insets = UIEdgeInsetsMake(0,
                                               0,
                                               CGRectGetHeight(self.rdv_tabBarController.tabBar.frame),
                                               0);
        
        self.tableView.contentInset = insets;
        self.tableView.scrollIndicatorInsets = insets;
    }
    
    /* Left bar button item */
    ILBarButtonItem *leftBtn =
    [ILBarButtonItem barItemWithImage:[UIImage imageNamed:@"fragment_left_default"]
                        selectedImage:[UIImage imageNamed:@"fragment_left_default"]
                               target:self
                               action:@selector(leftTapped:)];
    
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    /* Right bar button item */
    ILBarButtonItem *rightBtn =
    [ILBarButtonItem barItemWithTitle:@"Start"
                           themeColor:[UIColor redColor]
                               target:self
                               action:@selector(rightTapped:)];
    
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    NSDictionary *cate = [self.cates objectAtIndex:1]; //测试用
    _subClass = [cate objectForKey:@"subClass"];
    
    NSDictionary *dictTitle=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    [self.navigationController.navigationBar setTitleTextAttributes:dictTitle];
    
    self.navigationController.navigationBar.translucent=NO;
    self.navigationController.navigationBar.barTintColor  = [UIColor colorWithRed:242.0f/255.0f green:141.0f/255.0f blue:114.0f/255.0f alpha:1];
    self.navigationController.navigationBar.backgroundColor  = [UIColor colorWithRed:242.0f/255.0f green:141.0f/255.0f blue:114.0f/255.0f alpha:1];
    
    NSLog(@" bar tint color %@",self.navigationController.navigationBar.barTintColor);
    
}

- (IBAction)leftTapped:(id)sender {
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Left button tapped"
//                                                    message:nil
//                                                   delegate:self
//                                          cancelButtonTitle:@"Great!"
//                                          otherButtonTitles:nil];
//	[alert show];
    if (_typesView) {
        [self removeTopAndBottom];
        return;
    }
    _typesView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    _typesView.backgroundColor = [UIColor grayColor];
    int btnX = 0;
    int btnY = 0;
    int btnWidth = 320 / 3;
    int btnHeight = 40;
    for (int i=0; i < _subClass.count; i++) {
        [[_subClass objectAtIndex:i] objectForKey:@"name"];
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(btnX, btnY, btnWidth, btnHeight)];
        [btn setTitle:[[_subClass objectAtIndex:i] objectForKey:@"name"] forState:UIControlStateNormal];
        [btn.layer setMasksToBounds:YES];
        [btn.layer setBorderWidth:1.0];
        [btn.layer setBorderColor:(__bridge CGColorRef)([UIColor whiteColor])];
        btn.tag = i;
        [btn addTarget:self action:@selector(selectTypes:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
        btnX += btnWidth;
        if (btnX >= 318) {
            btnX = 0;
            btnY += btnHeight;
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, btnY, 320, 1)];
            lineView.backgroundColor = [UIColor greenColor];
            [_typesView addSubview:lineView];
        }
        [_typesView addSubview:btn];
        if (i == _subClass.count - 1 && btnX < 318) {
            btnY += btnHeight;
        }
    }
    _typesView.frame = CGRectMake(0, 0, 320, btnY);
    UIView *lineY1 = [[UIView alloc] initWithFrame:CGRectMake(320/3, 0, 1, btnY)];
    lineY1.backgroundColor = [UIColor greenColor];
    [_typesView addSubview:lineY1];
    
    UIView *lineY2 = [[UIView alloc] initWithFrame:CGRectMake(320/3 + 1 + 320/3, 0, 1, btnY)];
    lineY2.backgroundColor = [UIColor greenColor];
    [_typesView addSubview:lineY2];

    [self.view addSubview:_typesView];
    
    CGRect frame = [self.view convertRect:self.view.bounds toView:nil];
    CGRect mainframe = [[UIScreen mainScreen] applicationFrame];
    
    NSLog(@"fram X = %f Y = %f width = %f height = %f ",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
    NSLog(@"mainframe X = %f Y = %f width = %f height = %f ",mainframe.origin.x,mainframe.origin.y,mainframe.size.width,mainframe.size.height);
    
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, frame.origin.y + btnY, mainframe.size.width, mainframe.size.height - frame.origin.y - btnY + 20)];
    _bottomView.userInteractionEnabled = YES;
    [_bottomView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTopAndBottom)] ];
    _bottomView.backgroundColor = [UIColor grayColor];
    _bottomView.alpha = 0.5;
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:_bottomView];
    
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mainframe.size.width, frame.origin.y)];
    _topView.userInteractionEnabled = YES;
    [_topView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTopAndBottom)] ];
    _topView.backgroundColor = [UIColor grayColor];
    _topView.alpha = 0.5;
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:_topView];
    

}

-(IBAction)selectTypes:(UIButton *)sender{
    self.title = [[_subClass objectAtIndex:sender.tag] objectForKey:@"name"];
    [self removeTopAndBottom];
}

-(void)removeTopAndBottom{
    [_typesView removeFromSuperview];
    [_topView removeFromSuperview];
    [_bottomView removeFromSuperview];
    _typesView = nil;
    _topView = nil;
    _bottomView = nil;
}

- (IBAction)rightTapped:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Right button tapped"
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"Great!"
                                          otherButtonTitles:nil];
	[alert show];
}

- (NSUInteger)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return UIInterfaceOrientationMaskAll;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return YES;
    }
    return toInterfaceOrientation == UIInterfaceOrientationPortrait;
}

#pragma mark - Methods

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@ Controller Cell %d", self.title, indexPath.row]];
}

#pragma mark - Table view

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [self configureCell:cell forIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [[self rdv_tabBarItem] setBadgeValue:[NSString stringWithFormat:@"%d", indexPath.row+1]];
    
    [[self rdv_tabBarController] setTabBarHidden:!self.rdv_tabBarController.tabBarHidden animated:YES];
}

@end