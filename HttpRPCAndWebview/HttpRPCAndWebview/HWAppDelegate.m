//
//  HWAppDelegate.m
//  HttpRPCAndWebview
//
//  Created by guoruizhou on 11/11/13.
//  Copyright (c) 2013 guoruizhou. All rights reserved.
//

#import "HWAppDelegate.h"
#import <NSHash/NSString+NSHash.h>
@implementation HWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
//    [self loginTest];
    [self logindevTest];
//    [self uplodImage];
    
    return YES;
}

-(void)loginTest
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *hashpass = [[[@"123123" SHA256] stringByAppendingString:@":alo7.com"] SHA256];
    NSDictionary *para = @{@"mobile_phone":@"15000654327", @"password_hash":hashpass};
    [manager POST:@"http://ischool.shuobaotang.com/auth/login.json" parameters:para success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [self uplodImage];
        [self uplodAudio];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(void)logindevTest
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *para = @{@"mobile_phone":@"15000654327"};
    [manager POST:@"http://ischool.shuobaotang.com/auth/dev_login.json" parameters:para success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [self uplodImage];
        [self uplodAudio];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(void)uplodAudio
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"amr"];
    NSURL *filePathUrl = [NSURL fileURLWithPath:filePath];
//    NSDictionary *para = @{@"mobile_phone":@"15000654327", @"password_hash":@""};
    [manager POST:@"http://ischool.shuobaotang.com/upload/mp3.json" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:filePathUrl name:@"content" error:nil];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSLog(@"Response: %@", operation);
    }];
}

-(void)uplodImage
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"jpg"];
    NSURL *filePathUrl = [NSURL fileURLWithPath:filePath];
    NSDictionary *para = @{@"makethumb":[[NSArray alloc] initWithObjects:@"200x130", nil]};
    [manager POST:@"http://ischool.shuobaotang.com/upload/img.json" parameters:para constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:filePathUrl name:@"content" error:nil];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSLog(@"Response: %@", operation);
    }];
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
