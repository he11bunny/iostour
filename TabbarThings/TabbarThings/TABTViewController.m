//
//  TABTViewController.m
//  TabbarThings
//
//  Created by guoruizhou on 10/15/13.
//  Copyright (c) 2013 guoruizhou. All rights reserved.
//

#import "TABTViewController.h"
#import "TABTNaviRootViewController.h"

@interface TABTViewController ()

@end

@implementation TABTViewController
-(id)init
{
    self = [super init];
    if (self) {
        UIViewController *vc1 = [[UIViewController alloc] init];
        vc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"v1" image:[UIImage imageNamed:@"tabachievement-h"] selectedImage:[UIImage imageNamed:@"tabachievement-h"]];
        
        UIViewController *vc2 = [[UIViewController alloc] init];
        vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"v2" image:[UIImage imageNamed:@"tabachievement-h"] selectedImage:[UIImage imageNamed:@"tabachievement-h"]];
        
        UIViewController *vc3 = [[UIViewController alloc] init];
        vc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"v3" image:[UIImage imageNamed:@"tabachievement-h"] selectedImage:[UIImage imageNamed:@"tabachievement-h"]];
        
        UIViewController *vc4 = [[UIViewController alloc] init];
        vc4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"v4" image:[UIImage imageNamed:@"tabachievement-h"] selectedImage:[UIImage imageNamed:@"tabachievement-h"]];
        
        UIViewController *vc5 = [[UIViewController alloc] init];
        vc5.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"v5" image:[UIImage imageNamed:@"tabachievement-h"] selectedImage:[UIImage imageNamed:@"tabachievement-h"]];
        
        UIViewController *vc6 = [[UIViewController alloc] init];
        vc6.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"v6" image:[UIImage imageNamed:@"tabachievement-h"] selectedImage:[UIImage imageNamed:@"tabachievement-h"]];
        
        UIViewController *vc7 = [[UIViewController alloc] init];
        vc7.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"v7" image:[UIImage imageNamed:@"tabachievement-h"] selectedImage:[UIImage imageNamed:@"tabachievement-h"]];
        
        UINavigationController *vc8 = [[UINavigationController alloc] initWithRootViewController:[[TABTNaviRootViewController alloc] initWithNibName:@"TABTNaviRootViewController" bundle:nil]];
        vc8.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"v8" image:[UIImage imageNamed:@"tabachievement-h"] selectedImage:[UIImage imageNamed:@"tabachievement-h"]];
        
        self.viewControllers = [[NSArray alloc ] initWithObjects:vc1, vc2, vc3, vc4, vc5, vc6, vc7, vc8, nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
