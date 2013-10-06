//
//  VLMyNaviRootViewController.m
//  ViewsLifecircle
//
//  Created by bunny on 13-10-4.
//  Copyright (c) 2013年 bunny. All rights reserved.
//

#import "VLMyNaviRootViewController.h"

@interface VLMyNaviRootViewController ()

@end

@implementation VLMyNaviRootViewController
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [[NSBundle mainBundle] loadNibNamed:@"VLMyNaviRootViewController" owner:self options:nil];
    }
    return self;
}

- (void)awakeFromNib
{

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
