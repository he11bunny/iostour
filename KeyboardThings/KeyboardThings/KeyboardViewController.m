//
//  KeyboardViewController.m
//  KeyboardThings
//
//  Created by bunny on 13-9-27.
//  Copyright (c) 2013年 bunny. All rights reserved.
//

#import "KeyboardViewController.h"

@interface KeyboardViewController ()
@property UIView * barview;
@property UIView *dummybarview;
@end

@implementation KeyboardViewController
@synthesize tfield = _tfield;
@synthesize tview = _tview;
@synthesize barview;
@synthesize dummybarview;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tview.delegate = self;
    self.tfield.delegate = self;
    barview = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 10, 320, 10)];
    dummybarview = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 10, 320, 10)];
    UIView *dummyinputview = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 10, 320, 10)];
    barview.backgroundColor = [UIColor redColor];
    dummybarview.backgroundColor = [UIColor redColor];
    dummyinputview.backgroundColor = [UIColor blueColor];
    self.tfield.inputAccessoryView = barview;
    self.tview.inputAccessoryView = barview;
    self.tview.inputView = dummyinputview;
    [self.view addSubview:dummybarview];

    // Do any additional setup after loading the view, typically from a nib.
}



//tfield
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    dummybarview.hidden = YES;
    NSLog(@"%@ - %@", [textField class], @"textFieldShouldBeginEditing");
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"%@ - %@", [textField class], @"textFieldDidBeginEditing");
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    //dummybarview.hidden = NO;
    NSLog(@"%@ - %@", [textField class], @"textFieldShouldEndEditing");
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"%@ - %@", [textField class], @"textFieldDidEndEditing");
    dummybarview.hidden = NO;
    //[self.view addSubview:barview];
}

//tview
- (BOOL)textViewShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"%@ - %@", [textField class], @"textFieldShouldBeginEditing");
    return YES;
}

- (void)textViewDidBeginEditing:(UITextField *)textField
{
    NSLog(@"%@ - %@", [textField class], @"textFieldDidBeginEditing");
}

- (BOOL)textViewShouldEndEditing:(UITextField *)textField
{
    NSLog(@"%@ - %@", [textField class], @"textFieldShouldEndEditing");
    return YES;
}

- (void)textViewDidEndEditing:(UITextField *)textField
{
    NSLog(@"%@ - %@", [textField class], @"textFieldDidEndEditing");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClick:(id)sender
{
    [self.tview resignFirstResponder];
}

@end
