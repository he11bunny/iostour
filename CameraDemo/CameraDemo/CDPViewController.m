//
//  CDPViewController.m
//  CameraDemo
//
//  Created by hzzhouguorui on 11/5/14.
//  Copyright (c) 2014 bunny. All rights reserved.
//

#import "CDPViewController.h"
#import "CDPCameraControlViewController.h"

@interface CDPViewController ()

@end

@implementation CDPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
//    self.sourceType = UIImagePickerControllerSourceTypeCamera;
//    self.delegate = self;
//    self.allowsEditing = NO;
//    self.showsCameraControls = NO;
//    self.cameraDevice = self.cameraParam.cameraDevice;
//    self.cameraFlashMode = self.cameraParam.cameraFlashMode;
//    self.cameraViewTransform = CGAffineTransformScale(CGAffineTransformIdentity, 1.126, 1.126);
}
- (IBAction)popCamera:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [self popCameraVC];
    }
    
//    [self presentViewController:vc animated:YES completion:^{
//        NSLog( @"TRACE %@ METHOD %s:%d ", @"pop finish", __func__, __LINE__ );
//    }];
}

-(void)popCameraVC
{
    NSLog( @"TRACE %@ METHOD %s:%d ", @"DescriptionGoesHere", __func__, __LINE__ );
    CDPCameraControlViewController *vc = [[CDPCameraControlViewController alloc] initWithNibName:@"CDPCameraControlViewController" bundle:nil];
    NSLog( @"TRACE %@ METHOD %s:%d ", @"after CDPCameraControlViewController init", __func__, __LINE__ );
    vc.sourceType = UIImagePickerControllerSourceTypeCamera;
    vc.modalPresentationStyle = UIModalPresentationCurrentContext;
    vc.delegate = vc;
    vc.allowsEditing = NO;
    vc.showsCameraControls = NO;
//    vc.cameraDevice = UIImagePickerControllerCameraDeviceRear;
//    vc.cameraFlashMode = UIImagePickerControllerCameraFlashModeOff;
//    vc.cameraViewTransform = CGAffineTransformIdentity;
    
    [self presentViewController:vc animated:YES completion:^{
        
    }];
//    
//    [self addChildViewController:vc];
//    [self.view addSubview:vc.view];
//    [vc didMoveToParentViewController:self];
}

@end
