//
//  KeyboardViewController.m
//  KeyboardThings
//
//  Created by bunny on 13-9-27.
//  Copyright (c) 2013年 bunny. All rights reserved.
//

#import "KeyboardViewController.h"

@interface KeyboardViewController ()

@end

@implementation KeyboardViewController
@synthesize tfield = _tfield;
@synthesize tview = _tview;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tview.delegate = self;
    self.tfield.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

//tfield
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClick:(id)sender
{
}

@end
