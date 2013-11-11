//
//  TABTAppRootViewController.m
//  TabbarThings
//
//  Created by guoruizhou on 10/16/13.
//  Copyright (c) 2013 guoruizhou. All rights reserved.
//

#import "TABTAppRootViewController.h"
#import "TABTViewController.h"

@interface TABTAppRootViewController ()

@end

@implementation TABTAppRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)goto:(id)sender {
    UIViewController *mv = [[TABTViewController alloc] init];
    [self presentViewController:mv animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
