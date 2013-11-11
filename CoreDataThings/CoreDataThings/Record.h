//
//  Record.h
//  CoreDataThings
//
//  Created by guoruizhou on 11/7/13.
//  Copyright (c) 2013 guoruizhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Record : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSSet *owner;
@end

@interface Record (CoreDataGeneratedAccessors)

- (void)addOwnerObject:(User *)value;
- (void)removeOwnerObject:(User *)value;
- (void)addOwner:(NSSet *)values;
- (void)removeOwner:(NSSet *)values;

@end
