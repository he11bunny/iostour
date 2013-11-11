//
//  VPViewController.m
//  ViewPos
//
//  Created by guoruizhou on 11/6/13.
//  Copyright (c) 2013 guoruizhou. All rights reserved.
//

#import "VPViewController.h"

@interface VPViewController ()
@property (nonatomic) UIView *contentView;
@end

@implementation VPViewController

- (CGRect) maximumUsableFrame
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat statusHeight = [UIApplication sharedApplication].statusBarHidden ? 0 : [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat navibarHeight = self.navigationController.navigationBarHidden ? 0 : self.navigationController.navigationBar.frame.size.height;
    CGFloat tabbarHeight = (self.tabBarController.tabBar.hidden || self.hidesBottomBarWhenPushed )? 0 : self.tabBarController.tabBar.frame.size.height;
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    CGRect usableFrame;
    if (version < 7.0) {
        usableFrame = CGRectMake(0, 0, screenRect.size.width, screenRect.size.height  - navibarHeight - tabbarHeight);
    }
    else
    {
        usableFrame = CGRectMake(0, navibarHeight, screenRect.size.width, screenRect.size.height - navibarHeight - tabbarHeight);
    }
    
    NSLog(@"screen size: %@", NSStringFromCGRect(screenRect));
    NSLog(@"status height: %f", statusHeight);
    NSLog(@"navi height: %f",   navibarHeight);
    NSLog(@"tab height: %f",    tabbarHeight);
    NSLog(@"frame size %@",     NSStringFromCGRect(usableFrame));
    return usableFrame;
}

-(UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
    }
    return _contentView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.contentView.frame = [self maximumUsableFrame];
    self.contentView.backgroundColor = [UIColor blueColor];
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.contentView];
}

@end
