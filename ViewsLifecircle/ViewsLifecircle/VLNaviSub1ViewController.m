//
//  VLNaviSub1ViewController.m
//  ViewsLifecircle
//
//  Created by bunny on 13-10-4.
//  Copyright (c) 2013年 bunny. All rights reserved.
//

#import "VLNaviSub1ViewController.h"

@interface VLNaviSub1ViewController ()

@end

@implementation VLNaviSub1ViewController
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [[NSBundle mainBundle] loadNibNamed:@"VLNaviSub1ViewController" owner:self options:nil];
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
