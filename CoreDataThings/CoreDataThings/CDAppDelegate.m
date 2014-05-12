//
//  CDAppDelegate.m
//  CoreDataThings
//
//  Created by guoruizhou on 11/5/13.
//  Copyright (c) 2013 guoruizhou. All rights reserved.
//

#import "CDAppDelegate.h"
#import "CDRootViewController.h"

@interface CDAppDelegate ()
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext2;
@end

@implementation CDAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectContext2 = _managedObjectContext2;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

static CDAppDelegate *_instance;

+(CDAppDelegate*)singleton
{
    if (!_instance) {
        NSLog(@"???? :-(");
    }
    return _instance;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"doc path:%@", [self applicationDocumentsDirectory].path);
    _instance = self;
    [self writeData];
    [self knowDiff];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[CDRootViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)writeData
{
    NSManagedObjectContext *context = [[CDAppDelegate singleton] managedObjectContext];
    NSManagedObjectContext *context2 = [self managedObjectContext2];
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    user.name = @"dd";
    
    RoleA *a = [NSEntityDescription insertNewObjectForEntityForName:@"RoleA" inManagedObjectContext:context];
    a.name = @"aa11";
    a.attA = @"aamore";
    
    RoleB *b = [NSEntityDescription insertNewObjectForEntityForName:@"RoleB" inManagedObjectContext:context];
    b.name = @"bb";
    b.attB = @"bbmore";
    
//    [context2 insertObject:a];
    
    NSLog(@"before save user id: %@", user.objectID);
    NSError *error;
    //    [context save:&error];
//    [context2 save:&error];
    NSLog(@"save info: %@", error);
    NSLog(@"user id: %@", user.objectID);
}

-(void)knowDiff
{
    NSManagedObjectContext *context = [[CDAppDelegate singleton] managedObjectContext];
    NSManagedObjectContext *context2 = [self managedObjectContext2];
    NSEntityDescription *descrip = [NSEntityDescription entityForName:@"RoleA" inManagedObjectContext:context];
    NSFetchRequest *req = [[NSFetchRequest alloc] init];
    [req setEntity:descrip];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"name == %@", @"aa"];
    [req setPredicate:pred];
    NSError *error;
    NSArray *res = [context executeFetchRequest:req error:&error];
    NSLog(@"fetch res: %@", res);
    RoleA *a = [res lastObject];
//    a.name = @"aanew";
    res = [context executeFetchRequest:req error:&error];
//    RoleA *olda = (RoleA*)[context objectWithID:a.objectID];
//    RoleA *acopy = [a copy];
//    RoleA *olda = [res lastObject];
    RoleA *a2 = [context2 objectWithID:a.objectID];
    NSLog(@"fetch res: %@", res);
    NSLog(@"a current %@", a.name);
//    NSLog(@"olda %@", olda.name);
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
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectContext *)managedObjectContext2
{
    if (_managedObjectContext2 != nil) {
        return _managedObjectContext2;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext2 = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext2 setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext2;
}


// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataThings" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreDataThings.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
