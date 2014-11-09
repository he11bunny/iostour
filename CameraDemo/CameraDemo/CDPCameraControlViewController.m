//
//  CDPCameraControlViewController.m
//  CameraDemo
//
//  Created by hzzhouguorui on 11/5/14.
//  Copyright (c) 2014 bunny. All rights reserved.
//

#import "CDPCameraControlViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface CDPCameraControlViewController ()
@property (nonatomic, strong) UIBarButtonItem *quit;
@end

@implementation CDPCameraControlViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cameraIsReady:) name:AVCaptureSessionDidStartRunningNotification object:nil];
    }
    return self;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)cameraIsReady:(NSNotification *)notification
{
    NSLog( @"TRACE %@ METHOD %s:%d ", @"DescriptionGoesHere", __func__, __LINE__ );
//    self.cameraViewTransform = CGAffineTransformScale(CGAffineTransformIdentity, 1.126, 1.126);
    //    [self setCameraViewTransformForMode:self.cameraParam.cameraFlashMode animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog( @"TRACE %@ METHOD %s:%d ", @"DescriptionGoesHere", __func__, __LINE__ );
    self.quit = [[UIBarButtonItem alloc] initWithTitle:@"quit" style:UIBarButtonItemStyleDone target:self action:@selector(quit:)];
    // Do any additional setup after loading the view from its nib.
}

-(void)quit:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog( @"TRACE %@ METHOD %s:%d ", @"DescriptionGoesHere", __func__, __LINE__ );
//    [self.navigationItem.backBarButtonItem setTarget:self];
//    [self.navigationItem.backBarButtonItem setAction:@selector(quit:)];
//    self.navigationItem.leftBarButtonItem = self.quit;
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog( @"TRACE %@ METHOD %s:%d ", @"DescriptionGoesHere", __func__, __LINE__ );
    self.navigationController.navigationItem.leftBarButtonItem = self.quit;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
