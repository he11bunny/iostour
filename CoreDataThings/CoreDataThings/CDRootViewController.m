//
//  CDRootViewController.m
//  CoreDataThings
//
//  Created by guoruizhou on 11/5/13.
//  Copyright (c) 2013 guoruizhou. All rights reserved.
//

#import "CDRootViewController.h"

@interface CDRootViewController ()
@property UIView *content;
@end

@implementation CDRootViewController

- (CGRect) maximumUsableFrame
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat statusHeight = [UIApplication sharedApplication].statusBarHidden ? 0 : [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat navibarHeight = self.navigationController.navigationBarHidden ? 0 : self.navigationController.navigationBar.frame.size.height;
    CGFloat tabbarHeight = (self.tabBarController.tabBar.hidden || self.hidesBottomBarWhenPushed )? 0 : self.tabBarController.tabBar.frame.size.height;
    CGRect usableFrame = CGRectMake(0, 0, screenRect.size.width, screenRect.size.height - statusHeight - navibarHeight - tabbarHeight);
    
    NSLog(@"screen size: %@", NSStringFromCGRect(screenRect));
    NSLog(@"status height: %f", statusHeight);
    NSLog(@"navi height: %f",   navibarHeight);
    NSLog(@"tab height: %f",    tabbarHeight);
    NSLog(@"frame size %@",     NSStringFromCGRect(usableFrame));
    return usableFrame;
}


-(id)init
{
    self = [super init];
    if (self) {
        self.content = [[UIView alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
