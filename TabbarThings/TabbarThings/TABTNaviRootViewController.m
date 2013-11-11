//
//  TABTNaviRootViewController.m
//  TabbarThings
//
//  Created by guoruizhou on 10/16/13.
//  Copyright (c) 2013 guoruizhou. All rights reserved.
//

#import "TABTNaviRootViewController.h"

@interface TABTNaviRootViewController ()

@end

@implementation TABTNaviRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)goto:(id)sender {
    UIViewController *vc = [[UIViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
